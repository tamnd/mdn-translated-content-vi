---
title: "ServiceWorkerRegistration: phương thức showNotification()"
short-title: showNotification()
slug: Web/API/ServiceWorkerRegistration/showNotification
page-type: web-api-instance-method
browser-compat: api.ServiceWorkerRegistration.showNotification
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}} {{AvailableInWorkers}}

**`showNotification()`** là phương thức của giao diện {{domxref("ServiceWorkerRegistration")}} tạo một thông báo trên một service worker đang hoạt động.

## Cú pháp

```js-nolint
showNotification(title)
showNotification(title, options)
```

### Tham số

- `title`
  - : Xác định tiêu đề cho thông báo, tiêu đề này được hiển thị ở đầu cửa sổ thông báo.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa bất kỳ thiết lập tùy chỉnh nào bạn muốn áp dụng cho thông báo. Các tùy chọn khả dụng là:
    - `actions` {{optional_inline}} {{experimental_inline}}
      - : Một mảng các hành động để hiển thị trong thông báo, mặc định là một mảng rỗng. Mỗi phần tử trong mảng có thể là một đối tượng với các thành viên sau:
        - `action`
          - : Một chuỗi xác định hành động của người dùng sẽ được hiển thị trên thông báo.
        - `title`
          - : Một chuỗi chứa văn bản hành động sẽ hiển thị cho người dùng.
        - `icon` {{optional_inline}}
          - : Một chuỗi chứa URL của biểu tượng sẽ hiển thị cùng hành động.
        - `navigate` {{optional_inline}} {{experimental_inline}}
          - : Một chuỗi chứa URL để điều hướng tới khi người dùng kích hoạt hành động này. Khi được đặt, user agent sẽ điều hướng đến URL này thay vì kích hoạt sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}}. Xem {{domxref("Notification.navigate")}} để biết thêm thông tin.

        Các phản hồi phù hợp được tạo bằng cách dùng `event.action` trong sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}}.

    - `badge` {{optional_inline}} {{experimental_inline}}
      - : Một chuỗi chứa URL của ảnh được dùng để biểu diễn thông báo khi không đủ chỗ để hiển thị chính thông báo; ví dụ như thanh thông báo của Android. Trên thiết bị Android, huy hiệu nên hỗ trợ độ phân giải tới 4x, khoảng 96x96px, và ảnh sẽ tự động được che mặt nạ.
    - `body` {{optional_inline}}
      - : Một chuỗi biểu thị phần nội dung của thông báo, được hiển thị bên dưới tiêu đề. Mặc định là chuỗi rỗng.
    - `data` {{optional_inline}} {{experimental_inline}}
      - : Dữ liệu tùy ý mà bạn muốn gắn với thông báo. Đây có thể là bất kỳ kiểu dữ liệu [structured-clonable](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm#supported_types) nào. Mặc định là `null`.
    - `dir` {{optional_inline}}
      - : Hướng hiển thị của thông báo. Mặc định là `auto`, tức là kế thừa hành vi cài đặt ngôn ngữ của trình duyệt, nhưng bạn có thể ghi đè bằng cách đặt `ltr` và `rtl` (mặc dù hầu hết trình duyệt dường như bỏ qua các cài đặt này).
    - `icon` {{optional_inline}}
      - : Một chuỗi chứa URL của biểu tượng sẽ được hiển thị trong thông báo.
    - `image` {{optional_inline}} {{experimental_inline}}
      - : Một chuỗi chứa URL của hình ảnh sẽ được hiển thị trong thông báo.
    - `lang` {{optional_inline}}
      - : Ngôn ngữ của thông báo, được chỉ định bằng một chuỗi đại diện cho {{glossary("BCP 47 language tag")}}. Mặc định là chuỗi rỗng.
    - `navigate` {{optional_inline}} {{experimental_inline}}
      - : Một chuỗi chứa URL để điều hướng tới khi người dùng kích hoạt thông báo. Khi được đặt, user agent sẽ điều hướng đến URL này thay vì kích hoạt sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}}. Giá trị được phân tích tương đối với URL cơ sở của service worker. Xem {{domxref("Notification.navigate")}} để biết thêm thông tin.
    - `renotify` {{optional_inline}} {{experimental_inline}}
      - : Một giá trị boolean xác định liệu người dùng có nên được thông báo lại sau khi một thông báo mới thay thế thông báo cũ hay không. Mặc định là `false`, nghĩa là họ sẽ không được thông báo. Nếu là `true`, thì `tag` cũng phải được đặt.
    - `requireInteraction` {{optional_inline}} {{experimental_inline}}
      - : Cho biết thông báo nên duy trì hoạt động cho đến khi người dùng nhấp hoặc đóng nó, thay vì tự động đóng. Giá trị mặc định là `false`.
    - `silent` {{optional_inline}}
      - : Một giá trị boolean xác định liệu thông báo có im lặng hay không (không phát âm thanh hoặc rung), bất kể cài đặt thiết bị. Mặc định, `null`, nghĩa là tôn trọng cài đặt mặc định của thiết bị. Nếu là `true`, thì `vibrate` không được xuất hiện.
    - `tag` {{optional_inline}}
      - : Một chuỗi đại diện cho thẻ định danh của thông báo. Mặc định là chuỗi rỗng.
    - `timestamp` {{optional_inline}}
      - : Dấu thời gian, được đưa ra dưới dạng {{glossary("Unix time")}} tính bằng mili giây, biểu thị thời điểm liên quan đến thông báo. Giá trị này có thể ở quá khứ khi thông báo được dùng cho một tin nhắn không thể gửi ngay vì thiết bị ngoại tuyến, hoặc ở tương lai đối với một cuộc họp sắp bắt đầu.
    - `vibrate` {{optional_inline}} {{experimental_inline}}
      - : Một [mẫu rung](/en-US/docs/Web/API/Vibration_API#vibration_patterns) cho phần cứng rung của thiết bị để phát cùng thông báo. Nếu được chỉ định, `silent` không được là `true`.

### Giá trị trả về

Một {{jsxref("Promise")}} được phân giải thành `undefined`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu:
    - Trạng thái của service worker hiện tại không phải là `activating` hoặc `activated`.
    - Người dùng đã từ chối rõ ràng yêu cầu cấp quyền của trình duyệt để dùng API này.
    - Tùy chọn `silent` là `true` và tùy chọn `vibrate` được chỉ định.
    - Tùy chọn `renotify` là `true` nhưng tùy chọn `tag` rỗng.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném nếu việc tuần tự hóa tùy chọn `data` thất bại vì một lý do nào đó.

## Ví dụ

```js
navigator.serviceWorker.register("sw.js");

function showNotification() {
  Notification.requestPermission().then((result) => {
    if (result === "granted") {
      navigator.serviceWorker.ready.then((registration) => {
        registration.showNotification("Vibration Sample", {
          body: "Buzz! Buzz!",
          icon: "../images/touch/chrome-touch-icon-192x192.png",
          vibrate: [200, 100, 200, 100, 200, 100, 200],
          tag: "vibration-sample",
        });
      });
    }
  });
}
```

Để gọi hàm trên vào thời điểm thích hợp, bạn có thể lắng nghe sự kiện {{domxref("ServiceWorkerGlobalScope.notificationclick_event", "notificationclick")}}.

Bạn cũng có thể truy xuất chi tiết của các {{domxref("Notification")}} đã được phát từ service worker hiện tại bằng cách dùng {{domxref("ServiceWorkerRegistration.getNotifications()")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
