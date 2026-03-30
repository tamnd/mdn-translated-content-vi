---
title: Lossy compression
slug: Glossary/Lossy_compression
page-type: glossary-definition
sidebar: glossarysidebar
---

**Nén có mất dữ liệu** (Lossy compression), hay nén không thể đảo ngược, là phương pháp nén dữ liệu sử dụng các xấp xỉ không chính xác và loại bỏ một phần dữ liệu để biểu diễn nội dung. Nói đơn giản hơn: nén lossy làm mất dữ liệu từ tệp ban đầu, có thể gây ra sự xuống cấp về chất lượng. Quá trình nén này không thể đảo ngược; một khi đã thực hiện nén lossy trên nội dung, nội dung đó không thể được khôi phục về trạng thái gốc. Do đó, nội dung đã qua nén lossy thường không nên được chỉnh sửa thêm.

Nén lossy được sử dụng rộng rãi trong các định dạng hình ảnh như {{glossary("JPEG")}}, {{glossary("WebP")}}, và các định dạng âm thanh và video như [MP3, MP4, H.264 và các định dạng khác](/en-US/docs/Web/HTTP/Guides/MIME_types/Common_types).
Các phương pháp nén như {{glossary("WebP")}} có khả năng [nén cả lossy và lossless](https://developers.google.com/speed/webp/docs/compression) tùy thuộc vào mức độ nén hoặc các tùy chọn bạn muốn sử dụng trong quá trình mã hóa.

![Lossy compression image](2019-11-18.png)

Mặc dù không có sự khác biệt rõ ràng về chất lượng giữa hai hình ảnh trên, kích thước của hình ảnh thứ hai đã được giảm đáng kể bằng cách sử dụng nén lossy.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Lossless compression")}}
