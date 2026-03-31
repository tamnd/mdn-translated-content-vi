---
title: 406 Not Acceptable
slug: Web/HTTP/Reference/Status/406
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#status.406
sidebar: http
---

Mã trạng thái HTTP **`406 Not Acceptable`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ không thể tạo phản hồi khớp với danh sách các giá trị chấp nhận được xác định trong tiêu đề [thương lượng nội dung chủ động](/en-US/docs/Web/HTTP/Guides/Content_negotiation#server-driven_content_negotiation) của yêu cầu và máy chủ không muốn cung cấp biểu diễn mặc định.

Các tiêu đề thương lượng nội dung chủ động bao gồm:

- {{HTTPHeader("Accept")}}
- {{HTTPHeader("Accept-Encoding")}}
- {{HTTPHeader("Accept-Language")}}

Máy chủ có thể trả về phản hồi khác với tiêu đề accept của yêu cầu.
Trong trường hợp đó, phản hồi {{HTTPStatus("200")}} với tài nguyên mặc định không khớp với danh sách các giá trị thương lượng nội dung chấp nhận được của client có thể được ưu tiên hơn so với việc gửi phản hồi 406.

Nếu máy chủ trả về 406, nội dung thông điệp phản hồi nên chứa danh sách các biểu diễn có sẵn cho tài nguyên, cho phép người dùng chọn, mặc dù không có cách chuẩn nào được định nghĩa cho điều này.

## Trạng thái

```http
406 Not Acceptable
```

## Ví dụ

### Kiểu nội dung không khả dụng

Yêu cầu sau giả định rằng `www.example.com/docs/doc1` hỗ trợ gửi tài liệu dưới dạng `application/rtf`:

```http
GET /docs/doc1 HTTP/1.1
Host: example.com
Accept: application/rtf;
```

Trong ví dụ này, máy chủ không dùng kiểu nội dung mặc định như `text/html` hoặc `application/json`, mà trả về 406:

```http
HTTP/1.1 406 Not Acceptable
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
Content-Type: application/json

{
  "code": "UnsupportedType",
  "message": "Only 'text/html' or 'application/json' content types supported.",
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Accept")}}
- {{HTTPHeader("Accept-Encoding")}}
- {{HTTPHeader("Accept-Language")}}
- [Thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) HTTP
