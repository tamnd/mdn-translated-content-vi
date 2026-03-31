---
title: 431 Request Header Fields Too Large
slug: Web/HTTP/Reference/Status/431
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc6585#section-5
sidebar: http
---

Mã trạng thái HTTP **`431 Request Header Fields Too Large`** [phản hồi lỗi phía client](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho biết máy chủ từ chối xử lý yêu cầu vì [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) của yêu cầu quá dài.
Yêu cầu có thể được gửi lại sau khi giảm kích thước tiêu đề yêu cầu.

431 có thể được sử dụng khi tổng kích thước tiêu đề yêu cầu quá lớn hoặc khi một trường tiêu đề duy nhất quá lớn.
Để giúp client gặp lỗi này, hãy cho biết vấn đề nào trong số hai vấn đề này trong phần thân phản hồi và, lý tưởng nhất, cho biết tiêu đề nào quá lớn.
Điều này giúp mọi người có thể cố gắng khắc phục vấn đề, chẳng hạn bằng cách xóa cookie.

Máy chủ thường tạo trạng thái này nếu:

- URL {{httpheader("Referer")}} quá dài
- Có quá nhiều [Cookie](/en-US/docs/Web/HTTP/Guides/Cookies) được gửi trong yêu cầu

## Trạng thái

```http
431 Request Header Fields Too Large
```

## Ví dụ

### Trường tiêu đề quá lớn

Trong ví dụ sau, tiêu đề {{httpheader("Cookie")}} quá lớn trong yêu cầu:

```http
GET /doc HTTP/1.1
Host: example.com
Cookie: cookie1=value1; cookie2=value2; cookie3=[…]
```

Máy chủ phản hồi với thông báo cho biết tiêu đề nào có vấn đề:

```http
HTTP/1.1 431 Request Header Fields Too Large
Content-Type: text/html

<!doctype html>
  <head>
    <title>Request Header Fields Too Large</title>
  </head>
  <body>
    <h1>Request Header Fields Too Large</h1>
    <p>The "Cookie" header was too large.</p>
  </body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("414", "414 URI Too Long")}}
- {{Glossary("Request header")}}
