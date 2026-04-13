---
title: "XMLHttpRequest: thuộc tính responseType"
short-title: responseType
slug: Web/API/XMLHttpRequest/responseType
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.responseType
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính {{domxref("XMLHttpRequest")}} **`responseType`** là một giá trị chuỗi được liệt kê chỉ định loại dữ liệu chứa trong phản hồi.

Nó cũng cho phép tác giả thay đổi loại phản hồi. Nếu một chuỗi rỗng được đặt làm giá trị của `responseType`, giá trị mặc định `text` sẽ được sử dụng.

## Giá trị

Một chuỗi chỉ định loại dữ liệu mà phản hồi chứa. Nó có thể nhận các giá trị sau:

- `""`
  - : Một chuỗi `responseType` rỗng giống như `"text"`, loại mặc định.
- `"arraybuffer"`
  - : {{domxref("XMLHttpRequest.response", "response")}} là một {{jsxref("ArrayBuffer")}} JavaScript chứa dữ liệu nhị phân.
- `"blob"`
  - : `response` là một đối tượng {{domxref("Blob")}} chứa dữ liệu nhị phân.
- `"document"`
  - : `response` là một {{domxref("Document")}} {{Glossary("HTML")}} hoặc {{domxref("XMLDocument")}} {{Glossary("XML")}}, tùy thuộc vào kiểu MIME của dữ liệu nhận được. Xem [HTML trong XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest) để tìm hiểu thêm về việc sử dụng XHR để lấy nội dung HTML.
- `"json"`
  - : `response` là một đối tượng JavaScript được tạo bằng cách phân tích cú pháp nội dung dữ liệu nhận được dưới dạng {{Glossary("JSON")}}.
- `"text"`
  - : `response` là một văn bản trong chuỗi.

> [!NOTE]
> Khi đặt `responseType` thành một giá trị cụ thể, tác giả nên đảm bảo rằng máy chủ thực sự đang gửi một phản hồi tương thích với định dạng đó. Nếu máy chủ trả về dữ liệu không tương thích với `responseType` đã đặt, giá trị của {{domxref("XMLHttpRequest.response", "response")}} sẽ là `null`.

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Một nỗ lực thay đổi giá trị của `responseType` trên một `XMLHttpRequest` đang ở chế độ đồng bộ nhưng không nằm trong {{domxref("Worker")}}. Để biết thêm chi tiết, xem [Các hạn chế XHR đồng bộ](#synchronous_xhr_restrictions) bên dưới.

## Ghi chú sử dụng

### Các hạn chế XHR đồng bộ

Bạn không thể thay đổi giá trị của `responseType` trong một `XMLHttpRequest` đồng bộ trừ khi yêu cầu thuộc về một {{domxref("Worker")}}. Hạn chế này được thiết kế một phần để giúp đảm bảo rằng các hoạt động đồng bộ không được sử dụng cho các giao dịch lớn chặn luồng chính của trình duyệt, do đó làm chậm trải nghiệm người dùng.

Các yêu cầu XHR không đồng bộ theo mặc định; chúng chỉ được đặt ở chế độ đồng bộ bằng cách truyền `false` làm giá trị của tham số `async` tùy chọn khi gọi {{domxref("XMLHttpRequest.open", "open()")}}.

### Các hạn chế trong Workers

Các nỗ lực đặt giá trị của `responseType` thành `document` bị bỏ qua trong một {{domxref("Worker")}}.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [HTML trong XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest)
- Dữ liệu phản hồi: {{domxref("XMLHttpRequest.response", "response")}}, {{domxref("XMLHttpRequest.responseText", "responseText")}}, và {{domxref("XMLHttpRequest.responseXML", "responseXML")}}
