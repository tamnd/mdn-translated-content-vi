---
title: Notification
slug: Web/API/Notification
page-type: web-api-interface
browser-compat: api.Notification
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Giao diện **`Notification`** của {{domxref("Notifications API", "", "", "nocode")}} được dùng để cấu hình và hiển thị thông báo trên màn hình cho người dùng.

Hình thức và chức năng cụ thể của các thông báo này thay đổi tùy theo nền tảng, nhưng nhìn chung chúng cung cấp một cách để truyền thông tin cho người dùng một cách bất đồng bộ.

{{InheritanceDiagram}}

## Constructor

- {{domxref("Notification.Notification", "Notification()")}}
  - : Tạo một thể hiện mới của đối tượng `Notification`.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("Notification.permission_static", "Notification.permission")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị quyền hiện tại để hiển thị thông báo. Các giá trị có thể là:
    - `denied` - Người dùng từ chối hiển thị thông báo.
    - `granted` - Người dùng chấp nhận hiển thị thông báo.
    - `default` - Chưa biết lựa chọn của người dùng, vì vậy trình duyệt sẽ hành xử như thể giá trị là denied.

- {{domxref("Notification.maxActions_static", "Notification.maxActions")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Số lượng hành động tối đa được thiết bị và User Agent hỗ trợ.

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("Notification.actions")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Mảng hành động của thông báo, được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.badge")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa URL của ảnh dùng để đại diện cho thông báo khi không đủ chỗ để hiển thị chính thông báo đó, ví dụ như trên thanh thông báo Android. Trên thiết bị Android, ảnh badge nên hỗ trợ độ phân giải tới 4x, khoảng 96 x 96 px, và ảnh sẽ tự động bị che mặt nạ.
- {{domxref("Notification.body")}} {{ReadOnlyInline}}
  - : Chuỗi nội dung của thông báo, được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.data")}} {{ReadOnlyInline}}
  - : Trả về một bản sao cấu trúc của dữ liệu thông báo.
- {{domxref("Notification.dir")}} {{ReadOnlyInline}}
  - : Hướng văn bản của thông báo, được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.icon")}} {{ReadOnlyInline}}
  - : URL của ảnh được dùng làm biểu tượng của thông báo, được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.image")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : URL của ảnh được hiển thị như một phần của thông báo, được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.lang")}} {{ReadOnlyInline}}
  - : Mã ngôn ngữ của thông báo, được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.navigate")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : URL điều hướng của thông báo. Khi được đặt, kích hoạt thông báo sẽ điều hướng tới URL này thay vì phát sự kiện {{domxref("Notification.click_event", "click")}} hoặc {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}}.
- {{domxref("Notification.renotify")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chỉ định xem người dùng có nên được thông báo lại sau khi một thông báo mới thay thế thông báo cũ hay không.
- {{domxref("Notification.requireInteraction")}} {{ReadOnlyInline}}
  - : Giá trị boolean cho biết thông báo phải còn hoạt động cho đến khi người dùng bấm hoặc đóng, thay vì tự động biến mất.
- {{domxref("Notification.silent")}} {{ReadOnlyInline}}
  - : Chỉ định xem thông báo có nên im lặng hay không, tức là không phát âm thanh hoặc rung, bất kể cài đặt thiết bị.
- {{domxref("Notification.tag")}} {{ReadOnlyInline}}
  - : ID của thông báo, nếu có, như được chỉ định trong tham số `options` của constructor.
- {{domxref("Notification.timestamp")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chỉ định thời điểm thông báo được tạo hoặc áp dụng, có thể là quá khứ, hiện tại hoặc tương lai.
- {{domxref("Notification.title")}} {{ReadOnlyInline}}
  - : Tiêu đề của thông báo, như được chỉ định trong tham số đầu tiên của constructor.
- {{domxref("Notification.vibrate")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Chỉ định một mẫu rung cho các thiết bị có phần cứng rung.

## Phương thức tĩnh

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("Notification.requestPermission_static", "Notification.requestPermission()")}}
  - : Yêu cầu quyền từ người dùng để hiển thị thông báo.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("Notification.close()")}}
  - : Đóng thông báo theo cách lập trình.

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("Notification.click_event", "click")}}
  - : Phát ra khi người dùng bấm vào thông báo.
- {{domxref("Notification.close_event", "close")}}
  - : Phát ra khi người dùng đóng thông báo.
- {{domxref("Notification.error_event", "error")}}
  - : Phát ra khi thông báo gặp lỗi.
- {{domxref("Notification.show_event", "show")}}
  - : Phát ra khi thông báo được hiển thị.

## Ví dụ

Giả sử HTML cơ bản này:

```html
<button>Notify me!</button>
```

Có thể gửi thông báo như sau. Ở đây chúng ta trình bày một ví dụ khá dài và đầy đủ mà bạn có thể dùng nếu muốn trước tiên kiểm tra xem thông báo có được hỗ trợ hay không, sau đó kiểm tra xem quyền hiển thị thông báo cho origin hiện tại đã được cấp chưa, rồi yêu cầu quyền nếu cần, trước khi gửi thông báo.

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
    // Chúng ta cần xin quyền từ người dùng
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

Chúng tôi không còn hiển thị mẫu trực tiếp trên trang này nữa, vì Chrome và Firefox không còn cho phép yêu cầu quyền thông báo từ các {{htmlelement("iframe")}} cùng origin chéo, và các trình duyệt khác cũng sẽ sớm theo sau. Để xem ví dụ hoạt động, hãy xem [ví dụ To-do list](/en-US/docs/Web/API/Notification/Using_the_Notifications_API) của chúng tôi.

> [!NOTE]
> Trong ví dụ trên, chúng ta tạo thông báo để đáp lại một cử chỉ của người dùng (bấm nút). Đây không chỉ là thực hành tốt nhất - bạn không nên làm phiền người dùng bằng những thông báo mà họ không đồng ý - mà trong tương lai trình duyệt sẽ còn chủ động chặn các thông báo không được kích hoạt bởi cử chỉ của người dùng. Firefox đã làm điều này từ phiên bản 72, chẳng hạn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
