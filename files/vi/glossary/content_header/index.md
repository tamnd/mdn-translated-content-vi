---
title: Header nội dung
slug: Glossary/Content_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Header nội dung** (content headers) là nhóm các [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) mô tả nội dung phần thân của một thông điệp HTTP, sau khi đã loại bỏ bất kỳ đóng khung thông điệp nào trong phần thân. Chúng mô tả cụ thể các thuộc tính của {{Glossary("HTTP Content", "nội dung thông điệp")}} được truyền tải trong một thông điệp cụ thể _khi đang được truyền_, như độ dài nội dung, mã hóa truyền tải, phần nào của tài nguyên được mang trong dữ liệu (đối với thông điệp nhiều phần), và kiểm tra tính toàn vẹn thông điệp. Chúng khác với {{Glossary("Representation header", "Representation header")}}, vốn mô tả mã hóa, loại phương tiện, ngôn ngữ và các đặc điểm khác của tài nguyên, và cho phép dữ liệu cơ bản được diễn giải.

Các header này được định nghĩa là "Payload headers" trong {{RFC("7231")}}, nhưng hiện nay được gọi là "Content headers" vì dữ liệu chứa trong các frame payload HTTP/2 và HTTP/3 có thể là dữ liệu header, dữ liệu nội dung phần thân, hoặc thông tin điều khiển khác.

> [!NOTE]
> Có một số chồng chéo giữa content headers và {{Glossary("Representation header", "representation headers")}}.

Các header này có thể có mặt trong cả thông điệp yêu cầu và phản hồi HTTP và bao gồm:

- {{HTTPHeader("Content-Encoding")}}
- {{HTTPHeader("Content-Length")}}
- {{HTTPHeader("Content-Range")}}
- {{HTTPHeader("Content-Type")}}
- {{HTTPHeader("Trailer")}}
- {{HTTPHeader("Transfer-Encoding")}}

## Xem thêm

- [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers)
- Các thuật ngữ liên quan:
  - {{Glossary("Representation header")}}
  - {{Glossary("HTTP Content")}}
