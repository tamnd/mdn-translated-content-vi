---
title: <mprescripts>
slug: Web/MathML/Reference/Element/mprescripts
page-type: mathml-element
browser-compat: mathml.elements.mprescripts
sidebar: mathmlref
---

**`<mprescripts>`** [MathML](/en-US/docs/Web/MathML) element được dùng bên trong một phần tử {{ MathMLElement("mmultiscripts") }} để chỉ ra điểm bắt đầu của các phần tử pre-scripts (các chỉ số dưới và chỉ số trên được đặt **trước** biểu thức gốc).

## Thuộc tính

Phần tử này hỗ trợ [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

Phần tử con đầu tiên của `<mmultiscripts>` trở thành một biểu thức gốc. Các phần tử con còn lại mặc định trở thành post-scripts (a, b). `<mprescripts>` đóng vai trò như một dấu phân tách, và các phần tử con sau nó trở thành pre-scripts (c, d).

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
  font-size: 2rem;
}
```

```html-nolint
<math display="block">
  <mmultiscripts>
    <mi>X</mi> <!-- biểu thức gốc -->
    <mi>a</mi> <!-- chỉ số dưới phía sau -->
    <mi>b</mi> <!-- chỉ số trên phía sau -->
    <mprescripts />
    <mi>c</mi> <!-- chỉ số dưới phía trước -->
    <mi>d</mi> <!-- chỉ số trên phía trước -->
  </mmultiscripts>
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
      Không có
    </td>
  </tr>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ MathMLElement("msub") }} (Chỉ số dưới)
- {{ MathMLElement("msup") }} (Chỉ số trên)
- {{ MathMLElement("msubsup") }} (Cặp chỉ số dưới-trên)
