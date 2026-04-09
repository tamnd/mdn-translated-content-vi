---
title: <msup>
slug: Web/MathML/Reference/Element/msup
page-type: mathml-element
browser-compat: mathml.elements.msup
sidebar: mathmlref
---

**`<msup>`** [MathML](/en-US/docs/Web/MathML) element được dùng để gắn chỉ số trên vào một biểu thức.

Nó dùng cú pháp sau: `<msup> base superscript </msup>`.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với thuộc tính lỗi thời sau:

- `superscriptshift` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết mức tối thiểu để nâng baseline của chỉ số trên lên.

> [!NOTE]
> Với thuộc tính `superscriptshift`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

```html
<math display="block">
  <msup>
    <mi>X</mi>
    <mn>2</mn>
  </msup>
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

- {{ MathMLElement("msub") }} (Chỉ số dưới)
- {{ MathMLElement("msubsup") }} (Cặp chỉ số dưới-trên)
- {{ MathMLElement("mmultiscripts") }} (Tiền chỉ số và chỉ số tensor)
