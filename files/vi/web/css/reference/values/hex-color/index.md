---
title: <hex-color>
slug: Web/CSS/Reference/Values/hex-color
page-type: css-type
browser-compat: css.types.color.rgb_hexadecimal_notation
sidebar: cssref
---

Kiểu dữ liệu **`<hex-color>`** của [CSS](/vi/docs/Web/CSS) là một ký hiệu để mô tả _cú pháp màu thập lục phân_ của một màu [sRGB](/vi/docs/Glossary/RGB) sử dụng các thành phần màu chính của nó (đỏ, xanh lá, xanh dương) được viết dưới dạng số thập lục phân, cùng với độ trong suốt của nó.

Giá trị `<hex-color>` có thể được sử dụng ở bất kỳ nơi nào có thể sử dụng {{cssxref("&lt;color&gt;")}}.

## Cú pháp

```plain
#RGB        // Cú pháp ba giá trị
#RGBA       // Cú pháp bốn giá trị
#RRGGBB     // Cú pháp sáu giá trị
#RRGGBBAA   // Cú pháp tám giá trị
```

### Giá trị

- `R` hoặc `RR`
  - : Thành phần _đỏ_ của màu, là một số thập lục phân không phân biệt chữ hoa chữ thường từ `0` đến `ff` (255). Nếu chỉ có một chữ số, nó được nhân đôi: `1` nghĩa là `11`.
- `G` hoặc `GG`
  - : Thành phần _xanh lá_ của màu, là một số thập lục phân không phân biệt chữ hoa chữ thường từ `0` đến `ff` (255). Nếu chỉ có một chữ số, nó được nhân đôi: `c` nghĩa là `cc`.
- `B` hoặc `BB`
  - : Thành phần _xanh dương_ của màu, là một số thập lục phân không phân biệt chữ hoa chữ thường từ `0` đến `ff` (255). Nếu chỉ có một chữ số, nó được nhân đôi: `9` nghĩa là `99`.
- `A` hoặc `AA` {{optional_inline}}
  - : Thành phần _alpha_ của màu, biểu thị độ trong suốt của nó, là một số thập lục phân không phân biệt chữ hoa chữ thường từ `0` đến `ff` (255). Nếu chỉ có một chữ số, nó được nhân đôi: `e` nghĩa là `ee`. `0` hoặc `00` đại diện cho màu hoàn toàn trong suốt, và `f` hoặc `ff` đại diện cho màu hoàn toàn không trong suốt.

> [!NOTE]
> Cú pháp không phân biệt chữ hoa chữ thường: `#00ff00` giống như `#00FF00`.

## Ví dụ

### Màu hồng đậm thập lục phân

Ví dụ này bao gồm bốn ô vuông màu hồng đậm, với nền hoàn toàn không trong suốt hoặc bán trong suốt được tạo bằng cách sử dụng bốn cú pháp hex-color có độ dài khác nhau, không phân biệt chữ hoa chữ thường.

#### HTML

```html
<div>
  #F09
  <div class="c1"></div>
</div>
<div>
  #f09a
  <div class="c2"></div>
</div>
<div>
  #ff0099
  <div class="c3"></div>
</div>
<div>
  #FF0099AA
  <div class="c4"></div>
</div>
```

#### CSS

Các màu nền hồng đậm được tạo bằng cách sử dụng ký hiệu hex ba, bốn, sáu và tám giá trị, sử dụng cả chữ hoa và chữ thường.

```css hidden
body {
  display: flex;
  justify-content: space-evenly;
  font-family: monospace;
}
div {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
```

```css
[class] {
  width: 40px;
  height: 40px;
}
.c1 {
  background: #f09;
}
.c2 {
  background: #f09a;
}
.c3 {
  background: #ff0099;
}
.c4 {
  background: #ff0099aa;
}
```

#### Kết quả

{{EmbedLiveSample("Hexadecimal_hot_pink", "100%", 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu dữ liệu {{cssxref("&lt;color&gt;")}}
- Kiểu dữ liệu {{cssxref("named-color")}}
- Hàm màu [`rgb()`](/vi/docs/Web/CSS/Reference/Values/color_value/rgb)
- Module [màu CSS](/vi/docs/Web/CSS/Guides/Colors)
