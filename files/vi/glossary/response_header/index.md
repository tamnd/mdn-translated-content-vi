---
title: Response header
slug: Glossary/Response_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Response header** (tiêu đề phản hồi) là một {{glossary("HTTP header")}} có thể được sử dụng trong phản hồi HTTP và không liên quan đến nội dung của thông điệp. Các response header như {{HTTPHeader("Age")}}, {{HTTPHeader("Location")}} hay {{HTTPHeader("Server")}} được dùng để cung cấp thêm thông tin ngữ cảnh về phản hồi.

Không phải tất cả các header xuất hiện trong phản hồi đều được đặc tả phân loại là _response header_. Ví dụ, header {{HTTPHeader("Content-Type")}} là một {{glossary("representation header")}} cho biết kiểu dữ liệu gốc trong phần thân của thông điệp phản hồi (trước khi áp dụng mã hóa từ representation header {{HTTPHeader("Content-Encoding")}}). Tuy nhiên, trong thực tế thông thường, tất cả các header đều được gọi là response header trong một thông điệp phản hồi.

Dưới đây là một số response header và representation header sau một yêu cầu {{HTTPMethod("GET")}}.

```http
200 OK
Access-Control-Allow-Origin: *
Connection: Keep-Alive
Content-Encoding: gzip
Content-Type: text/html; charset=utf-8
Date: Mon, 18 Jul 2016 16:06:00 GMT
ETag: "c561c68d0ba92bbeb8b0f612a9199f722e3a621a"
Keep-Alive: timeout=5, max=997
Last-Modified: Mon, 18 Jul 2016 02:36:04 GMT
Server: Apache
Set-Cookie: my-key=my value; expires=Mon, 17-Jul-2017 16:06:00 GMT; Max-Age=31449600; Path=/; secure
Transfer-Encoding: chunked
Vary: Cookie, Accept-Encoding
X-Backend-Server: developer2.webapp.scl3.mozilla.com
X-Cache-Info: not cacheable; meta data too large
X-kuma-revision: 1085259
x-frame-options: DENY
```

## Xem thêm

- [Danh sách tất cả HTTP header](/en-US/docs/Web/HTTP/Reference/Headers)
- Các thuật ngữ liên quan:
  - {{Glossary("Representation header")}}
  - {{Glossary("HTTP header")}}
  - {{Glossary("Request header")}}
