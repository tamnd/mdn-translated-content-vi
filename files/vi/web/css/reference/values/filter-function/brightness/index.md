---
title: brightness()
slug: Web/CSS/Reference/Values/filter-function/brightness
page-type: css-function
browser-compat: css.types.filter-function.brightness
sidebar: cssref
---

Hàm **`brightness()`** [CSS](/vi/docs/Web/CSS) {{cssxref("filter-function")}} áp dụng hệ số nhân tuyến tính lên một phần tử hoặc hình ảnh đầu vào, làm cho hình ảnh trông sáng hơn hoặc tối hơn.

{{InteractiveExample("CSS Demo: brightness()")}}

```css interactive-example-choice
filter: brightness(1);
```

```css interactive-example-choice
filter: brightness(1.75);
```

```css interactive-example-choice
filter: brightness(50%);
```

```css interactive-example-choice
filter: brightness(0);
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
brightness(amount)
```

### Giá trị

- `amount` {{Optional_Inline}}
  - : Độ sáng được chỉ định dưới dạng {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị nhỏ hơn `100%` làm tối hình ảnh hoặc phần tử đầu vào, trong khi giá trị trên `100%` làm sáng nó lên. Giá trị `0%` tạo ra hình ảnh hoặc phần tử hoàn toàn đen, trong khi giá trị `100%` giữ nguyên đầu vào. Các giá trị khác từ `0%` đến `100%` có hiệu ứng nhân tuyến tính. Giá trị lớn hơn `100%` được phép, tạo ra kết quả sáng hơn. Giá trị ban đầu cho {{Glossary("interpolation")}} là `1`. Giá trị âm không được phép. Giá trị mặc định là `1`.

Sau đây là các cặp giá trị tương đương:

```css
brightness(0)   /* Độ sáng giảm về không, đầu vào chuyển thành màu đen */
brightness(0%)

brightness(0.4) /* Độ sáng của đầu vào giảm xuống 40%, đầu vào tối hơn 60% */
brightness(40%)

brightness()     /* Độ sáng của đầu vào không thay đổi */
brightness(1)
brightness(100%)

brightness(2)   /* Độ sáng của đầu vào được nhân đôi */
brightness(200%)
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Áp dụng độ sáng bằng thuộc tính backdrop-filter

Ví dụ này cho thấy cách áp dụng bộ lọc `brightness()` lên một đoạn văn thông qua thuộc tính CSS {{cssxref("backdrop-filter")}}.

#### CSS

```css
.container {
  background: url("be_fierce.jpg") no-repeat right / contain #d4d5b2;
}
p {
  backdrop-filter: brightness(150%);
  text-shadow: 2px 2px white;
}
```

```css hidden
.container {
  padding: 5rem 3rem 1rem;
  width: 30rem;
}
p {
  padding: 0.5rem;
  color: black;
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

#### Kết quả

{{EmbedLiveSample('Applying_brightness_using_the_backdrop_filter_property', '100%', '280')}}

Trong ví dụ này, các màu trong vùng phía sau phần tử `<p>` thay đổi tuyến tính. Nếu thuộc tính `backdrop-filter` được đặt thành `brightness(0%)`, vùng `<div>` với phần tử `<p>` sẽ màu đen và ẩn hình ảnh phía sau. Ở `brightness(100%)`, màu vùng `<div>` sẽ giống với đầu vào `#d4d5b2`, và hình ảnh phía sau sẽ hoàn toàn trong suốt. Với độ sáng đặt thành `150%` như trong ví dụ này, các màu trong hình ảnh phía sau bị ẩn đi bởi độ sáng của phần tử `<div>`.

### Áp dụng độ sáng bằng thuộc tính filter

Trong ví dụ này, bộ lọc `brightness()` được áp dụng lên toàn bộ phần tử, bao gồm nội dung, viền và hình ảnh nền thông qua thuộc tính CSS {{cssxref("filter")}}. Kết quả cho thấy ba biến thể với các giá trị độ sáng khác nhau.

```css
p:first-of-type {
  filter: brightness(50%);
}
p:last-of-type {
  filter: brightness(200%);
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
<p>This paragraph has reduced brightness.</p>
<p>This paragraph has normal brightness.</p>
<p>This paragraph has increased brightness.</p>
```

{{EmbedLiveSample('Applying_brightness_using_the_filter_property','100%','280')}}

### Áp dụng độ sáng bằng bộ lọc SVG brightness() qua url()

Phần tử SVG {{SVGElement("filter")}} được dùng để định nghĩa các hiệu ứng bộ lọc tùy chỉnh sau đó có thể được tham chiếu bằng [`id`](/vi/docs/Web/HTML/Reference/Global_attributes/id). Phần tử gốc {{SVGElement("feComponentTransfer")}} của `<filter>` cho phép ánh xạ lại màu ở cấp độ pixel.

Trong ví dụ này, để tạo bộ lọc làm tối nội dung áp dụng lên 25% (tức là 75% độ sáng gốc), thuộc tính `slope` được đặt thành `0.75`. Sau đó chúng ta có thể tham chiếu bộ lọc bằng `id`.

Cho đoạn sau:

```html live-sample___svg_filter
<svg role="none">
  <filter id="darken25" color-interpolation-filters="sRGB">
    <feComponentTransfer>
      <feFuncR type="linear" slope="0.75" />
      <feFuncG type="linear" slope="0.75" />
      <feFuncB type="linear" slope="0.75" />
    </feComponentTransfer>
  </filter>
</svg>
```

Các khai báo sau tạo ra hiệu ứng tương tự:

```css
filter: brightness(75%);
filter: url("#darken25"); /* với SVG nhúng */
filter: url("folder/fileName.svg#darken25"); /* định nghĩa bộ lọc svg bên ngoài */
```

Trong các hình ảnh dưới đây, hình ảnh đầu tiên có hàm bộ lọc `brightness()` được áp dụng, hình ảnh thứ hai có hàm brightness SVG tương tự được áp dụng, và hình ảnh thứ ba là hình ảnh gốc để so sánh.

```html hidden live-sample___svg_filter
<table>
  <thead>
    <tr>
      <th>Live example</th>
      <th>SVG Equivalent</th>
      <th>Original image</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img
          class="css-filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="darkened pride flag" />
      </td>
      <td>
        <img
          class="svg-filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="darkened pride flag" />
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
  filter: brightness(0.75);
}
.svg-filter {
  filter: url("#darken25");
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

- [CSS filter effects](/vi/docs/Web/CSS/Guides/Filter_effects) module
- Các hàm {{cssxref("filter-function")}} khác có thể được dùng trong các giá trị của thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}} bao gồm:
  - {{cssxref("filter-function/blur", "blur()")}}
  - {{cssxref("filter-function/contrast", "contrast()")}}
  - {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - {{cssxref("filter-function/grayscale", "grayscale()")}}
  - {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - {{cssxref("filter-function/invert", "invert()")}}
  - {{cssxref("filter-function/opacity", "opacity()")}}
  - {{cssxref("filter-function/saturate", "saturate()")}}
  - {{cssxref("filter-function/sepia", "sepia()")}}
