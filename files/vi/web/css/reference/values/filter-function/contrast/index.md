---
title: contrast()
slug: Web/CSS/Reference/Values/filter-function/contrast
page-type: css-function
browser-compat: css.types.filter-function.contrast
sidebar: cssref
---

Hàm **`contrast()`** [CSS](/vi/docs/Web/CSS) điều chỉnh độ tương phản của ảnh đầu vào. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: contrast()")}}

```css interactive-example-choice
filter: contrast(1);
```

```css interactive-example-choice
filter: contrast(1.75);
```

```css interactive-example-choice
filter: contrast(50%);
```

```css interactive-example-choice
filter: contrast(0);
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
contrast(amount)
```

### Giá trị

- `amount` {{Optional_Inline}}
  - : Độ tương phản của kết quả, được chỉ định là {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị dưới `100%` làm giảm độ tương phản, trong khi giá trị trên `100%` làm tăng độ tương phản. Giá trị `0` hoặc `0%` tạo ra ảnh hoàn toàn xám, trong khi giá trị `1` hoặc `100%` giữ nguyên ảnh đầu vào. Giá trị âm không được phép. Giá trị khởi tạo cho {{Glossary("interpolation")}} là `1`. Giá trị mặc định là `1`.

Sau đây là các cặp giá trị tương đương:

```css
contrast(0)    /* Hoàn toàn xám */
contrast(0%)

contrast(0.65) /* Độ tương phản 65% */
contrast(65%)

contrast()     /* Không có hiệu ứng */
contrast(1)
contrast(100%)

contrast(2)    /* Gấp đôi độ tương phản */
contrast(200%)
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Với thuộc tính backdrop-filter

Ví dụ này áp dụng bộ lọc `contrast()` thông qua thuộc tính CSS {{cssxref("backdrop-filter")}} cho đoạn văn và văn bản monospace, thay đổi màu sắc khu vực phía sau `<p>` và `<code>`.

```css
.container {
  background: url("unity_for_the_people.jpg") no-repeat center / contain #333399;
}
p {
  backdrop-filter: contrast(0.5);
}
code {
  backdrop-filter: contrast(0.15);
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
  font-family: sans-serif;
}
```

```html hidden
<div class="container">
  <p>
    Always ensure there is enough contrast between text and all background
    colors. If you think your text may land on top of a background image,
    include a <code>backdrop-filter</code>. Reducing the contrast of background
    colors with the <code>contrast()</code> filter may improve legibility but
    does not guarantee accessibility.
  </p>
</div>
```

{{EmbedLiveSample('With_the_backdrop-filter_property','100%','260')}}

### Với thuộc tính filter

Ví dụ này áp dụng bộ lọc `contrast()` thông qua thuộc tính CSS {{cssxref("filter")}}, thay đổi độ tương phản bằng cách dịch chuyển màu sắc của toàn bộ phần tử, bao gồm nội dung, đường viền, nền và bóng.

```css
p:first-of-type {
  filter: contrast(30%);
}
p:last-of-type {
  filter: contrast(300%);
}
```

```css hidden
p {
  text-shadow: 2px 2px blue;
  background-color: magenta;
  color: palegoldenrod;
  border: 1em solid rebeccapurple;
  box-shadow:
    inset -5px -5px red,
    5px 5px yellow;
  padding: 0.25rem;
  font-size: 1.25rem;
  font-family: sans-serif;
  width: 85vw;
}
```

```html hidden
<p>This paragraph has reduced contrast.</p>
<p>This paragraph has normal contrast.</p>
<p>This paragraph has increased contrast.</p>
```

{{EmbedLiveSample('With_the_filter_property','100%','320')}}

### Với url() và bộ lọc SVG contrast

Phần tử SVG {{SVGElement("filter")}} được dùng để định nghĩa các hiệu ứng bộ lọc tùy chỉnh, sau đó có thể được tham chiếu bằng [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id). Phần tử con {{SVGElement("feComponentTransfer")}} của `<filter>` cho phép tái ánh xạ màu sắc ở cấp độ điểm ảnh. Với nội dung sau:

```html live-sample___svg_filter
<svg
  xmlns="http://www.w3.org/2000/svg"
  id="svg"
  viewBox="0 0 240 151"
  height="0"
  width="0"
  overflow="visible"
  color-interpolation-filters="sRGB">
  <filter id="contrast">
    <feComponentTransfer>
      <feFuncR type="linear" slope="2" intercept="-0.5" />
      <feFuncG type="linear" slope="2" intercept="-0.5" />
      <feFuncB type="linear" slope="2" intercept="-0.5" />
    </feComponentTransfer>
  </filter>
</svg>
```

Các giá trị này tạo ra kết quả giống nhau:

```css
filter: contrast(200%);
filter: url("#contrast"); /* với SVG nhúng */
filter: url("folder/fileName.svg#contrast"); /* định nghĩa bộ lọc SVG ngoài */
```

Ví dụ này hiển thị ba ảnh: ảnh được áp dụng hàm bộ lọc `contrast()`, ảnh được áp dụng bộ lọc `url()` tương đương, và ảnh gốc để so sánh:

```html hidden live-sample___svg_filter
<table>
  <thead>
    <tr>
      <th><code>contrast()</code></th>
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
          alt="Pride flag" />
      </td>
      <td>
        <img
          class="svg-filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
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
  filter: contrast(200%);
}
.svg-filter {
  filter: url("#contrast");
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

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [hiệu ứng bộ lọc CSS](/vi/docs/Web/CSS/Guides/Filter_effects)
- Các hàm {{cssxref("filter-function")}} khác có thể dùng trong giá trị của các thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}}:
  - {{cssxref("filter-function/blur", "blur()")}}
  - {{cssxref("filter-function/brightness", "brightness()")}}
  - {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - {{cssxref("filter-function/grayscale", "grayscale()")}}
  - {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - {{cssxref("filter-function/invert", "invert()")}}
  - {{cssxref("filter-function/opacity", "opacity()")}}
  - {{cssxref("filter-function/saturate", "saturate()")}}
  - {{cssxref("filter-function/sepia", "sepia()")}}
