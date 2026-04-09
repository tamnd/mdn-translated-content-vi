---
title: <mover>
slug: Web/MathML/Reference/Element/mover
page-type: mathml-element
browser-compat: mathml.elements.mover
sidebar: mathmlref
---

**`<mover>`** [MathML](/en-US/docs/Web/MathML) element được dùng để gắn một dấu nhấn hoặc một giới hạn phía trên một biểu thức. Dùng cú pháp sau: `<mover> base overscript </mover>`

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cũng như thuộc tính sau:

- `accent`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết script phía trên có nên được xem là một dấu nhấn hay không (tức là được vẽ lớn hơn và gần với biểu thức gốc hơn).

## Ví dụ

```html
<math display="block">
  <mover accent="true">
    <mrow>
      <mi>x</mi>
      <mo>+</mo>
      <mi>y</mi>
      <mo>+</mo>
      <mi>z</mi>
    </mrow>
    <mo>&#x23DE;<!--DẤU NGOẶC NHỌN TRÊN--></mo>
  </mover>
</math>
```

{{ EmbedLiveSample('mover_example', 700, 200, "", "") }}

## Tóm tắt kỹ thuật

<table class="properties">
  <tr>
    <th scope="row">
      <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles">Vai trò ARIA ngầm định</a>
    </th>
    <td>
      Không có
    </td>
  </tr>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ MathMLElement("munder") }} (Chỉ số dưới)
- {{ MathMLElement("munderover") }} (Cặp chỉ số dưới-trên)
