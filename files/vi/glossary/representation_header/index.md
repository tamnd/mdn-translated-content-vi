---
title: Header biểu diễn
slug: Glossary/Representation_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Representation header** (tiêu đề biểu diễn, hay còn gọi là 'representation metadata') là một {{glossary("HTTP_header", "tiêu đề HTTP")}} mô tả cách diễn giải dữ liệu chứa trong tin nhắn.

Ví dụ, nội dung trong một tin nhắn cụ thể có thể được mã hóa để truyền tải, toàn bộ tài nguyên có thể được định dạng theo một kiểu media cụ thể như XML, JSON, HTML hoặc Markdown, được bản địa hóa sang một ngôn ngữ viết hoặc vùng địa lý cụ thể, và/hoặc được nén bằng một thuật toán cụ thể. Các representation header cho phép dữ liệu cơ bản được trích xuất và hiểu được. Tài nguyên cơ bản về mặt ngữ nghĩa là giống nhau trong mỗi trường hợp, nhưng cách biểu diễn của nó là khác nhau.

Mặc dù các biểu diễn là các dạng khác nhau của tài nguyên, bản thân các biểu diễn cũng có thể được truyền theo nhiều dạng khác nhau: một khung tin nhắn HTTP (cf., ví dụ., {{HTTPHeader("Transfer-Encoding")}} của HTTP/1.1), một luồng octet cụ thể (cf., ví dụ., {{HTTPHeader("Content-Range")}}) xuất phát từ _biểu diễn đã được chọn_.

Client chỉ định các định dạng họ muốn nhận trong quá trình [Thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) (sử dụng các header `Accept-*`), và các representation header cho client biết định dạng của _biểu diễn đã được chọn_ mà họ nhận được.

Representation header có thể xuất hiện trong cả tin nhắn yêu cầu và phản hồi HTTP với các phương thức khác nhau. Nếu được gửi như một phản hồi cho yêu cầu `HEAD`, chúng mô tả biểu diễn nội dung body _sẽ_ được chọn nếu tài nguyên được yêu cầu bằng yêu cầu `GET`.

Các representation header bao gồm:

- {{HTTPHeader("Content-Length")}}
- {{HTTPHeader("Content-Range")}}
- {{HTTPHeader("Content-Type")}}
- {{HTTPHeader("Content-Encoding")}}
- {{HTTPHeader("Content-Location")}}
- {{HTTPHeader("Content-Language")}}

- Các bộ xác nhận được sử dụng trong [yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests), chẳng hạn như:
  - {{HTTPHeader("Last-Modified")}}
  - {{HTTPHeader("ETag")}}

Representation header không loại trừ lẫn nhau với {{Glossary("Content header", "content header")}}.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Content header")}}
- [RFC 9110, mục 3.2: Representations](https://httpwg.org/specs/rfc9110.html#representations)
- [Danh sách tất cả các tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- {{HTTPHeader("Repr-Digest")}}, {{HTTPHeader("Want-Repr-Digest")}}
- {{HTTPHeader("Content-Digest")}}, {{HTTPHeader("Want-Content-Digest")}}
