---
title: Không gian màu
slug: Glossary/Color_space
page-type: glossary-definition
sidebar: glossarysidebar
---

**Không gian màu** (color space) là cách tổ chức màu sắc có tên gọi dựa trên các mô hình màu dạng tọa độ. Mô hình màu xác định cách các thành phần của màu (ví dụ: các kênh `h`, `w` và `b` của màu {{cssxref("color_value/hwb")}}) liên quan đến không gian màu. Hầu hết các không gian màu là lưới ba hoặc bốn chiều đại diện cho màu sắc, mỗi chiều tương ứng với một kênh khác nhau. Màu sắc có thể được biểu thị trong nhiều không gian màu và chuyển đổi từ không gian màu này sang không gian màu khác trong khi vẫn trông như nhau.

Không gian màu phân loại và xác định các dải màu cụ thể. Mỗi không gian màu được định nghĩa bằng mô hình toán học và bộ quy tắc liên quan, có {{glossary("Gamut", "gam màu")}} xác định phạm vi màu có thể biểu diễn. Các quy tắc này cho phép biểu diễn màu nhất quán và tái tạo được trên các thiết bị và phần mềm khác nhau.

Không gian màu _sRGB_ (đỏ, xanh lá, xanh lam chuẩn) được tạo ra cho web, nhưng hiện tại chúng ta không còn bị giới hạn ở không gian màu này. [CSS Color Module Level 4](https://drafts.csswg.org/css-color-4) quy định một số không gian màu được định sẵn, và [CSS Color Module Level 5](https://drafts.csswg.org/css-color-5/) còn đi xa hơn, quy định các tính năng để định nghĩa không gian màu tùy chỉnh.

## Xem thêm

- Tính năng `@media` {{cssxref("@media/color-gamut")}}
- Kiểu dữ liệu CSS {{cssxref("&lt;color&gt;")}}
- [Không gian màu sRGB](https://webstore.iec.ch/en/publication/6168)
- [Không gian màu CIELAB](https://en.wikipedia.org/wiki/CIELAB_color_space) trên Wikipedia
- [Không gian màu CIE 1931](https://en.wikipedia.org/wiki/CIE_1931_color_space) trên Wikipedia
