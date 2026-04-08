---
title: <color-interpolation-method>
slug: Web/CSS/Reference/Values/color-interpolation-method
page-type: css-type
browser-compat:
  - css.types.color.color-mix
  - css.types.color.color.display-p3-linear
spec-urls: https://drafts.csswg.org/css-color/#interpolation-space
sidebar: cssref
---

Kiểu dữ liệu **`<color-interpolation-method>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho [không gian màu](/vi/docs/Glossary/Color_space) được sử dụng để nội suy giữa các giá trị {{CSSXref("&lt;color&gt;")}}. Nó có thể được dùng để ghi đè không gian màu nội suy mặc định cho các ký hiệu hàm liên quan đến màu sắc như {{CSSXref("color_value/color-mix", "color-mix()")}} và {{CSSXref("gradient/linear-gradient", "linear-gradient()")}}.

Khi nội suy các giá trị `<color>`, không gian màu nội suy mặc định là Oklab.

## Cú pháp

`<color-interpolation-method>` chỉ định liệu nội suy có nên sử dụng không gian màu hình chữ nhật hay không gian màu cực với phương pháp nội suy hue tùy chọn:

```plain
in <rectangular-color-space>
// or
in <polar-color-space>[ <hue-interpolation method>]
```

### Giá trị

- `<rectangular-color-space>`
  - : Một trong các từ khóa `srgb`, `srgb-linear`, `display-p3`, `a98-rgb`, `prophoto-rgb`, `rec2020`, `lab`, `oklab`, `xyz`, `xyz-d50`, hoặc `xyz-d65`.

- `<polar-color-space>`
  - : Một trong các từ khóa `hsl`, `hwb`, `lch`, hoặc `oklch`.

- {{CSSXref("&lt;hue-interpolation-method&gt;")}} {{optional_inline}}
  - : Thuật toán nội suy hue. Mặc định là `shorter hue`.

- `<custom-color-space>`
  - : Một [`<dashed-ident>`](/vi/docs/Web/CSS/Reference/Values/dashed-ident#using_with_color-profile) tham chiếu đến một [@color profile](/vi/docs/Web/CSS/Reference/At-rules/@color-profile) tùy chỉnh.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### So sánh các không gian màu nội suy sử dụng gradient

Ví dụ sau cho thấy hiệu ứng của việc sử dụng các không gian màu nội suy khác nhau cho {{CSSXref("gradient/linear-gradient", "linear-gradient()")}}.

#### HTML

```html
<div>sRGB:</div>
<div class="gradient srgb"></div>
<div>Oklab:</div>
<div class="gradient oklab"></div>
<div>Oklch (với <code>longer hue</code>):</div>
<div class="gradient oklch-longer"></div>
```

#### CSS

```css
.gradient {
  height: 50px;
  width: 100%;
}
.srgb {
  background-image: linear-gradient(in srgb to right, blue, red);
}
.oklab {
  background-image: linear-gradient(in oklab to right, blue, red);
}
.oklch-longer {
  background-image: linear-gradient(in oklch longer hue to right, blue, red);
}
```

#### Kết quả

{{EmbedLiveSample("comparing_interpolation_color_spaces_using_gradients", "100%", 250)}}

### Nội suy màu trong gradient lặp lại

Ví dụ sau cho thấy cách chỉ định không gian màu khi nội suy màu sắc trong gradient lặp lại.
Ba hộp hiển thị các loại gradient lặp lại khác nhau sử dụng các hàm [`repeating-conic-gradient()`](/vi/docs/Web/CSS/Reference/Values/gradient/repeating-conic-gradient), [`repeating-linear-gradient()`](/vi/docs/Web/CSS/Reference/Values/gradient/repeating-linear-gradient) và [`repeating-radial-gradient()`](/vi/docs/Web/CSS/Reference/Values/gradient/repeating-radial-gradient).
Hộp đầu tiên sử dụng không gian màu Lab để nội suy giữa hai giá trị màu.
Hộp thứ hai và thứ ba sử dụng OkLCh và thêm vào đó cung cấp {{cssxref("hue-interpolation-method")}} để chỉ định cách nội suy giữa các giá trị hue.

#### HTML

```html
<div class="gradient conic">conic</div>
<div class="gradient linear">linear</div>
<div class="gradient radial">radial</div>
```

#### CSS

Chúng ta đã dùng cùng hai màu trong mỗi gradient để minh họa các hiệu ứng khác nhau của {{cssxref("hue-interpolation-method")}} và {{glossary("color space")}} đối với nội suy màu trong gradient.

```css hidden
.gradient {
  height: 200px;
  width: 200px;
  display: inline-block;
  font-family: monospace;
  margin: 10px;
  font-size: 16px;
}
```

```css
.conic {
  background-image: repeating-conic-gradient(
    in lab,
    burlywood,
    blueviolet 120deg
  );
}

.linear {
  background-image: repeating-linear-gradient(
    in oklch,
    burlywood,
    blueviolet 75px
  );
}

.radial {
  background-image: repeating-radial-gradient(
    in oklch longer hue,
    blueviolet 50px,
    burlywood 100px
  );
}
```

#### Kết quả

{{EmbedLiveSample("hue_interpolation_in_repeating_gradients", "100%", 250)}}

So sánh hộp đầu tiên và thứ hai cho thấy sự khác biệt của việc nội suy giữa hai màu trong các không gian màu khác nhau.
So sánh hộp thứ hai và thứ ba cho thấy sự khác biệt giữa các {{cssxref("hue-interpolation-method")}}, với gradient tuyến tính dùng phương pháp shorter (mặc định) và gradient hướng tâm dùng phương pháp longer.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("&lt;color&gt;")}}, {{cssxref("gradient")}}
- {{CSSXref("&lt;hue-interpolation-method&gt;")}}
