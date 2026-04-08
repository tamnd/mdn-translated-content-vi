---
title: blur()
slug: Web/CSS/Reference/Values/filter-function/blur
page-type: css-function
browser-compat: css.types.filter-function.blur
sidebar: cssref
---

Hàm **`blur()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) áp dụng [làm mờ Gaussian](https://en.wikipedia.org/wiki/Gaussian_blur) lên hình ảnh đầu vào. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: blur()")}}

```css interactive-example-choice
filter: blur(0);
```

```css interactive-example-choice
filter: blur(4px);
```

```css interactive-example-choice
filter: blur(1.5rem);
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
blur()         /* Không có hiệu ứng */
blur(0)        /* Không có hiệu ứng */

blur(8px)      /* Làm mờ với bán kính 8px */
blur(1.17rem)  /* Làm mờ với bán kính 1.17rem */
```

### Tham số

- {{cssxref("length")}} {{Optional_Inline}}
  - : Chỉ định bán kính làm mờ. Nó định nghĩa giá trị độ lệch chuẩn cho hàm Gaussian, tức là số pixel trên màn hình hòa trộn với nhau. Do đó, giá trị lớn hơn sẽ tạo ra độ mờ nhiều hơn. Giá trị `0` giữ nguyên đầu vào. Giá trị ban đầu cho {{Glossary("interpolation")}} là `0`. Giá trị phần trăm không hợp lệ. Giá trị mặc định là `0`.

## Bộ lọc SVG

Phần tử bộ lọc SVG {{SVGElement("feGaussianBlur")}} cũng có thể được dùng để làm mờ nội dung. Thuộc tính {{SVGAttr("stdDeviation")}} của bộ lọc chấp nhận tối đa hai giá trị cho phép tạo ra các giá trị làm mờ phức tạp hơn. Để tạo ra độ mờ tương đương, chúng ta dùng một giá trị cho `stdDeviation`. Hiệu ứng SVG này sau đó có thể được tham chiếu bằng ID:

```html
<svg role="none">
  <filter id="blur11">
    <feGaussianBlur stdDeviation="1.1" edgeMode="duplicate" />
  </filter>
</svg>
```

Các khai báo sau tạo ra hiệu ứng tương đương:

```css
filter: blur(1.1px);
filter: url("#blur11"); /* với SVG nhúng */
filter: url("folder/fileName.svg#blur11"); /* định nghĩa bộ lọc svg bên ngoài */
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

Ví dụ này hiển thị ba hình ảnh: hình ảnh với hàm bộ lọc `blur()` được áp dụng, hình ảnh với hàm làm mờ SVG tương đương được áp dụng, và các hình ảnh gốc để so sánh:

```css
.filter {
  filter: blur(3.5px);
}
```

```html
<svg role="img" aria-label="Flag">
  <filter id="blur">
    <feGaussianBlur stdDeviation="3.5" edgeMode="duplicate" />
  </filter>
  <image
    href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    xlink:href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    filter="url('#blur')" />
</svg>
```

```css hidden
svg:not([height]) {
  display: none;
}

th,
td {
  padding: 5px;
}
```

```html hidden
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
          class="filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <svg id="svg" height="220" width="220" overflow="visible">
          <filter id="svgBlur">
            <feGaussianBlur stdDeviation="3.5" />
          </filter>
          <image
            href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
            xlink:href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
            filter="url('#svgBlur')" />
        </svg>
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

{{EmbedLiveSample('blur','100%','280')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS filter effects](/vi/docs/Web/CSS/Guides/Filter_effects) module
- Các hàm {{cssxref("filter-function")}} khác có thể được dùng trong các giá trị của thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}} bao gồm:
  - {{cssxref("filter-function/brightness", "brightness()")}}
  - {{cssxref("filter-function/contrast", "contrast()")}}
  - {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - {{cssxref("filter-function/grayscale", "grayscale()")}}
  - {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - {{cssxref("filter-function/invert", "invert()")}}
  - {{cssxref("filter-function/opacity", "opacity()")}}
  - {{cssxref("filter-function/saturate", "saturate()")}}
  - {{cssxref("filter-function/sepia", "sepia()")}}
