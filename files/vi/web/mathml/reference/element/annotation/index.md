---
title: <annotation>
slug: Web/MathML/Reference/Element/annotation
page-type: mathml-element
browser-compat: mathml.elements.annotation
sidebar: mathmlref
---

Phần tử **`<annotation>`** [MathML](/en-US/docs/Web/MathML) chứa một chú thích cho biểu thức MathML ở định dạng văn bản, ví dụ như [LaTeX](https://www.latex-project.org/).

> [!NOTE]
> Các chú thích không được trình duyệt hiển thị và mặc định bị ẩn. Tuy nhiên, Firefox và Safari sẽ hiển thị một số định dạng chú thích nếu phần tử con đầu tiên của phần tử {{mathmlelement("semantics")}} chứa lỗi hoặc bị thiếu.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính sau:

- `encoding`
  - : Mã hóa của thông tin ngữ nghĩa trong chú thích, ví dụ `"application/x-tex"`
- `src` {{deprecated_inline}}
  - : Vị trí của một nguồn ngoài cho thông tin ngữ nghĩa.

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
    <!-- Phần tử con đầu tiên là biểu thức MathML được hiển thị mặc định. -->
    <mrow>
      <msup>
        <mi>x</mi>
        <mn>2</mn>
      </msup>
      <mo>+</mo>
      <mi>y</mi>
    </mrow>

    <!-- Chú thích bằng LaTeX, một ngôn ngữ đánh dấu gọn nhẹ. -->
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
      Không có
    </td>
  </tr>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
