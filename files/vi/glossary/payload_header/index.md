---
title: Header nội dung
slug: Glossary/Payload_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Payload header** (header payload) là một {{Glossary("HTTP_header", "HTTP header")}} mô tả thông tin payload liên quan đến việc truyền tải an toàn và tái tạo {{Glossary("Representation header", "đại diện")}} tài nguyên gốc từ một hoặc nhiều thông điệp. Thông tin này bao gồm độ dài của payload thông điệp, phần nào của tài nguyên được mang trong payload này (đối với thông điệp nhiều phần), bất kỳ mã hóa nào được áp dụng cho truyền tải, kiểm tra tính toàn vẹn thông điệp, v.v.

Payload header có thể có mặt trong cả thông điệp yêu cầu và phản hồi HTTP (tức là trong bất kỳ thông điệp nào đang mang dữ liệu payload).

Các payload header bao gồm: {{HTTPHeader("Content-Length")}}, {{HTTPHeader("Content-Range")}}, {{HTTPHeader("Trailer")}} và {{HTTPHeader("Transfer-Encoding")}}.

## Xem thêm

- [Danh sách tất cả HTTP header](/en-US/docs/Web/HTTP/Reference/Headers)
  - {{HTTPHeader("Content-Length")}}
  - {{HTTPHeader("Content-Range")}}
  - {{HTTPHeader("Trailer")}}
  - {{HTTPHeader("Transfer-Encoding")}}
  - {{Glossary("Representation header")}}

- [RFC 7231, section 3.3: Payload semantics](https://datatracker.ietf.org/doc/html/rfc7231#section-3.3)
