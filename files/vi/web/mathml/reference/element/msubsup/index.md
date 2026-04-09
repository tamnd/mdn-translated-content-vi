---
title: <msubsup>
slug: Web/MathML/Reference/Element/msubsup
page-type: mathml-element
browser-compat: mathml.elements.msubsup
sidebar: mathmlref
---

**`<msubsup>`** [MathML](/en-US/docs/Web/MathML) element được dùng để gắn đồng thời cả chỉ số dưới và chỉ số trên vào một biểu thức.

Nó dùng cú pháp sau: `<msubsup> base subscript superscript </msubsup>`.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính lỗi thời sau:

- `subscriptshift` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết mức tối thiểu để hạ baseline của chỉ số dưới xuống.
- `superscriptshift` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Một giá trị {{cssxref("length-percentage")}} cho biết mức tối thiểu để nâng baseline của chỉ số trên lên.

> [!NOTE]
> Với các thuộc tính `subscriptshift` và `superscriptshift`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

```html
<math display="block">
  <msubsup>
    <mo>&#x222B;<!--Tích phân --></mo>
    <mn>0</mn>
    <mn>1</mn>
  </msubsup>
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
- {{ MathMLElement("msup") }} (Chỉ số trên)
- {{ MathMLElement("mmultiscripts") }} (Tiền chỉ số và chỉ số tensor)
