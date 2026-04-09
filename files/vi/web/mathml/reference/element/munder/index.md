---
title: <munder>
slug: Web/MathML/Reference/Element/munder
page-type: mathml-element
browser-compat: mathml.elements.munder
sidebar: mathmlref
---

**`<munder>`** [MathML](/en-US/docs/Web/MathML) element được dùng để gắn một dấu nhấn hoặc một giới hạn bên dưới một biểu thức. Nó dùng cú pháp sau: `<munder> base underscript </munder>`

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với thuộc tính sau:

- `accentunder`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết phần chỉ số dưới có nên được xử lý như một dấu nhấn hay không (tức là được vẽ lớn hơn và gần hơn với biểu thức cơ sở).

## Ví dụ

```html
<math display="block">
  <munder accentunder="true">
    <mrow>
      <mi>x</mi>
      <mo>+</mo>
      <mi>y</mi>
      <mo>+</mo>
      <mi>z</mi>
    </mrow>
    <mo>&#x23DF;<!--DẤU NGOẶC NHỌN DƯỚI CÙNG--></mo>
  </munder>
</math>
```

{{ EmbedLiveSample('munder_example', 700, 200, "", "") }}

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

- {{ MathMLElement("mover") }} (Chỉ số trên)
- {{ MathMLElement("munderover") }} (Cặp chỉ số dưới-trên)
