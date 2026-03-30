---
title: Header HTTP
slug: Glossary/HTTP_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**HTTP header** là một trường của yêu cầu hoặc phản hồi HTTP truyền thêm ngữ cảnh và siêu dữ liệu về yêu cầu hoặc phản hồi. Ví dụ, một thông điệp yêu cầu có thể sử dụng header để chỉ định các định dạng phương tiện ưa thích của nó, trong khi một phản hồi có thể sử dụng header để chỉ định định dạng phương tiện của phần thân được trả về. Header không phân biệt chữ hoa chữ thường, bắt đầu ở đầu dòng và ngay sau đó là `':'` và một giá trị phụ thuộc vào header. Giá trị kết thúc tại CRLF tiếp theo hoặc ở cuối thông điệp.

Các đặc tả HTTP và Fetch đề cập đến một số danh mục header, bao gồm:

- {{Glossary("Request header")}}: Header chứa thêm thông tin về tài nguyên cần tìm nạp hoặc về client.
- {{Glossary("Response header")}}: Header với thông tin bổ sung về phản hồi, như vị trí của nó hoặc về máy chủ (tên, phiên bản, ...).
- {{Glossary("Representation header")}}: Siêu dữ liệu về tài nguyên trong phần thân thông điệp (ví dụ: mã hóa, loại phương tiện, v.v.).
- {{Glossary("Fetch metadata request header")}}: Header với siêu dữ liệu về tài nguyên trong phần thân thông điệp (ví dụ: mã hóa, loại phương tiện, v.v.).

Một yêu cầu cơ bản với một header:

```http
GET /example.html HTTP/1.1
Host: example.com
```

Chuyển hướng có các header bắt buộc ({{HTTPHeader("Location")}}):

```http
HTTP/1.1 302 Found
Location: /NewPage.html
```

Một tập hợp header điển hình:

```http
HTTP/1.1 304 Not Modified
Access-Control-Allow-Origin: *
Age: 2318192
Cache-Control: public, max-age=315360000
Connection: keep-alive
Date: Mon, 18 Jul 2016 16:06:00 GMT
Server: Apache
Vary: Accept-Encoding
Via: 1.1 3dc30c7222755f86e824b93feb8b5b8c.cloudfront.net (CloudFront)
X-Amz-Cf-Id: TOl0FEm6uI4fgLdrKJx0Vao5hpkKGZULYN2TWD2gAWLtr7vlNjTvZw==
X-Backend-Server: developer6.webapp.scl3.mozilla.com
X-Cache: Hit from cloudfront
X-Cache-Info: cached
```

> [!NOTE]
> Các phiên bản cũ hơn của đặc tả đề cập đến:
>
> - {{Glossary("General header")}}: Header áp dụng cho cả yêu cầu lẫn phản hồi nhưng không liên quan đến dữ liệu cuối cùng được truyền trong phần thân.
> - {{Glossary("Entity header")}}: Header chứa thêm thông tin về phần thân của thực thể, như độ dài nội dung hoặc loại MIME của nó (đây là tập cha của những gì hiện được gọi là các header siêu dữ liệu Representation)

## Xem thêm

- [Danh sách tất cả các HTTP header](/en-US/docs/Web/HTTP/Reference/Headers)
- Cú pháp của [header](https://datatracker.ietf.org/doc/html/rfc7230#section-3.2) trong đặc tả HTTP
- Các thuật ngữ liên quan:
  - {{Glossary("Request header")}}
  - {{Glossary("Response header")}}
  - {{Glossary("Representation header")}}
  - {{Glossary("Fetch metadata request header")}}
  - {{Glossary("Forbidden request header")}}
  - {{Glossary("Forbidden response header name")}}
  - {{Glossary("CORS-safelisted request header")}}
  - {{Glossary("CORS-safelisted response header")}}
