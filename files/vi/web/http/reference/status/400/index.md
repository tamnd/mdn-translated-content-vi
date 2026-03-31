---
title: 400 Bad Request
slug: Web/HTTP/Reference/Status/400
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.400
sidebar: http
---

Mã trạng thái HTTP **`400 Bad Request`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ sẽ không xử lý yêu cầu do máy chủ xác định đây là lỗi từ phía client.
Nguyên nhân phổ biến dẫn đến phản hồi `400` là cú pháp yêu cầu không đúng định dạng, đóng gói thông điệp yêu cầu không hợp lệ, hoặc định tuyến yêu cầu gây nhầm lẫn.

Client nhận được phản hồi `400` nên hiểu rằng việc lặp lại yêu cầu mà không sửa đổi sẽ thất bại với cùng lỗi đó.

## Trạng thái

```http
400 Bad Request
```

## Ví dụ

### Cú pháp yêu cầu không đúng định dạng

Giả sử có một {{Glossary("REST")}} API với endpoint quản lý người dùng tại `http://example.com/users` và một yêu cầu `POST` với nội dung sau cố tạo người dùng mới, nhưng dùng JSON không hợp lệ với dấu xuống dòng không được escape:

```http
POST /users HTTP/1.1
Host: example.com
Content-Type: application/json
Content-Length: 38

{
  "email": "b@example.com
",
  "username": "b.smith"
}
```

Nếu {{Glossary("HTTP Content", "nội dung")}} có định dạng hợp lệ, ta sẽ nhận được phản hồi {{HTTPStatus("201", "201 Created")}} hoặc thông báo thành công khác, nhưng thay vào đó máy chủ phản hồi với `400` và nội dung phản hồi có trường `message` cung cấp bối cảnh để client có thể thử lại hành động với yêu cầu đúng định dạng:

```http
HTTP/1.1 400 Bad Request
Content-Type: application/json
Content-Length: 71

{
  "error": "Bad request",
  "message": "Request body could not be read properly.",
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [HTTP Status Code Definitions](https://httpwg.org/specs/rfc9110.html#status.400)
