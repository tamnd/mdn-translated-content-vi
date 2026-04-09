---
title: <mtext>
slug: Web/MathML/Reference/Element/mtext
page-type: mathml-element
browser-compat: mathml.elements.mtext
sidebar: mathmlref
---

**`<mtext>`** [MathML](/en-US/docs/Web/MathML) element được dùng để hiển thị văn bản tùy ý mà _không_ mang ý nghĩa ký hiệu học, chẳng hạn như chú thích hoặc ghi chú.

Để hiển thị văn bản _có_ ý nghĩa ký hiệu học, hãy dùng {{ MathMLElement("mi") }}, {{ MathMLElement("mn") }}, {{ MathMLElement("mo") }} hoặc {{ MathMLElement("ms") }}.

## Thuộc tính

Phần tử này chấp nhận [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

```html
<math display="block">
  <mtext>Định lý Pythagoras</mtext>
</math>

<math display="block">
  <mtext>/* chú thích ở đây */</mtext>
</math>
```

{{ EmbedLiveSample('mtext_example', 700, 200, "", "") }}

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
