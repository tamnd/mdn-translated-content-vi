---
title: <hue>
slug: Web/CSS/Reference/Values/hue
page-type: css-type
browser-compat:
  - css.types.color.hsl
  - css.types.color.hwb
  - css.types.color.lch
  - css.types.color.oklch
spec-urls: https://drafts.csswg.org/css-color/#typedef-hue
sidebar: cssref
---

Kiểu dữ liệu **`<hue>`** của [CSS](/vi/docs/Web/CSS) đại diện cho góc sắc độ của một màu.
Nó được sử dụng trong các hàm màu nhận sắc độ được biểu thị bằng một giá trị duy nhất, cụ thể là các ký hiệu hàm [`hsl()`](/vi/docs/Web/CSS/Reference/Values/color_value/hsl), [`hwb()`](/vi/docs/Web/CSS/Reference/Values/color_value/hwb), [`lch()`](/vi/docs/Web/CSS/Reference/Values/color_value/lch), và [`oklch()`](/vi/docs/Web/CSS/Reference/Values/color_value/oklch).

## Cú pháp

Một `<hue>` có thể là `<angle>` hoặc `<number>`.

### Giá trị

- {{cssxref("angle")}}
  - : Một góc được biểu thị bằng độ, gradian, radian hoặc vòng sử dụng lần lượt `deg`, `grad`, `rad`, hoặc `turn`.
- `<number>`
  - : Một số thực, đại diện cho số độ của góc sắc độ.

Vì `<angle>` có tính chu kỳ, `<hue>` được chuẩn hóa về khoảng `[0deg, 360deg)`. Nó bao quanh ngầm định sao cho `480deg` giống như `120deg`, `-120deg` giống như `240deg`, `-1turn` giống như `1turn`, v.v.

## Mô tả

![Bánh xe màu sRGB](color_wheel.svg)

Bánh xe màu ở trên cho thấy các sắc độ ở tất cả các góc trong [không gian màu](https://en.wikipedia.org/wiki/SRGB) {{glossary("color space")}} sRGB. Cụ thể, _đỏ_ ở `0deg`, _vàng_ ở `60deg`, _xanh lá_ ở `120deg`, _lam_ ở `180deg`, _xanh dương_ ở `240deg`, và _hồng tím_ ở `300deg`.

Các góc tương ứng với các sắc độ cụ thể khác nhau tùy thuộc vào không gian màu. Ví dụ, góc sắc độ của màu xanh lá sRGB là `120deg` trong không gian màu sRGB, nhưng là `134.39deg` trong không gian màu CIELAB.

Bảng sau liệt kê các màu điển hình ở các góc khác nhau trong không gian màu sRGB (được sử dụng bởi {{CSSXref("color_value/hsl", "hsl()")}} và {{CSSXref("color_value/hwb", "hwb()")}}), CIELAB (được sử dụng bởi {{CSSXref("color_value/lch", "lch()")}}), và Oklab (được sử dụng bởi {{CSSXref("color_value/oklch", "oklch()")}}):

<table>
  <colgroup>
    <col />
    <col span="6" width="15%" />
  </colgroup>
  <thead>
    <tr>
      <th></th>
      <th scope="col">0°</th>
      <th scope="col">60°</th>
      <th scope="col">120°</th>
      <th scope="col">180°</th>
      <th scope="col">240°</th>
      <th scope="col">300°</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">sRGB</th>
      <td
        style="background: hsl(0 100% 50%);"
        title="hsl(0 100% 50%)"></td>
      <td
        style="background: hsl(60 100% 50%);"
        title="hsl(60 100% 50%)"></td>
      <td
        style="background: hsl(120 100% 50%);"
        title="hsl(120 100% 50%)"></td>
      <td
        style="background: hsl(180 100% 50%);"
        title="hsl(180 100% 50%)"></td>
      <td
        style="background: hsl(240 100% 50%);"
        title="hsl(240 100% 50%)"></td>
      <td
        style="background: hsl(300 100% 50%);"
        title="hsl(300 100% 50%)"></td>
    </tr>
    <tr>
      <th scope="row">CIELAB</th>
      <td
        style="background: lch(50% 50% 0);"
        title="lch(50% 50% 0)"></td>
      <td
        style="background: lch(65% 55% 60);"
        title="lch(65% 55% 60)"></td>
      <td
        style="background: lch(90% 65% 120);"
        title="lch(90% 65% 120)"></td>
      <td
        style="background: lch(90% 35% 180);"
        title="lch(90% 35% 180)"></td>
      <td
        style="background: lch(75% 25% 240);"
        title="lch(75% 25% 240)"></td>
      <td
        style="background: lch(40% 70% 300);"
        title="lch(40% 70% 300)"></td>
    </tr>
    <tr>
      <th scope="row">Oklab</th>
      <td
        style="background: oklch(65% 65% 0);"
        title="oklch(65% 65% 0)"></td>
      <td
        style="background: oklch(75% 40% 60);"
        title="oklch(75% 40% 60)"></td>
      <td
        style="background: oklch(90% 50% 120);"
        title="oklch(90% 50% 120)"></td>
      <td
        style="background: oklch(90% 35% 180);"
        title="oklch(90% 35% 180)"></td>
      <td
        style="background: oklch(70% 40% 240);"
        title="oklch(70% 40% 240)"></td>
      <td
        style="background: oklch(55% 70% 300);"
        title="oklch(55% 70% 300)"></td>
    </tr>
  </tbody>
</table>

## Nội suy các giá trị `<hue>`

Các giá trị `<hue>` được nội suy như các giá trị {{cssxref("angle")}}, và thuật toán nội suy mặc định là [`shorter`](/vi/docs/Web/CSS/Reference/Values/hue-interpolation-method#values). Trong một số hàm CSS liên quan đến màu, điều này có thể được ghi đè bởi thành phần {{CSSXref("&lt;hue-interpolation-method&gt;")}}.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thay đổi sắc độ của màu bằng thanh trượt

Ví dụ sau đây cho thấy hiệu ứng của việc thay đổi giá trị `hue` của ký hiệu hàm [`hsl()`](/vi/docs/Web/CSS/Reference/Values/color_value/hsl) trên một màu.

#### HTML

```html
<input type="range" min="0" max="360" value="0" id="hue-slider" />
<p>Sắc độ: <span id="hue-value">0deg</span></p>
<div id="box"></div>
```

#### CSS

```css hidden
div {
  width: 100px;
  height: 100px;
  margin: 10px;
  border: 1px solid black;
}
p {
  font-family: sans-serif;
}
span {
  font-family: monospace;
  background: rgb(0 0 0 / 10%);
  padding: 3px;
}
#hue-slider {
  width: 90%;
}
```

```css
#box {
  background-color: hsl(0 100% 50%);
}
```

#### JavaScript

```js
const hue = document.querySelector("#hue-slider");
const box = document.querySelector("#box");
hue.addEventListener("input", () => {
  box.style.backgroundColor = `hsl(${hue.value} 100% 50%)`;
  document.querySelector("#hue-value").textContent = `${hue.value}deg`;
});
```

#### Kết quả

{{EmbedLiveSample("changing_the_hue_of_a_color_using_a_slider", "100%", "200")}}

### Xấp xỉ sắc đỏ trong các không gian màu khác nhau

Ví dụ sau đây cho thấy màu đỏ tương tự trong các không gian màu khác nhau.
Các giá trị trong hàm `lch()` và `oklch()` được làm tròn để dễ đọc.

#### HTML

```html
<div data-color="hsl-red">hsl()</div>
<div data-color="hwb-red">hwb()</div>
<div data-color="lch-red">lch()</div>
<div data-color="oklch-red">oklch()</div>
```

#### CSS

```css
[data-color="hsl-red"] {
  /* hsl(<hue> <saturation> <lightness>) */
  background-color: hsl(0 100% 50%);
}
[data-color="hwb-red"] {
  /* hwb(<hue> <whiteness> <blackness>) */
  background-color: hwb(0 0% 0%);
}
[data-color="lch-red"] {
  /* lch(<lightness> <chroma> <hue>) */
  background-color: lch(50 150 40);
}
[data-color="oklch-red"] {
  /* oklch(<lightness> <chroma> <hue>) */
  background-color: oklch(0.6 0.4 20);
}
```

```css hidden
div {
  font-family: monospace;
  width: 100px;
  height: 100px;
  margin: 10px;
  border: 1px solid black;
  display: inline-block;
}
```

#### Kết quả

{{EmbedLiveSample("approximating_red_hues_in_different_color_spaces", "100%", "150")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;color&gt;")}}
- {{CSSXref("&lt;hue-interpolation-method&gt;")}}
