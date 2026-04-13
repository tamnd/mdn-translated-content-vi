---
title: "Notification: hàm khởi tạo Notification()"
short-title: Notification()
slug: Web/API/Notification/Notification
page-type: web-api-constructor
browser-compat: api.Notification.Notification
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Hàm khởi tạo **`Notification()`** tạo ra một thể hiện mới của đối tượng {{domxref("Notification")}}, đại diện cho một thông báo dành cho người dùng.

Nếu cố tạo thông báo bên trong {{domxref("ServiceWorkerGlobalScope")}} bằng hàm khởi tạo `Notification()`, nó sẽ ném ra `TypeError`.
Hãy dùng {{domxref("ServiceWorkerRegistration.showNotification()")}} thay thế.

Trước khi có thể hiển thị thông báo, bạn phải xin quyền trước bằng {{domxref("Notification.requestPermission_static", "Notification.requestPermission()")}}.
Quyền đó có thể không được cấp, ví dụ nếu trang đang ở chế độ duyệt riêng tư.

Hàm khởi tạo này ném ra {{jsxref("TypeError")}} khi được gọi trong hầu hết các trình duyệt di động và điều này khó có khả năng thay đổi, vì các trang web trên thiết bị di động hầu như không bao giờ "chạy ở nền", vốn là trường hợp sử dụng chính của thông báo.
Thay vào đó, bạn cần đăng ký service worker và dùng {{domxref("ServiceWorkerRegistration.showNotification()")}}.
Xem [Chrome issue](https://crbug.com/481856) để biết thêm chi tiết.

## Cú pháp

```js-nolint
new Notification(title)
new Notification(title, options)
```

### Tham số

- `title`
  - : Xác định tiêu đề cho thông báo, được hiển thị ở đầu cửa sổ thông báo.
- `options` {{optional_inline}}
  - : Một object tùy chọn chứa mọi thiết lập tùy biến mà bạn muốn áp dụng cho thông báo.
    Các tùy chọn có thể có là:
    - `actions` {{optional_inline}}
      - : Phải không được chỉ định hoặc phải là một mảng rỗng.
        `actions` chỉ được hỗ trợ cho [thông báo bền vững](/en-US/docs/Web/API/Notifications_API#persistent_and_non-persistent_notifications) được phát từ service worker bằng {{domxref("ServiceWorkerRegistration.showNotification()")}}.
    - `badge` {{optional_inline}}
      - : Một chuỗi chứa URL của ảnh dùng để đại diện cho thông báo khi không đủ chỗ để hiển thị chính thông báo; ví dụ như trên thanh thông báo Android.
        Trên thiết bị Android, ảnh badge nên hỗ trợ độ phân giải tới 4x, khoảng 96x96px, và ảnh sẽ tự động bị che mặt nạ.
    - `body` {{optional_inline}}
      - : Một chuỗi biểu thị phần nội dung của thông báo, được hiển thị bên dưới tiêu đề.
        Mặc định là chuỗi rỗng.
    - `data` {{optional_inline}}
      - : Dữ liệu tùy ý mà bạn muốn gắn với thông báo.
        Dữ liệu này có thể là bất kỳ kiểu dữ liệu nào có thể [structured-clonable](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm#supported_types).
        Mặc định là `null`.
    - `dir` {{optional_inline}}
      - : Hướng hiển thị của thông báo.
        Mặc định là `auto`, tức là chỉ kế thừa hành vi cài đặt ngôn ngữ của trình duyệt, nhưng bạn có thể ghi đè bằng giá trị `ltr` và `rtl` (dù hầu hết trình duyệt dường như bỏ qua các thiết lập này).
    - `icon` {{optional_inline}}
      - : Một chuỗi chứa URL của biểu tượng sẽ được hiển thị trong thông báo.
    - `image` {{optional_inline}}
      - : Một chuỗi chứa URL của ảnh sẽ được hiển thị trong thông báo.
    - `lang` {{optional_inline}}
      - : Ngôn ngữ của thông báo, được chỉ định bằng một chuỗi biểu diễn {{glossary("BCP 47 language tag")}}.
        Mặc định là chuỗi rỗng.
    - `navigate` {{optional_inline}} {{experimental_inline}}
      - : Một chuỗi chứa URL mà người dùng sẽ được điều hướng tới khi kích hoạt thông báo.
        Khi được đặt, user agent sẽ điều hướng tới URL này thay vì phát sự kiện {{domxref("Notification.click_event", "click")}}.
        Giá trị này được phân tích tương đối theo base URL của trang.
        Xem {{domxref("Notification.navigate")}} để biết thêm chi tiết.
    - `renotify` {{optional_inline}}
      - : Giá trị boolean chỉ định xem người dùng có nên được thông báo lại sau khi một thông báo mới thay thế thông báo cũ hay không.
        Mặc định là `false`, nghĩa là họ sẽ không được thông báo lại.
        Nếu là `true` thì `tag` cũng phải được đặt.
    - `requireInteraction` {{optional_inline}}
      - : Cho biết thông báo nên còn hoạt động cho đến khi người dùng bấm hoặc đóng nó, thay vì tự động biến mất.
        Giá trị mặc định là `false`.
    - `silent` {{optional_inline}}
      - : Giá trị boolean chỉ định xem thông báo có nên im lặng hay không, tức là không phát âm thanh hoặc rung, bất kể cài đặt thiết bị.
        Nếu đặt `true`, thông báo sẽ im lặng; nếu đặt `null` (giá trị mặc định), các cài đặt mặc định của thiết bị sẽ được tôn trọng.
    - `tag` {{optional_inline}}
      - : Một chuỗi đại diện cho thẻ nhận diện của thông báo.
        Mặc định là chuỗi rỗng.
    - `timestamp` {{optional_inline}}
      - : Dấu thời gian, tính bằng {{glossary("Unix time")}} theo mili giây, đại diện cho thời điểm liên quan đến thông báo.
        Đây có thể là quá khứ khi thông báo được dùng cho một tin nhắn không thể gửi ngay vì thiết bị ngoại tuyến, hoặc là tương lai cho một cuộc họp sắp bắt đầu.
    - `vibrate` {{optional_inline}}
      - : Một [mẫu rung](/en-US/docs/Web/API/Vibration_API#vibration_patterns) cho phần cứng rung của thiết bị sẽ phát khi có thông báo.
        Nếu được chỉ định, `silent` không được là `true`.

### Giá trị trả về

Một thể hiện của đối tượng {{domxref("Notification")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu:
    - Hàm khởi tạo được gọi bên trong {{domxref("ServiceWorkerGlobalScope")}}.
    - Tùy chọn `actions` được chỉ định nhưng không rỗng.
    - Tùy chọn `silent` là `true` và tùy chọn `vibrate` được chỉ định.
    - Tùy chọn `renotify` là `true` nhưng tùy chọn `tag` trống.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu việc tuần tự hóa tùy chọn `data` thất bại vì lý do nào đó.

## Ví dụ

Đây là ví dụ cơ bản nhất để chỉ hiển thị thông báo nếu quyền đã được cấp trước đó.
Để xem các ví dụ đầy đủ hơn, hãy xem trang {{domxref("Notification")}}.

```js
if (Notification.permission === "granted") {
  const notification = new Notification("Hi there!");
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
