---
title: hue-rotate()
slug: Web/CSS/Reference/Values/filter-function/hue-rotate
page-type: css-function
browser-compat: css.types.filter-function.hue-rotate
sidebar: cssref
---

Hàm **`hue-rotate()`** [CSS](/vi/docs/Web/CSS) xoay [sắc độ](https://en.wikipedia.org/wiki/Hue) của một phần tử và nội dung của nó. Kết quả của nó là một {{cssxref("filter-function")}}.

> [!NOTE]
> `hue-rotate()` được chỉ định là phép toán ma trận trên màu RGB. Nó không thực sự chuyển đổi màu sang mô hình HSL, vốn là phép toán phi tuyến tính. Do đó, nó có thể không giữ nguyên độ bão hòa hoặc độ sáng của màu gốc, đặc biệt đối với các màu có độ bão hòa cao.

{{InteractiveExample("CSS Demo: hue-rotate()")}}

```css interactive-example-choice
filter: hue-rotate(0);
```

```css interactive-example-choice
filter: hue-rotate(90deg);
```

```css interactive-example-choice
filter: hue-rotate(-0.25turn);
```

```css interactive-example-choice
filter: hue-rotate(3.142rad);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

## Cú pháp

```css
hue-rotate(angle)
```

### Giá trị

- `angle` {{Optional_Inline}}
  - : Sự thay đổi tương đối về sắc độ của mẫu đầu vào, được chỉ định là {{cssxref("angle")}}. Giá trị `0deg` giữ nguyên đầu vào. Xoay sắc độ dương tăng giá trị sắc độ, trong khi xoay âm giảm giá trị sắc độ. Giá trị khởi tạo cho {{Glossary("interpolation")}} là `0`. Không có giá trị tối thiểu hay tối đa. Hiệu ứng của các giá trị trên `360deg`, với `hue-rotate(Ndeg)`, được tính bằng `N` modulo 360. Giá trị mặc định là `0deg`.

Kiểu dữ liệu CSS `<angle>` biểu diễn giá trị góc được biểu thị bằng độ, gradian, radian hoặc vòng. Các giá trị sau là tương đương:

```css
hue-rotate(-180deg)
hue-rotate(540deg)
hue-rotate(200grad)
hue-rotate(3.14159rad)
hue-rotate(0.5turn)
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Với thuộc tính backdrop-filter

Ví dụ này áp dụng bộ lọc `hue-rotate()` thông qua thuộc tính CSS `backdrop-filter` cho đoạn văn, thay đổi màu sắc khu vực phía sau `<p>`.

```css
.container {
  background: url("/shared-assets/images/examples/listen_to_black_women.jpg")
    no-repeat left / contain #011296;
}
p {
  backdrop-filter: hue-rotate(240deg);
  text-shadow: 2px 2px #011296;
}
```

```css hidden
.container {
  padding: 3rem;
  width: 30rem;
}
p {
  padding: 0.5rem;
  color: white;
  font-size: 2rem;
  font-family: sans-serif;
}
```

```html hidden
<div class="container">
  <p>
    Text on images can be illegible and inaccessible even with a drop shadow.
  </p>
</div>
```

{{EmbedLiveSample('With_the_backdrop-filter_property','100%','280')}}

### Với thuộc tính filter

Ví dụ này áp dụng bộ lọc `hue-rotate()` thông qua thuộc tính CSS `filter`, thêm dịch chuyển màu sắc cho toàn bộ phần tử, bao gồm nội dung, đường viền và ảnh nền.

```css
p {
  filter: hue-rotate(-60deg);
  text-shadow: 2px 2px blue;
  background-color: magenta;
  color: goldenrod;
  border: 1em solid rebeccapurple;
  box-shadow:
    inset -5px -5px red,
    5px 5px yellow;
}
```

```css hidden
p {
  padding: 0.5rem;
  font-size: 2rem;
  font-family: sans-serif;
  width: 85vw;
}
```

```html hidden
<p>The person who wrote this example is not a designer, fortunately.</p>
```

{{EmbedLiveSample('With_the_filter_property','100%','220')}}

### Với url() và bộ lọc SVG hue-rotate

Phần tử SVG {{SVGElement("filter")}} được dùng để định nghĩa các hiệu ứng bộ lọc tùy chỉnh, sau đó có thể được tham chiếu bằng [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id). Phần tử con {{SVGElement("feColorMatrix")}} kiểu `hueRotate` của `<filter>` cung cấp hiệu ứng tương tự. Với nội dung sau:

```html live-sample___svg_filter
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 220 220"
  color-interpolation-filters="sRGB"
  height="220"
  width="220">
  <filter id="hue-rotate">
    <feColorMatrix type="hueRotate" values="90" />
  </filter>
</svg>
```

Các giá trị này tạo ra kết quả giống nhau:

```css
filter: hue-rotate(90deg); /* Xoay 90 độ */
filter: url("#hue-rotate"); /* với SVG nhúng */
filter: url("folder/fileName.svg#hue-rotate"); /* định nghĩa bộ lọc SVG ngoài */
```

Ví dụ này hiển thị ba ảnh: ảnh được áp dụng hàm bộ lọc `hue-rotate()`, ảnh được áp dụng bộ lọc `url()` tương đương, và ảnh gốc để so sánh:

```html hidden live-sample___svg_filter
<table>
  <thead>
    <tr>
      <th><code>hue-rotate()</code></th>
      <th><code>url()</code></th>
      <th>Original image</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img
          class="css-filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag with rotated colors" />
      </td>
      <td>
        <img
          class="svg-filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag with rotated colors" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
    </tr>
  </tbody>
</table>
```

```css hidden live-sample___svg_filter
.css-filter {
  filter: hue-rotate(90deg);
}
.svg-filter {
  filter: url("#hue-rotate");
}

th,
td {
  padding: 5px;
}
svg:not(:root) {
  display: none;
}
```

{{EmbedLiveSample('svg_filter','100%','280')}}

### hue-rotate() không giữ nguyên độ bão hòa hay độ sáng

Sơ đồ dưới đây so sánh hai dải màu gradient bắt đầu từ màu đỏ: dải đầu được tạo bằng `hue-rotate()`, và dải thứ hai sử dụng các giá trị màu HSL thực tế. Lưu ý cách gradient `hue-rotate()` cho thấy sự khác biệt rõ ràng về độ bão hòa và độ sáng ở phần giữa.

```html
<div>
  <p>Using <code>hue-rotate()</code></p>
  <div id="hue-rotate"></div>
</div>
<div>
  <p>Using <code>hsl()</code></p>
  <div id="hsl"></div>
</div>
```

```css hidden
#hue-rotate,
#hsl {
  display: flex;
  margin: 1em 0;
}

#hue-rotate div,
#hsl div {
  width: 2px;
  height: 100px;
}
```

```js
const hueRotate = document.getElementById("hue-rotate");
const hsl = document.getElementById("hsl");

for (let i = 0; i < 360; i++) {
  const div1 = document.createElement("div");
  div1.style.backgroundColor = `hsl(${i}, 100%, 50%)`;
  hsl.appendChild(div1);

  const div2 = document.createElement("div");
  div2.style.backgroundColor = "red";
  div2.style.filter = `hue-rotate(${i}deg)`;
  hueRotate.appendChild(div2);
}
```

{{EmbedLiveSample('hue-rotate_does_not_preserve_saturation_or_lightness','100%','350')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [hiệu ứng bộ lọc CSS](/vi/docs/Web/CSS/Guides/Filter_effects)
- Các hàm {{cssxref("filter-function")}} khác có thể dùng trong giá trị của các thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}}:
  - {{cssxref("filter-function/blur", "blur()")}}
  - {{cssxref("filter-function/brightness", "brightness()")}}
  - {{cssxref("filter-function/contrast", "contrast()")}}
  - {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - {{cssxref("filter-function/grayscale", "grayscale()")}}
  - {{cssxref("filter-function/invert", "invert()")}}
  - {{cssxref("filter-function/opacity", "opacity()")}}
  - {{cssxref("filter-function/saturate", "saturate()")}}
  - {{cssxref("filter-function/sepia", "sepia()")}}
