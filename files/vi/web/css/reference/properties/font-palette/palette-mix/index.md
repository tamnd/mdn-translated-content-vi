---
title: palette-mix()
slug: Web/CSS/Reference/Properties/font-palette/palette-mix
page-type: css-function
status:
  - experimental
browser-compat: css.properties.font-palette.palette-mix_function
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`palette-mix()`** [CSS](/en-US/docs/Web/CSS) là một [hàm](/en-US/docs/Web/CSS/Reference/Values/Functions) có thể được dùng để tạo giá trị {{cssxref("font-palette")}} mới bằng cách pha trộn hai giá trị `font-palette` theo tỷ lệ phần trăm và phương pháp nội suy màu được chỉ định.

## Cú pháp

```css
/* Pha trộn các bảng màu được định nghĩa trong font */
font-palette: palette-mix(in lch, normal, dark)

/* Pha trộn các bảng màu do tác giả định nghĩa */
font-palette: palette-mix(in lch, --blues, --yellows)

/* Thay đổi tỷ lệ phần trăm của mỗi bảng màu pha trộn */
font-palette: palette-mix(in lch, --blues 50%, --yellows 50%)
font-palette: palette-mix(in lch, --blues 70%, --yellows 30%)

/* Thay đổi phương pháp nội suy màu */
font-palette: palette-mix(in srgb, --blues, --yellows)
font-palette: palette-mix(in hsl, --blues, --yellows)
font-palette: palette-mix(in hsl shorter hue, --blues, --yellows)

```

### Các giá trị

Ký hiệu hàm:

```plain
palette-mix(method, palette1 [p1], palette2 [p2])
```

- `method`
  - : Một {{cssxref("&lt;color-interpolation-method&gt;")}} chỉ định không gian màu nội suy.
- `palette1`, `palette2`
  - : Các giá trị {{cssxref("font-palette")}} để pha trộn cùng nhau. Đây có thể là _bất kỳ_ giá trị `font-palette` nào, bao gồm các hàm `palette-mix()`, `normal`, `dark`, và `light`.
- `p1`, `p2` {{optional_inline}}
  - : Các giá trị {{cssxref("&lt;percentage&gt;")}} từ `0%` đến `100%` chỉ định lượng mỗi bảng màu để pha trộn. Chúng được chuẩn hóa như sau:
    - Nếu cả `p1` và `p2` đều bị bỏ qua, thì `p1 = p2 = 50%`.
    - Nếu `p1` bị bỏ qua, thì `p1 = 100% - p2`.
    - Nếu `p2` bị bỏ qua, thì `p2 = 100% - p1`.
    - Nếu `p1 = p2 = 0%`, hàm không hợp lệ.
    - Nếu `p1 + p2 ≠ 100%`, thì `p1' = p1 / (p1 + p2)` và `p2' = p2 / (p1 + p2)`, trong đó `p1'` và `p2'` là kết quả chuẩn hóa.

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Dùng `palette-mix()` để pha trộn hai bảng màu

Ví dụ này cho thấy cách dùng hàm `palette-mix()` để tạo bảng màu mới bằng cách pha trộn hai bảng màu khác.

#### HTML

HTML chứa ba đoạn văn để áp dụng thông tin font:

```html
<p class="yellowPalette">Yellow palette</p>
<p class="bluePalette">Blue palette</p>
<p class="mixedPalette">Mixed palette</p>
```

#### CSS

Trong CSS, chúng ta nhập font màu từ Google Fonts, và định nghĩa hai giá trị `font-palette` tùy chỉnh bằng quy tắc at {{cssxref("@font-palette-values")}}. Sau đó chúng ta áp dụng ba giá trị `font-palette` khác nhau cho các đoạn văn — `--yellow`, `--blue`, và một bảng màu xanh lá mới, được tạo bằng `palette-mix()` để pha trộn bảng màu xanh và vàng lại với nhau.

```css
@import "https://fonts.googleapis.com/css2?family=Nabla&display=swap";

@font-palette-values --blue-nabla {
  font-family: "Nabla";
  base-palette: 2; /* đây là bảng màu xanh của Nabla */
}

@font-palette-values --yellow-nabla {
  font-family: "Nabla";
  base-palette: 7; /* đây là bảng màu vàng của Nabla */
}

p {
  font-family: "Nabla", fantasy;
  font-size: 4rem;
  text-align: center;
  margin: 0;
}

.yellowPalette {
  font-palette: --yellow-nabla;
}

.bluePalette {
  font-palette: --blue-nabla;
}

.mixedPalette {
  font-palette: palette-mix(in lch, --blue-nabla 55%, --yellow-nabla 45%);
}
```

#### Kết quả

Kết quả trông như thế này:

{{EmbedLiveSample("Using `palette-mix()` to blend two palettes", "100%", 350)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-palette")}}
- {{cssxref("@font-palette-values", "@font-palette-values")}}
- {{cssxref("color_value/color-mix", "color-mix()")}}
- Hướng dẫn [Giá trị màu CSS](/en-US/docs/Web/CSS/Guides/Colors/Color_values)
- {{glossary("Color space")}}
