---
title: alignment-baseline
slug: Web/SVG/Reference/Attribute/alignment-baseline
page-type: svg-attribute
browser-compat: svg.global_attributes.alignment-baseline
sidebar: svgref
---

Thuộc tính **`alignment-baseline`** chỉ định cách một đối tượng được căn chỉnh so với phần tử cha của nó. Thuộc tính này chỉ rõ baseline nào của phần tử này sẽ được căn theo baseline tương ứng của phần tử cha. Ví dụ, điều này cho phép các {{glossary("/Baseline/Typography", "baseline chữ cái")}} trong văn bản Roman vẫn thẳng hàng khi kích thước phông chữ thay đổi. Nó mặc định là baseline có cùng tên với giá trị tính toán của thuộc tính `alignment-baseline`.

> [!NOTE]
> Với vai trò là một presentation attribute, `alignment-baseline` cũng có thuộc tính CSS tương ứng: {{cssxref("alignment-baseline")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("tspan")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>auto</code> | <code>baseline</code> | <code>before-edge</code> |
        <code>text-before-edge</code> | <code>middle</code> |
        <code>central</code> | <code>after-edge</code> |
        <code>text-after-edge</code> | <code>ideographic</code> |
        <code>alphabetic</code> | <code>hanging</code> |
        <code>mathematical</code> | <code>top</code> | <code>center</code> |
        <code>bottom</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `auto` {{deprecated_inline}}
  - : Giá trị là dominant-baseline của script mà ký tự thuộc về - tức là, dùng dominant-baseline của phần tử cha.
- `baseline`
  - : Dùng lựa chọn {{svgattr("dominant-baseline")}} của phần tử cha. Khớp {{Glossary("baseline/typography", "baseline")}} tương ứng của hộp với baseline của phần tử cha.
- `before-edge` {{deprecated_inline}}
  - : Điểm căn chỉnh của đối tượng đang được căn được căn với baseline "before-edge" của phần tử nội dung văn bản cha.
- `text-bottom`
  - : Khớp đáy của hộp với đỉnh của vùng nội dung của phần tử cha.
- `text-before-edge`
  - : Điểm căn chỉnh của đối tượng đang được căn được căn với baseline "text-before-edge" của phần tử nội dung văn bản cha.

    > [!NOTE]
    > Từ khóa này có thể được ánh xạ tới `text-top`.

- `middle`
  - : Căn điểm giữa theo chiều dọc của hộp với baseline của hộp cha cộng với một nửa chiều cao x của phần tử cha.
- `central`
  - : Khớp baseline trung tâm của hộp với baseline trung tâm của phần tử cha.
- `after-edge` {{deprecated_inline}}
  - : Điểm căn chỉnh của đối tượng đang được căn được căn với baseline "after-edge" của phần tử nội dung văn bản cha.
- `text-top`
  - : Khớp đỉnh của hộp với đỉnh của vùng nội dung của phần tử cha.
- `text-after-edge`
  - : Điểm căn chỉnh của đối tượng đang được căn được căn với baseline "text-after-edge" của phần tử nội dung văn bản cha.

    > [!NOTE]
    > Từ khóa này có thể được ánh xạ tới `text-bottom`.

- `ideographic`
  - : Khớp baseline phía dưới của mặt chữ tượng hình của hộp với baseline của phần tử cha.
- `alphabetic`
  - : Khớp baseline chữ cái của hộp với baseline của phần tử cha.
- `hanging`
  - : Điểm căn chỉnh của đối tượng đang được căn được căn với baseline "hanging" của phần tử nội dung văn bản cha.
- `mathematical`
  - : Khớp baseline toán học của hộp với baseline của phần tử cha.
- `top`
  - : Căn đỉnh của cây con được căn với đỉnh của hộp dòng.
- `center`
  - : Căn tâm của cây con được căn với tâm của hộp dòng.
- `bottom`
  - : Căn đáy của cây con được căn với đáy của hộp dòng.

SVG 2 đưa ra một số thay đổi đối với định nghĩa của thuộc tính này. Cụ thể: các giá trị `auto`, `before-edge`, và `after-edge` đã bị loại bỏ. Vì khả năng tương thích ngược, `text-before-edge` có thể được ánh xạ tới `text-top` và `text-after-edge` tới `text-bottom`. Không nên dùng `text-before-edge` hoặc `text-after-edge` với thuộc tính {{cssxref("vertical-align")}}.

## Ví dụ

```html
<svg
  width="300"
  height="120"
  viewBox="0 0 300 120"
  xmlns="http://www.w3.org/2000/svg">
  <!-- Materialization of anchors -->
  <path
    d="M60,10 L60,110
              M30,10 L300,10
              M30,65 L300,65
              M30,110 L300,110
              "
    stroke="grey" />

  <!-- Anchors in action -->
  <text alignment-baseline="hanging" x="60" y="10">A hanging</text>

  <text alignment-baseline="middle" x="60" y="65">A middle</text>

  <text alignment-baseline="baseline" x="60" y="110">A baseline</text>

  <!-- Materialization of anchors -->
  <circle cx="60" cy="10" r="3" fill="red" />
  <circle cx="60" cy="65" r="3" fill="red" />
  <circle cx="60" cy="110" r="3" fill="red" />

  <style>
    <![CDATA[
      text {
        font: bold 36px Verdana, Helvetica, Arial, sans-serif;
      }
    ]]>
  </style>
</svg>
```

{{EmbedLiveSample("Example")}}

Đối với căn chỉnh đối tượng trong các phần tử khác (chẳng hạn {{SVGElement("text")}}), hãy xem {{SVGAttr("dominant-baseline")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("alignment-baseline")}}
- [Căn chỉnh baseline CSS](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview#baseline_alignment)
