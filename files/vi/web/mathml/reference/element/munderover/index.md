---
title: <munderover>
slug: Web/MathML/Reference/Element/munderover
page-type: mathml-element
browser-compat: mathml.elements.munderover
sidebar: mathmlref
---

**`<munderover>`** [MathML](/en-US/docs/Web/MathML) element được dùng để gắn cả dấu nhấn hoặc giới hạn bên dưới lẫn bên trên một biểu thức.

Nó dùng cú pháp sau: `<munderover> base underscript overscript </munderover>`

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính sau:

- `accent`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết phần chỉ số trên có nên được xử lý như một dấu nhấn hay không (tức là được vẽ lớn hơn và gần hơn với biểu thức cơ sở).
- `accentunder`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết phần chỉ số dưới có nên được xử lý như một dấu nhấn hay không (tức là được vẽ lớn hơn và gần hơn với biểu thức cơ sở).

## Ví dụ

```html
<math display="block">
  <munderover>
    <mo>∑</mo>
    <mrow>
      <mi>n</mi>
      <mo>=</mo>
      <mn>1</mn>
    </mrow>
    <mrow>
      <mo>+</mo>
      <mn>∞</mn>
    </mrow>
  </munderover>
</math>
```

{{ EmbedLiveSample('munderover_example', 700, 200, "", "") }}

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

## Xem thêm

- {{ MathMLElement("munder") }} (Chỉ số dưới)
- {{ MathMLElement("mover") }} (Chỉ số trên)
