---
title: <color>
slug: Web/CSS/Reference/Values/color_value
page-type: css-type
browser-compat: css.types.color
sidebar: cssref
---

Kiểu dữ liệu **`<color>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho một màu sắc.
Một `<color>` cũng có thể bao gồm giá trị _độ trong suốt_ [alpha-channel](https://en.wikipedia.org/wiki/Alpha_compositing), cho biết cách màu sắc nên [kết hợp](https://drafts.csswg.org/compositing-1/#simplealphacompositing) với nền của nó.

> [!NOTE]
> Mặc dù các giá trị `<color>` được xác định chính xác, nhưng giao diện thực tế của chúng có thể biến đổi (đôi khi đáng kể) từ thiết bị này sang thiết bị khác. Điều này là vì hầu hết các thiết bị không được hiệu chỉnh và một số trình duyệt không hỗ trợ [hồ sơ màu](https://en.wikipedia.org/wiki/ICC_profile) của thiết bị đầu ra.

## Cú pháp

```css
/* Màu được đặt tên */
rebeccapurple
aliceblue

/* Thập lục phân RGB */
#f09
#ff0099

/* RGB (Red, Green, Blue) */
rgb(255 0 153)
rgb(255 0 153 / 80%)

/* HSL (Hue, Saturation, Lightness) */
hsl(150 30% 60%)
hsl(150 30% 60% / 80%)

/* HWB (Hue, Whiteness, Blackness) */
hwb(12 50% 0%)
hwb(194 0% 0% / 0.5)

/* Lab (Lightness, A-axis, B-axis) */
lab(50% 40 59.5)
lab(50% 40 59.5 / 0.5)

/* LCH (Lightness, Chroma, Hue) */
lch(52.2% 72.2 50)
lch(52.2% 72.2 50 / 0.5)

/* Oklab (Lightness, A-axis, B-axis) */
oklab(59% 0.1 0.1)
oklab(59% 0.1 0.1 / 0.5)

/* OkLCh (Lightness, Chroma, Hue) */
oklch(60% 0.15 50)
oklch(60% 0.15 50 / 0.5)

/* Màu CSS tương đối */
/* Thay đổi hue HSL */
hsl(from red 240deg s l)
/* Thay đổi kênh alpha HWB */
hwb(from green h w b / 0.5)
/* Thay đổi lightness LCH */
lch(from blue calc(l + 20) c h)

/* light-dark */
light-dark(white, black)
light-dark(rgb(255 255 255), rgb(0 0 0))
```

Một giá trị `<color>` có thể được chỉ định bằng một trong các phương pháp dưới đây:

- Theo từ khóa: {{cssxref("named-color")}} (như `blue` hoặc `pink`), {{CSSXref("&lt;system-color&gt;")}}, và [`currentColor`](#currentcolor_keyword).
- Theo ký hiệu thập lục phân: {{CSSXref("&lt;hex-color&gt;")}} (như `#ff0000`).
- Theo `<color-function>`, với các tham số trong một {{glossary("color space")}} sử dụng ký hiệu hàm:
  - Không gian màu [sRGB](https://en.wikipedia.org/wiki/SRGB): {{CSSXref("color_value/hsl", "hsl()")}}, {{CSSXref("color_value/hwb", "hwb()")}} và {{CSSXref("color_value/rgb", "rgb()")}}.
  - Không gian màu [CIELAB](https://en.wikipedia.org/wiki/CIELAB_color_space): {{CSSXref("color_value/lab", "lab()")}} và {{CSSXref("color_value/lch", "lch()")}}.
  - Không gian màu [Oklab](https://bottosson.github.io/posts/oklab/): {{CSSXref("color_value/oklab", "oklab()")}} và {{CSSXref("color_value/oklch", "oklch()")}}.
  - Các không gian màu khác: {{CSSXref("color_value/color", "color()")}}, {{CSSXref("color_value/device-cmyk", "device-cmyk()")}}.
- Bằng cách sử dụng cú pháp [màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors) để xuất màu mới dựa trên màu hiện có. Bất kỳ hàm màu nào ở trên đều có thể nhận **màu gốc** được đặt trước bởi từ khóa `from` và theo sau là các định nghĩa giá trị kênh cho **màu đầu ra** mới.
- Bằng cách trộn hai màu: {{CSSXref("color_value/color-mix", "color-mix()")}}.
- Bằng cách chỉ định màu mà bạn muốn trả về màu tương phản: {{CSSXref("color_value/contrast-color", "contrast-color()")}}.
- Bằng cách chỉ định hai màu, sử dụng màu đầu tiên cho các bộ màu sáng và màu thứ hai cho các bộ màu tối: {{CSSXref("color_value/light-dark", "light-dark()")}}.

### Từ khóa `currentColor`

Từ khóa `currentColor` đại diện cho giá trị thuộc tính {{Cssxref("color")}} của phần tử. Điều này cho phép bạn sử dụng giá trị `color` trên các thuộc tính không nhận nó theo mặc định.

Nếu `currentColor` được sử dụng làm giá trị của thuộc tính `color`, thì thay vào đó nó lấy giá trị từ giá trị được kế thừa của thuộc tính `color`.

```html
<div class="container">
  The color of this text is blue.
  <div class="child"></div>
  This block is surrounded by a blue border.
</div>
```

```css
.container {
  color: blue;
  border: 1px dashed currentColor;
}
.child {
  background: currentColor;
  height: 9px;
}
```

{{EmbedLiveSample("currentcolor_keyword", "100%", 80)}}

### Các thành phần màu thiếu

Mỗi thành phần của bất kỳ hàm màu CSS nào - ngoại trừ những hàm sử dụng cú pháp dấu phẩy cũ - có thể được chỉ định là từ khóa `none` để là một thành phần thiếu.

Việc chỉ định rõ ràng [các thành phần thiếu trong nội suy màu](#interpolation_with_missing_components) hữu ích cho các trường hợp bạn muốn {{glossary("interpolation", "nội suy")}} một số thành phần màu nhưng không phải các thành phần khác. Cho tất cả các mục đích khác, một thành phần thiếu sẽ có giá trị bằng không trong đơn vị thích hợp: `0`, `0%`, hoặc `0deg`. Ví dụ, các màu sau tương đương nhau khi được dùng ngoài nội suy:

```css
/* Chúng tương đương */
color: oklab(50% none -0.25);
color: oklab(50% 0 -0.25);

/* Chúng tương đương */
background-color: hsl(none 100% 50%);
background-color: hsl(0deg 100% 50%);
```

## Nội suy

Nội suy màu xảy ra với [gradient](/vi/docs/Web/CSS/Reference/Values/gradient), [transition](/vi/docs/Web/CSS/Guides/Transitions/Using) và [animation](/vi/docs/Web/CSS/Guides/Animations/Using).

Khi nội suy các giá trị `<color>`, chúng trước tiên được chuyển đổi sang một không gian màu nhất định, và sau đó mỗi thành phần của [giá trị tính toán](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) được nội suy tuyến tính, với tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) trong transition và animation. Không gian màu nội suy mặc định là Oklab, nhưng có thể được ghi đè thông qua {{CSSXref("&lt;color-interpolation-method&gt;")}} trong một số ký hiệu hàm liên quan đến màu.

### Nội suy với các thành phần thiếu

#### Nội suy màu trong cùng không gian

Khi nội suy các màu ở đúng không gian màu nội suy, các thành phần thiếu từ một màu được thay thế bằng các giá trị hiện có của các thành phần tương tự từ màu kia.
Ví dụ, hai biểu thức sau tương đương:

```css
color-mix(in oklch, oklch(none 0.2 10), oklch(60% none 30))
color-mix(in oklch, oklch(60% 0.2 10), oklch(60% 0.2 30))
```

> [!NOTE]
> Nếu một thành phần thiếu trong cả hai màu, thành phần này sẽ bị thiếu sau khi nội suy.

#### Nội suy màu từ các không gian khác nhau: các thành phần tương đồng

Nếu bất kỳ màu nào cần nội suy không ở trong không gian màu nội suy, các thành phần thiếu của nó được chuyển vào màu đã được chuyển đổi dựa trên **các thành phần tương đồng** của cùng danh mục như được mô tả trong bảng sau:

| Danh mục     | Các thành phần tương đồng |
| ------------ | ------------------------- |
| Reds         | `R`, `X`                  |
| Greens       | `G`, `Y`                  |
| Blues        | `B`, `Z`                  |
| Lightness    | `L`                       |
| Colorfulness | `C`, `S`                  |
| Hue          | `H`                       |
| a            | `a`                       |
| b            | `b`                       |

Ví dụ:

- `X` (`0.2`) trong `color(xyz 0.2 0.1 0.6)` tương đồng với `R` (`50%`) trong `rgb(50% 70% 30%)`.
- `H` (`0deg`) trong `hsl(0deg 100% 80%)` tương đồng với `H` (`140`) trong `oklch(80% 0.1 140)`.

Sử dụng OkLCh làm không gian màu nội suy và hai màu dưới đây làm ví dụ:

```css
lch(80% 30 none)
color(display-p3 0.7 0.5 none)
```

Quy trình tiền xử lý là:

1. Thay thế các thành phần thiếu trong cả hai màu bằng giá trị bằng không:

   ```css
   lch(80% 30 0)
   color(display-p3 0.7 0.5 0)
   ```

2. Chuyển đổi cả hai màu sang không gian màu nội suy:

   ```css
   oklch(83.915% 0.0902 0.28)
   oklch(63.612% 0.1522 78.748)
   ```

3. Nếu bất kỳ thành phần nào của màu đã chuyển đổi tương đồng với thành phần thiếu trong màu gốc tương ứng, đặt lại nó là thành phần thiếu:

   ```css
   oklch(83.915% 0.0902 none)
   oklch(63.612% 0.1522 78.748)
   ```

4. Thay thế bất kỳ thành phần thiếu nào bằng thành phần tương tự từ màu đã chuyển đổi kia:

   ```css
   oklch(83.915% 0.0902 78.748)
   oklch(63.612% 0.1522 78.748)
   ```

## Khả năng tiếp cận

Một số người gặp khó khăn trong việc phân biệt màu sắc. Khuyến nghị [WCAG 2.2](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Use_of_color) khuyến cáo mạnh mẽ không nên sử dụng màu sắc là phương tiện duy nhất để truyền đạt thông tin, hành động hoặc kết quả cụ thể. Xem [màu sắc và độ tương phản màu](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) để biết thêm thông tin.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Khám phá các giá trị màu

Trong ví dụ này, chúng ta cung cấp một `<div>` và ô nhập văn bản. Nhập một màu hợp lệ vào ô nhập làm cho `<div>` áp dụng màu đó, cho phép bạn kiểm tra các giá trị màu của mình.

#### HTML

```html
<div></div>
<hr />
<label for="color">Enter a valid color value:</label>
<input type="text" id="color" />
```

```css hidden
div {
  height: 200px;
  width: 200px;
}
```

```js hidden
const inputElem = document.querySelector("input");
const divElem = document.querySelector("div");

function validTextColor(stringToTest) {
  if (stringToTest === "inherit" || stringToTest === "transparent") {
    return false;
  }

  const div = document.createElement("div");
  div.style.color = stringToTest;
  return !!div.style.color;
}

inputElem.addEventListener("input", () => {
  if (validTextColor(inputElem.value)) {
    divElem.style.backgroundColor = inputElem.value;
    divElem.textContent = "";
  } else {
    divElem.removeAttribute("style");
    divElem.textContent = "Invalid color value";
  }
});
```

#### Kết quả

{{EmbedLiveSample("exploring_color_values", "100%", 300)}}

### Tạo màu sRGB bão hòa đầy đủ

Ví dụ này cho thấy các màu sRGB bão hòa đầy đủ trong không gian màu sRGB.

#### HTML

```html
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
```

#### CSS

```css hidden
body {
  display: flex;
  flex-wrap: wrap;
}
div {
  height: 80px;
  margin: 10px;
  width: 80px;
}
```

```css
div:nth-child(1) {
  background-color: hsl(0 100% 50%);
}
div:nth-child(2) {
  background-color: hsl(30 100% 50%);
}
div:nth-child(3) {
  background-color: hsl(60 100% 50%);
}
div:nth-child(4) {
  background-color: hsl(90 100% 50%);
}
div:nth-child(5) {
  background-color: hsl(120 100% 50%);
}
div:nth-child(6) {
  background-color: hsl(150 100% 50%);
}
div:nth-child(7) {
  background-color: hsl(180 100% 50%);
}
div:nth-child(8) {
  background-color: hsl(210 100% 50%);
}
div:nth-child(9) {
  background-color: hsl(240 100% 50%);
}
div:nth-child(10) {
  background-color: hsl(270 100% 50%);
}
div:nth-child(11) {
  background-color: hsl(300 100% 50%);
}
div:nth-child(12) {
  background-color: hsl(330 100% 50%);
}
```

#### Kết quả

{{EmbedLiveSample("generating_fully_saturated_sRGB_colors", "100%", 200)}}

### Tạo các sắc độ khác nhau của màu đỏ

Ví dụ này cho thấy các màu đỏ với các sắc độ khác nhau trong không gian màu sRGB.

#### HTML

```html
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
```

#### CSS

```css hidden
body {
  display: flex;
  flex-wrap: wrap;
}
div {
  box-sizing: border-box;
  height: 80px;
  margin: 10px;
  width: 80px;
}
```

```css
div:nth-child(1) {
  background-color: hsl(0 100% 0%);
}
div:nth-child(2) {
  background-color: hsl(0 100% 20%);
}
div:nth-child(3) {
  background-color: hsl(0 100% 40%);
}
div:nth-child(4) {
  background-color: hsl(0 100% 60%);
}
div:nth-child(5) {
  background-color: hsl(0 100% 80%);
}
div:nth-child(6) {
  background-color: hsl(0 100% 100%);
  border: solid;
}
```

#### Kết quả

{{EmbedLiveSample("creating_different_shades_of_red", "100%", 150)}}

### Tạo màu đỏ với độ bão hòa khác nhau

Ví dụ này cho thấy các màu đỏ với độ bão hòa khác nhau trong không gian màu sRGB.

#### HTML

```html
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
<div></div>
```

#### CSS

```css hidden
body {
  display: flex;
  flex-wrap: wrap;
}
div {
  height: 80px;
  margin: 10px;
  width: 80px;
}
```

```css
div:nth-child(1) {
  background-color: hsl(0 0% 50%);
}
div:nth-child(2) {
  background-color: hsl(0 20% 50%);
}
div:nth-child(3) {
  background-color: hsl(0 40% 50%);
}
div:nth-child(4) {
  background-color: hsl(0 60% 50%);
}
div:nth-child(5) {
  background-color: hsl(0 80% 50%);
}
div:nth-child(6) {
  background-color: hsl(0 100% 50%);
}
```

#### Kết quả

{{EmbedLiveSample("creating_reds_of_different_saturation", "100%", 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("opacity")}}: thuộc tính xác định độ trong suốt ở cấp độ phần tử
- {{cssxref("hue")}}: kiểu dữ liệu đại diện cho góc hue của màu
- {{CSSXref("color")}}, {{CSSXref("background-color")}}, {{CSSXref("border-color")}}, {{CSSXref("box-shadow")}}, {{CSSXref("outline-color")}}, {{CSSXref("text-shadow")}}: các thuộc tính phổ biến dùng `<color>`
- Hàm {{CSSXref("color_value/color")}}
- [Áp dụng màu cho các phần tử HTML bằng CSS](/vi/docs/Web/CSS/Guides/Colors/Applying_color)
- [Sử dụng màu tương đối](/vi/docs/Web/CSS/Guides/Colors/Using_relative_colors)
- [Các hàm, gradient và hue mới trong màu CSS (Level 4)](/vi/blog/css-color-module-level-4/) trên blog MDN (2023)
