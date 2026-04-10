---
title: "Notification: thuộc tính tĩnh permission"
short-title: permission
slug: Web/API/Notification/permission_static
page-type: web-api-static-property
browser-compat: api.Notification.permission_static
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính tĩnh chỉ đọc **`permission`** của giao diện {{domxref("Notification")}}
cho biết quyền hiện tại mà người dùng đã cấp cho origin hiện tại để hiển thị thông báo web.

## Giá trị

Một chuỗi biểu thị quyền hiện tại. Giá trị có thể là:

- `granted`
  - : Người dùng đã cấp rõ ràng quyền cho origin hiện tại để hiển thị thông báo hệ thống.
- `denied`
  - : Người dùng đã từ chối rõ ràng quyền cho origin hiện tại để hiển thị thông báo hệ thống.
- `default`
  - : Quyết định của người dùng chưa rõ; trong trường hợp này ứng dụng sẽ hành xử như thể quyền là `denied`.

## Ví dụ

Đoạn mã sau có thể dùng nếu bạn muốn trước tiên kiểm tra xem thông báo có được hỗ trợ hay không, sau đó kiểm tra xem quyền hiển thị thông báo cho origin hiện tại đã được cấp chưa, rồi yêu cầu quyền nếu cần, trước khi gửi thông báo.

```js
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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Notifications API](/en-US/docs/Web/API/Notifications_API)
- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
- [Permissions API](/en-US/docs/Web/API/Permissions_API)
- [Dùng Permissions API](/en-US/docs/Web/API/Permissions_API/Using_the_Permissions_API)
