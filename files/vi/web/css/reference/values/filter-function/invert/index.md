---
title: invert()
slug: Web/CSS/Reference/Values/filter-function/invert
page-type: css-function
browser-compat: css.types.filter-function.invert
sidebar: cssref
---

Hàm **`invert()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) đảo ngược các mẫu màu trong hình ảnh đầu vào. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: invert()")}}

```css interactive-example-choice
filter: invert(0);
```

```css interactive-example-choice
filter: invert(0.3);
```

```css interactive-example-choice
filter: invert(50%);
```

```css interactive-example-choice
filter: invert(70%);
```

```css interactive-example-choice
filter: invert(1);
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
/* Không đảo ngược */
invert(0)

/* Đảo ngược hoàn toàn */
invert()
invert(1)
invert(100%)

/* Đảo ngược 60% */
invert(.6)
invert(60%)
```

### Tham số

- {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} {{Optional_Inline}}
  - : Chỉ định mức độ chuyển đổi. Giá trị `100%` là đảo ngược hoàn toàn, trong khi giá trị `0%` giữ nguyên đầu vào. Các giá trị từ `0%` đến `100%` là hệ số nhân tuyến tính trên hiệu ứng. Giá trị ban đầu cho {{Glossary("interpolation")}} là `0`. Giá trị mặc định là `1`.

## Cú pháp chính thức

{{CSSSyntax}}

## Bộ lọc SVG

Phần tử bộ lọc SVG {{SVGElement("feComponentTransfer")}} cũng có thể được dùng để đảo ngược nội dung bằng cách tạo ra sự đảo ngược tương đương trên các phần tử bảng {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}} và {{SVGElement("feFuncB")}} lồng nhau. Chúng ta đặt cùng `tableValue` cho các phần tử gốc bộ lọc đỏ, xanh lá và xanh dương với cùng giá trị, sau đó chúng ta có thể tham chiếu hiệu ứng SVG bằng ID của {{SVGElement("filter")}}:

```html
<svg role="none">
  <filter id="invert90">
    <feComponentTransfer>
      <feFuncR type="table" tableValues="0.1 0" />
      <feFuncG type="table" tableValues="0.1 0" />
      <feFuncB type="table" tableValues="0.1 0" />
    </feComponentTransfer>
  </filter>
</svg>
```

Các khai báo sau tạo ra hiệu ứng tương đương:

```css
filter: invert(0.9);
filter: invert(90%);
filter: url("#invert90"); /* với SVG nhúng */
filter: url("fileName.svg#invert90"); /* SVG bên ngoài */
```

## Ví dụ

Ví dụ này hiển thị ba hình ảnh để so sánh: hình ảnh với hàm bộ lọc `invert()` được áp dụng, hình ảnh với hàm SVG tương đương được áp dụng, và hình ảnh gốc:

### SVG

Chúng ta tạo bộ lọc SVG đảo ngược nội dung áp dụng lên 70%:

```html
<svg height="0">
  <filter id="invert">
    <feComponentTransfer>
      <feFuncR type="table" tableValues="0.3 0" />
      <feFuncG type="table" tableValues="0.3 0" />
      <feFuncB type="table" tableValues="0.3 0" />
    </feComponentTransfer>
  </filter>
</svg>
```

### CSS

Chúng ta thêm CSS sẽ đảo ngược các phần tử dựa trên class `filter` hoặc `svgFilter` của chúng:

```css
.filter {
  filter: invert(70%);
}

.svgFilter {
  filter: url("#invert");
}
```

```css hidden
th,
td {
  padding: 5px;
}
```

```html hidden
<table>
  <thead>
    <tr>
      <th><code>invert()</code> filter</th>
      <th>SVG filter equivalent</th>
      <th>Original image</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img
          class="svgFilter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <svg id="svg" height="220" width="220" overflow="visible">
          <filter id="svgInvert">
            <feComponentTransfer>
              <feFuncR type="table" tableValues="0.3 0" />
              <feFuncG type="table" tableValues="0.3 0" />
              <feFuncB type="table" tableValues="0.3 0" />
            </feComponentTransfer>
          </filter>
          <image
            href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
            xlink:href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
            filter="url('#svgInvert')" />
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

{{EmbedLiveSample('examples','100%','280')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

Các hàm {{cssxref("filter-function")}} khác có thể được dùng trong các giá trị của thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}} bao gồm:

- {{cssxref("filter-function/blur", "blur()")}}
- {{cssxref("filter-function/brightness", "brightness()")}}
- {{cssxref("filter-function/contrast", "contrast()")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- {{cssxref("filter-function/grayscale", "grayscale()")}}
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
- {{cssxref("filter-function/opacity", "opacity()")}}
- {{cssxref("filter-function/saturate", "saturate()")}}
- {{cssxref("filter-function/sepia", "sepia()")}}
