---
title: "XMLHttpRequest: phương thức open()"
short-title: open()
slug: Web/API/XMLHttpRequest/open
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.open
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức {{domxref("XMLHttpRequest")}} **`open()`** khởi tạo một yêu cầu mới được tạo, hoặc tái khởi tạo một yêu cầu hiện có.

> [!NOTE]
> Gọi phương thức này cho một yêu cầu đang hoạt động (yêu cầu mà `open()` đã được gọi) tương đương với việc gọi {{domxref("XMLHttpRequest.abort", "abort()")}}.

## Cú pháp

```js-nolint
open(method, url)
open(method, url, async)
open(method, url, async, user)
open(method, url, async, user, password)
```

### Tham số

- `method`
  - : [Phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods) để sử dụng, chẳng hạn như `"GET"`, `"POST"`, `"PUT"`, `"DELETE"`, v.v. Bị bỏ qua cho các URL không phải HTTP(S).
- `url`
  - : Một chuỗi hoặc bất kỳ đối tượng nào có {{Glossary("stringifier")}} — bao gồm đối tượng {{domxref("URL")}} — cung cấp URL của tài nguyên để gửi yêu cầu đến.
- `async` {{optional_inline}}
  - : Một tham số Boolean tùy chọn, mặc định là `true`, cho biết có thực hiện hoạt động không đồng bộ hay không. Nếu giá trị này là `false`, phương thức `send()` sẽ không trả về cho đến khi nhận được phản hồi. Nếu là `true`, thông báo về giao dịch hoàn tất được cung cấp bằng cách sử dụng các trình lắng nghe sự kiện. Giá trị này _phải_ là true nếu thuộc tính `multipart` là `true`, nếu không một ngoại lệ sẽ được ném.

    > [!NOTE]
    > Các yêu cầu đồng bộ trên luồng chính có thể dễ dàng gây gián đoạn trải nghiệm người dùng và nên tránh; thực tế, nhiều trình duyệt đã hoàn toàn ngừng hỗ trợ XHR đồng bộ trên luồng chính. Các yêu cầu đồng bộ được phép trong {{domxref("Worker")}}.

- `user` {{optional_inline}}
  - : Tên người dùng tùy chọn để sử dụng cho mục đích xác thực; theo mặc định, đây là giá trị `null`.
- `password` {{optional_inline}}
  - : Mật khẩu tùy chọn để sử dụng cho mục đích xác thực; theo mặc định, đây là giá trị `null`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- Các phương thức {{domxref("XMLHttpRequest")}} liên quan:
  {{domxref("XMLHttpRequest.setRequestHeader","setRequestHeader()")}},
  {{domxref("XMLHttpRequest.send", "send()")}}, và
  {{domxref("XMLHttpRequest.abort", "abort()")}}
