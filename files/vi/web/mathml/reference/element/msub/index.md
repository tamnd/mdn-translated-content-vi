---
title: <msub>
slug: Web/MathML/Reference/Element/msub
page-type: mathml-element
browser-compat: mathml.elements.msub
sidebar: mathmlref
---

**`<msub>`** [MathML](/en-US/docs/Web/MathML) element được dùng để gắn chỉ số dưới vào một biểu thức.

Nó dùng cú pháp sau: `<msub> base subscript </msub>`.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với thuộc tính lỗi thời sau:

- `subscriptshift` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết mức tối thiểu để hạ baseline của chỉ số dưới xuống.

> [!NOTE]
> Với thuộc tính `subscriptshift`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

```html
<math display="block">
  <msub>
    <mi>X</mi>
    <mn>1</mn>
  </msub>
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
      Không
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ MathMLElement("msup") }} (Chỉ số trên)
- {{ MathMLElement("msubsup") }} (Cặp chỉ số dưới-trên)
- {{ MathMLElement("mmultiscripts") }} (Tiền chỉ số và chỉ số tensor)
