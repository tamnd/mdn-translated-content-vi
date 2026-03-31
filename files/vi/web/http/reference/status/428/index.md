---
title: 428 Precondition Required
slug: Web/HTTP/Reference/Status/428
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc6585#section-3
sidebar: http
---

Mã trạng thái HTTP **`428 Precondition Required`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ yêu cầu yêu cầu phải là [có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests).

Thông thường, phản hồi 428 có nghĩa là tiêu đề điều kiện tiên quyết bắt buộc như {{HTTPHeader("If-Match")}} **đang bị thiếu**.
Khi tiêu đề điều kiện tiên quyết **không khớp** trạng thái phía máy chủ, phản hồi nên là {{HTTPStatus("412", "412 Precondition Failed")}}.

## Trạng thái

```http
428 Precondition Required
```

## Ví dụ

### Thiếu điều kiện tiên quyết trong yêu cầu

Client đã lấy tài nguyên `my-document` từ máy chủ, cập nhật cục bộ và sau đó thử gửi tài liệu đã cập nhật trở lại máy chủ:

```http
PUT /docs/my-document HTTP/1.1
Host: example.com
Content-Type: application/json

{
  […]
```

Triển khai máy chủ yêu cầu tất cả các yêu cầu {{HTTPMethod("PUT")}} cho đường dẫn cụ thể hoặc loại tài liệu phải có điều kiện và gửi phản hồi 428:

```http
HTTP/1.1 428 Precondition Required
Date: Wed, 26 Jun 2024 12:00:00 GMT
Server: Apache/2.4.1 (Unix)
Content-Type: application/json

{
  "code": "MissingPrecondition",
  "message": "Updating documents requires a precondition header.",
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Yêu cầu có điều kiện HTTP](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- Tiêu đề có điều kiện: {{HTTPHeader("If-Match")}}, {{HTTPHeader("If-None-Match")}}, {{HTTPHeader("If-Modified-Since")}}, {{HTTPHeader("If-Unmodified-Since")}}, {{HTTPHeader("If-Range")}}
- {{HTTPStatus(412)}}
