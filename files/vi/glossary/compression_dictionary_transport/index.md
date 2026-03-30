---
title: Truyền tải từ điển nén
slug: Glossary/Compression_dictionary_transport
page-type: glossary-definition
sidebar: glossarysidebar
---

**Truyền tải từ điển nén** (Compression Dictionary Transport) là cách sử dụng từ điển nén chia sẻ, thay vì từ điển tĩnh tiêu chuẩn trong {{glossary("Brotli compression", "nén Brotli")}} hoặc {{glossary("Zstandard compression", "nén Zstandard")}}, để giảm đáng kể kích thước truyền tải của các phản hồi HTTP.

Ví dụ, khi tải xuống `app.v2.js`, nếu client đã có `app.v1.js` thì họ có thể tham chiếu văn bản từ tệp đó bằng cách sử dụng nó như một từ điển và thực chất chỉ tải xuống phần delta và một lượng nhỏ tham chiếu đến tệp `v1`.

Xem [Hướng dẫn truyền tải từ điển nén](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport) để biết thêm thông tin.

## Xem thêm

- [Hướng dẫn truyền tải từ điển nén](/en-US/docs/Web/HTTP/Guides/Compression_dictionary_transport)
- Các thuật ngữ liên quan:
  - {{Glossary("Brotli compression")}}
  - {{Glossary("Zstandard compression")}}
- [`<link rel="compression-dictionary">`](/en-US/docs/Web/HTML/Reference/Attributes/rel/compression-dictionary)
- {{HTTPHeader("Accept-encoding")}}
- {{HTTPHeader("Content-encoding")}}
- {{HTTPHeader("Available-Dictionary")}}
- {{HTTPHeader("Dictionary-ID")}}
- {{HTTPHeader("Use-As-Dictionary")}}
