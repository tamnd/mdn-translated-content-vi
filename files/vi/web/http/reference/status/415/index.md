---
title: 415 Unsupported Media Type
slug: Web/HTTP/Reference/Status/415
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.415
sidebar: http
---

Mã trạng thái HTTP **`415 Unsupported Media Type`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ từ chối chấp nhận yêu cầu vì định dạng {{Glossary("HTTP Content", "nội dung")}} thông điệp không được hỗ trợ.

Vấn đề về định dạng có thể do {{HTTPHeader("Content-Type")}} hoặc {{HTTPHeader("Content-Encoding")}} được chỉ định trong yêu cầu, hoặc là kết quả của việc xử lý nội dung thông điệp yêu cầu.
Một số máy chủ có thể rất nghiêm ngặt về `Content-Type` dự kiến của các yêu cầu.
Ví dụ, việc gửi `UTF8` thay vì `UTF-8` để chỉ định bộ ký tự {{glossary("UTF-8")}} có thể khiến máy chủ coi kiểu media là không hợp lệ.

## Trạng thái

```http
415 Unsupported Media Type
```

## Ví dụ

### Thiếu content type

Trong ví dụ sau, tiêu đề {{HTTPHeader("Content-Type")}} hoàn toàn bị thiếu:

```http
POST /comments HTTP/1.1
Host: example.com
Content-Length: 23

{
  "user": "belgin",
  "comment": "LGTM!"
}
```

Nếu triển khai máy chủ mong nhận ít nhất kiểu MIME `Content-Type: application/json;` cho yêu cầu tại endpoint đó, nó có thể gửi phản hồi sau:

```http
HTTP/1.1 415 Unsupported Media Type
Date: Fri, 28 Jun 2024 12:00:00 GMT
Server: Apache/2.4.41 (Ubuntu)
Accept-Post: application/json; charset=UTF-8
Content-Length: 0
```

### Content type không hợp lệ

Trong ví dụ sau, tiêu đề {{HTTPHeader("Content-Type")}} được đặt không đúng thành dữ liệu biểu mẫu mã hóa URL khi {{Glossary("HTTP Content", "nội dung")}} nằm trong phần thân yêu cầu:

```http
POST /comments HTTP/1.1
Host: example.com
Content-Length: 23
Content-Type: application/x-www-form-urlencoded

{
  "user": "belgin",
  "comment": "LGTM!"
}
```

Trong trường hợp này, máy chủ phản hồi với 415 và kiểu nội dung yêu cầu cần thiết trong tiêu đề {{HTTPHeader("Accept-Post")}}:

```http
HTTP/1.1 415 Unsupported Media Type
Date: Fri, 28 Jun 2024 12:00:00 GMT
Server: Apache/2.4.41 (Ubuntu)
Accept-Post: application/json; charset=UTF-8
Content-Length: 0
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPHeader("Content-Type")}}
- {{HTTPHeader("Content-Encoding")}}
- {{HTTPHeader("Accept-Post")}}
