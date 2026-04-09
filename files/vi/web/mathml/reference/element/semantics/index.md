---
title: <semantics>
slug: Web/MathML/Reference/Element/semantics
page-type: mathml-element
browser-compat: mathml.elements.semantics
sidebar: mathmlref
---

**`<semantics>`** [MathML](/en-US/docs/Web/MathML) element liên kết các chú giải với một biểu thức MathML, ví dụ như nguồn văn bản của nó dưới dạng một [ngôn ngữ đánh dấu nhẹ](https://en.wikipedia.org/wiki/Lightweight_markup_language) hoặc ý nghĩa toán học được biểu đạt trong một phương ngữ {{glossary("XML")}} đặc biệt. Thông thường, cấu trúc của nó là:

- một phần tử con đầu tiên là một biểu thức MathML cần được chú giải.
- các phần tử {{mathmlelement("annotation")}} hoặc {{mathmlelement("annotation-xml")}} phía sau, trong đó phần tử sau được dành riêng cho các định dạng XML như [Content MathML](https://en.wikipedia.org/wiki/MathML#Content_MathML) hoặc {{glossary("SVG")}}.

Theo mặc định, chỉ phần tử con đầu tiên của phần tử `<semantics>` được hiển thị, còn các phần tử khác sẽ có thuộc tính [display](/en-US/docs/Web/CSS/Reference/Properties/display) đặt thành `none`.

```css
semantics > :not(:first-child) {
  display: none;
}
```

> [!NOTE]
> Các đặc tả MathML cũ cho phép bộ hiển thị quyết định cách hiển thị mặc định dựa trên các chú giải sẵn có. Các quy tắc sau đây để xác định phần tử con hiển thị đã được triển khai trong một số trình duyệt. Xem [MathML 4](https://w3c.github.io/mathml/) để phân biệt giữa Presentation MathML và Content MathML.
>
> - Nếu không có quy tắc nào khác áp dụng: Theo mặc định chỉ phần tử con đầu tiên được hiển thị, và phần tử này được giả định là Presentation MathML.
> - Nếu phần tử con đầu tiên là một phần tử Presentation MathML khác với `<annotation>` hoặc `<annotation-xml>`, hãy hiển thị phần tử con đầu tiên.
> - Nếu không tìm thấy Presentation MathML, hãy hiển thị phần tử con `<annotation>` hoặc `<annotation-xml>` đầu tiên của `<semantics>` không có thuộc tính `src`. Với phần tử `<annotation-xml>`, thuộc tính `encoding` phải bằng một trong các giá trị sau:
>   - `"application/mathml-presentation+xml"`
>   - `"MathML-Presentation"`
>   - `"SVG1.1"`
>   - `"text/html"`
>   - `"image/svg+xml"`
>   - `"application/xml"`
>
> Lưu ý rằng `"application/mathml+xml"` _không_ được nhắc đến ở đây vì nó không phân biệt giữa Content MathML và Presentation MathML.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 1.5rem;
}
```

```html
<math display="block">
  <semantics>
    <!-- Phần tử con đầu tiên là biểu thức MathML được hiển thị theo mặc định. -->
    <mrow>
      <msup>
        <mi>x</mi>
        <mn>2</mn>
      </msup>
      <mo>+</mo>
      <mi>y</mi>
    </mrow>

    <!--
      Chú giải bằng Content MathML, một phương ngữ XML chuyên dụng
      để biểu đạt ý nghĩa của các công thức toán học.
    -->
    <annotation-xml encoding="application/mathml-content+xml">
      <apply>
        <plus />
        <apply>
          <power />
          <ci>x</ci>
          <cn type="integer">2</cn>
        </apply>
        <ci>y</ci>
      </apply>
    </annotation-xml>

    <!--
      Chú giải bằng LaTeX, một ngôn ngữ đánh dấu nhẹ
      để viết các công thức toán học.
    -->
    <annotation encoding="application/x-tex">x^{2} + y</annotation>
  </semantics>
</math>
```

{{ EmbedLiveSample('example', 700, 200, "", "") }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
