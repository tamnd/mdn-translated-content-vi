---
title: <mphantom>
slug: Web/MathML/Reference/Element/mphantom
page-type: mathml-element
browser-compat: mathml.elements.mphantom
sidebar: mathmlref
---

**`<mphantom>`** [MathML](/en-US/docs/Web/MathML) element được hiển thị vô hình, nhưng các kích thước của nó (như chiều cao, chiều rộng và vị trí đường cơ sở) vẫn được giữ lại.

## Thuộc tính

Phần tử này chấp nhận các [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

```html
<math display="block">
  <mrow>
    <mi>x</mi>
    <mo>+</mo>
    <mphantom>
      <mi>y</mi>
      <mo>+</mo>
    </mphantom>
    <mi>z</mi>
  </mrow>
</math>
```

{{EmbedLiveSample('Examples')}}

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

- {{ MathMLElement("mspace") }}
- {{ MathMLElement("mpadded") }}
