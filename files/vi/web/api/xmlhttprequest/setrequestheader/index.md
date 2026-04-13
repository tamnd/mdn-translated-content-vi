---
title: "XMLHttpRequest: phương thức setRequestHeader()"
short-title: setRequestHeader()
slug: Web/API/XMLHttpRequest/setRequestHeader
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.setRequestHeader
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức {{domxref("XMLHttpRequest")}} **`setRequestHeader()`** đặt giá trị của một tiêu đề yêu cầu HTTP. Khi sử dụng `setRequestHeader()`, bạn phải gọi nó sau khi gọi {{domxref("XMLHttpRequest.open", "open()")}}, nhưng trước khi gọi {{domxref("XMLHttpRequest.send", "send()")}}. Nếu phương thức này được gọi nhiều lần với cùng một tiêu đề, các giá trị được hợp nhất thành một tiêu đề yêu cầu duy nhất.

Mỗi lần bạn gọi `setRequestHeader()` sau lần gọi đầu tiên, văn bản được chỉ định sẽ được nối vào cuối nội dung tiêu đề hiện có.

Nếu không có tiêu đề {{HTTPHeader("Accept")}} nào được thiết lập bằng cách sử dụng phương thức này, một tiêu đề `Accept` với loại `"*/*"` sẽ được gửi cùng với yêu cầu khi {{domxref("XMLHttpRequest.send", "send()")}} được gọi.

Vì lý do bảo mật, có một số {{Glossary("Forbidden_request_header", "tiêu đề yêu cầu bị cấm")}} có giá trị được kiểm soát bởi tác nhân người dùng. Bất kỳ nỗ lực nào đặt giá trị cho một trong những tiêu đề đó từ mã JavaScript frontend sẽ bị bỏ qua mà không có cảnh báo hoặc lỗi.

Ngoài ra, tiêu đề HTTP [`Authorization`](/en-US/docs/Web/HTTP/Reference/Headers/Authorization) có thể được thêm vào yêu cầu, nhưng sẽ bị xóa nếu yêu cầu được chuyển hướng xuyên nguồn gốc.

> [!NOTE]
> Đối với các trường tùy chỉnh của bạn, bạn có thể gặp ngoại lệ "**not allowed by Access-Control-Allow-Headers in preflight response**" khi gửi yêu cầu xuyên miền.
> Trong tình huống này, bạn cần thiết lập {{HTTPHeader("Access-Control-Allow-Headers")}} trong tiêu đề phản hồi ở phía máy chủ.

## Cú pháp

```js-nolint
setRequestHeader(header, value)
```

### Tham số

- `header`
  - : Tên của tiêu đề có giá trị cần đặt.
- `value`
  - : Giá trị cần đặt làm nội dung của tiêu đề.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [HTML trong XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest)
