---
title: Brotli compression
slug: Glossary/Brotli_compression
page-type: glossary-definition
sidebar: glossarysidebar
---

**Brotli** là một thuật toán nén không mất dữ liệu (lossless) đa năng.
Nó nén dữ liệu bằng cách kết hợp một biến thể hiện đại của thuật toán [Lempel-Ziv coding](https://en.wikipedia.org/wiki/LZ77_and_LZ78#LZ77) LZ77, [mã hóa Huffman](https://rosettacode.org/wiki/Huffman_coding) và mô hình ngữ cảnh bậc hai, cung cấp tỷ lệ nén có thể so sánh với các phương pháp nén đa năng tốt nhất hiện có.

Brotli cung cấp tỷ lệ nén tốt hơn {{glossary("GZip_compression", "gzip")}}, và tốc độ có thể so sánh với [deflate](https://en.wikipedia.org/wiki/Deflate).
Tuy nhiên, nén brotli chậm hơn nén Gzip, vì vậy Gzip có thể là lựa chọn tốt hơn khi nén nội dung {{glossary("Cache", "không thể lưu vào bộ nhớ đệm")}}.

Brotli tương thích với hầu hết các trình duyệt hiện đại, nhưng bạn nên cân nhắc có phương án dự phòng.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Lossless compression")}}
  - {{glossary("Lossy compression")}}
  - {{Glossary("Gzip compression")}}
  - {{Glossary("Zstandard compression")}}
- [brotli.org](https://brotli.org/)
- [Brotli GitHub repository](https://github.com/google/brotli)
- [RFC 7932: Brotli Compressed Data Format](https://datatracker.ietf.org/doc/html/rfc7932)
- [Brotli](https://en.wikipedia.org/wiki/Brotli) trên Wikipedia
- [Brotli on Caniuse](https://caniuse.com/#feat=brotli)
