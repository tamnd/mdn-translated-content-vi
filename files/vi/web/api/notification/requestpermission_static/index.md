---
title: "Notification: phương thức tĩnh requestPermission()"
short-title: requestPermission()
slug: Web/API/Notification/requestPermission_static
page-type: web-api-static-method
browser-compat: api.Notification.requestPermission_static
---

{{APIRef("Web Notifications")}}{{securecontext_header}}

Phương thức tĩnh **`requestPermission()`** của giao diện {{domxref("Notification")}} yêu cầu người dùng cấp quyền cho origin hiện tại để hiển thị thông báo.

Phương thức này trả về một {{jsxref("Promise")}} sẽ hoàn tất với một chuỗi cho biết quyền đã được cấp hay bị từ chối.

## Cú pháp

```js-nolint
Notification.requestPermission()

// Cú pháp cũ dùng callback
Notification.requestPermission(callback)
```

### Tham số

- `callback` {{optional_inline}} {{deprecated_inline}}
  - : Một hàm callback tùy chọn được gọi với giá trị quyền.
    Đã lỗi thời, nên dùng giá trị trả về {{jsxref("Promise")}} thay thế.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một chuỗi với quyền mà người dùng chọn.
Các giá trị có thể là:

- `granted`
  - : Người dùng đã cấp rõ ràng quyền cho origin hiện tại để hiển thị thông báo hệ thống.
- `denied`
  - : Người dùng đã từ chối rõ ràng quyền cho origin hiện tại để hiển thị thông báo hệ thống.
- `default`
  - : Quyết định của người dùng chưa rõ; trong trường hợp này ứng dụng sẽ hành xử như thể quyền là `denied`.

Phiên bản lỗi thời của phương thức trả về `undefined`.

## Ví dụ

Giả sử HTML cơ bản này:

```html
<button>Notify me!</button>
```

Có thể gửi thông báo như sau. Ở đây chúng ta trình bày một ví dụ khá dài và đầy đủ mà bạn có thể dùng nếu muốn trước tiên kiểm tra xem thông báo có được hỗ trợ hay không, sau đó kiểm tra xem quyền đã được cấp cho origin hiện tại chưa, rồi yêu cầu quyền nếu cần, trước khi gửi thông báo.

Lưu ý rằng yêu cầu nên được thực hiện để đáp lại tương tác của người dùng: bên dưới, phương thức được gọi trong trình xử lý sự kiện click.

```js
document.querySelector("button").addEventListener("click", notifyMe);

function notifyMe() {
  if (!("Notification" in window)) {
    // Kiểm tra xem trình duyệt có hỗ trợ thông báo hay không
    alert("This browser does not support desktop notification");
  } else if (Notification.permission === "granted") {
    // Kiểm tra xem quyền hiển thị thông báo đã được cấp chưa;
    // nếu rồi thì tạo thông báo
    const notification = new Notification("Hi there!");
    // …
  } else if (Notification.permission !== "denied") {
    // Chúng ta cần hỏi quyền từ người dùng
    Notification.requestPermission().then((permission) => {
      // Nếu người dùng chấp nhận, hãy tạo thông báo
      if (permission === "granted") {
        const notification = new Notification("Hi there!");
        // …
      }
    });
  }

  // Cuối cùng, nếu người dùng đã từ chối thông báo và bạn
  // muốn tôn trọng lựa chọn đó thì không cần làm phiền họ nữa.
}
```

Chúng tôi không còn hiển thị mẫu trực tiếp trên trang này nữa, vì Chrome và Firefox không còn cho phép yêu cầu quyền thông báo từ các {{htmlelement("iframe")}} cùng origin chéo, và các trình duyệt khác cũng sẽ theo sau. Để xem ví dụ hoạt động, hãy xem [ví dụ To-do list](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API) của chúng tôi (cũng xem [ứng dụng đang chạy trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
