---
title: Zstandard compression
slug: Glossary/Zstandard_compression
page-type: glossary-definition
sidebar: glossarysidebar
---

**Zstandard** là thuật toán nén không mất dữ liệu đa năng.

Zstandard, hay `zstd` là phiên bản rút gọn, là thuật toán nén không mất dữ liệu nhanh, nhắm mục tiêu các tình huống nén thời gian thực ở mức zlib và tỷ lệ nén tốt hơn. Nó được hỗ trợ bởi một giai đoạn entropy rất nhanh, được cung cấp bởi [thư viện Huff0 và FSE](https://github.com/Cyan4973/FiniteStateEntropy). Nó thường cung cấp tỷ lệ nén tốt hơn {{glossary("Brotli_compression", "brotli")}} ở chi phí CPU tương đương, hoặc chi phí CPU tốt hơn ở tỷ lệ nén tương đương.

Để biết hỗ trợ trình duyệt, xem [Content-Encoding: Khả năng tương thích trình duyệt](/en-US/docs/Web/HTTP/Reference/Headers/Content-Encoding#browser_compatibility).

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Lossless compression")}}
  - {{glossary("Lossy compression")}}
  - {{glossary("Brotli compression")}}
  - {{glossary("Gzip compression")}}
- [RFC Zstandard](https://datatracker.ietf.org/doc/html/rfc8878)
- [Trang chủ Zstandard](https://facebook.github.io/zstd/)
- [Kho lưu trữ GitHub Zstandard](https://github.com/facebook/zstd)
- [Zstandard](https://en.wikipedia.org/wiki/Zstandard) trên Wikipedia
- [Zstandard trên Caniuse](https://caniuse.com/#feat=zstandard)
