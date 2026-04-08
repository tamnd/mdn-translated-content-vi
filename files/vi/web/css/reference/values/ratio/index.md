---
title: <ratio>
slug: Web/CSS/Reference/Values/ratio
page-type: css-type
browser-compat: css.types.ratio
spec-urls: https://drafts.csswg.org/css-values-4/#ratio-value
sidebar: cssref
---

Kiểu dữ liệu **`<ratio>`** trong [CSS](/vi/docs/Web/CSS) mô tả mối quan hệ tỷ lệ giữa hai giá trị. Nó chủ yếu đại diện cho tỷ lệ khung hình, liên kết chiều rộng với chiều cao. Ví dụ, `<ratio>` được dùng làm giá trị cho đặc tính media `aspect-ratio` trong media query {{cssxref("@media")}}, đặc tính kích thước `aspect-ratio` trong container query {{cssxref("@container")}}, và làm giá trị cho thuộc tính CSS {{cssxref("aspect-ratio")}}.

## Cú pháp

Kiểu dữ liệu `<ratio>` là một {{cssxref("&lt;number&gt;")}} theo sau là dấu gạch chéo ('/', Unicode `U+002F SOLIDUS`) và một {{cssxref("&lt;number&gt;")}} thứ hai. Cả hai số phải là số dương. Khoảng trắng trước và sau dấu gạch chéo là tùy chọn. Số đầu tiên đại diện cho chiều rộng, còn số thứ hai đại diện cho chiều cao. Ngoài ra, một {{cssxref("&lt;number&gt;")}} đơn lẻ làm giá trị cũng được chấp nhận.

Hai tỷ lệ được so sánh bằng giá trị số của thương số. Ví dụ, 16/16 nhỏ hơn 16/9 vì nó phân giải thành 1 trong khi cái thứ hai phân giải thành 1.7. Điều này có nghĩa là tỷ lệ khung hình của màn hình dọc nhỏ hơn màn hình ngang, và ảnh dọc có tỷ lệ khung hình nhỏ hơn ảnh ngang.

### Các tỷ lệ khung hình phổ biến

| Tỷ lệ                 |                                                                              | Sử dụng                                              |
| --------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------------- |
| `4/3` hoặc `1.33333`    | ![Hình chữ nhật cao ba đơn vị và rộng bốn đơn vị](ratio4_3.png)    | Định dạng TV truyền thống thế kỷ XX.      |
| `16/9` hoặc `1.7777778` | ![Hình chữ nhật cao chín đơn vị và rộng mười sáu đơn vị](ratio16_9.png) | Định dạng TV "màn hình rộng" hiện đại.         |
| `185/100` hoặc `1.85`   | ![Hình chữ nhật cao 1 đơn vị và rộng 1.85 đơn vị](ratio1_1.85.png)      | Định dạng phim phổ biến nhất từ những năm 1960.    |
| `239/100` hoặc `2.39`   | ![Hình chữ nhật cao 1 đơn vị và rộng 2.39 đơn vị](ratio1_2.39.png)      | Định dạng phim anamorphic "màn hình siêu rộng".     |

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Dùng trong media query

```css
@media screen and (aspect-ratio >= 16/9) {
  /* … */
}
```

### Dùng trong @container size query

```css
@container (aspect-ratio > 1) and (width < 20em) {
  /* … */
}
```

### Dùng làm giá trị thuộc tính CSS

```css
.square {
  aspect-ratio: 1 / 1;
}
.circle {
  aspect-ratio: 1;
  border-radius: 50%;
}
.portrait {
  aspect-ratio: 5 / 7;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Bộ mô tả media [`aspect-ratio`](/vi/docs/Web/CSS/Reference/At-rules/@media/aspect-ratio)
- [Hiểu về tỷ lệ khung hình](/vi/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- Hướng dẫn [CSS container queries](/vi/docs/Web/CSS/Guides/Containment/Container_queries)
- Hướng dẫn [Using container size and style queries](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- Mô-đun [CSS media queries](/vi/docs/Web/CSS/Guides/Media_queries)
- Mô-đun [CSS containment](/vi/docs/Web/CSS/Guides/Containment)
- Mô-đun [CSS box sizing](/vi/docs/Web/CSS/Guides/Box_sizing)
- Mô-đun [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units)
