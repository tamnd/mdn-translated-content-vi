---
title: <mo>
slug: Web/MathML/Reference/Element/mo
page-type: mathml-element
browser-compat: mathml.elements.mo
sidebar: mathmlref
---

**`<mo>`** [MathML](/en-US/docs/Web/MathML) element đại diện cho một **toán tử** theo nghĩa rộng. Ngoài các toán tử theo nghĩa toán học chặt chẽ, phần tử này còn bao gồm những "toán tử" như dấu ngoặc, các ký tự phân tách như dấu phẩy và dấu chấm phẩy, hoặc các thanh "giá trị tuyệt đối".

## Thuộc tính

Ngoài [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes), phần tử này còn chấp nhận các thuộc tính sau [mà giá trị mặc định phụ thuộc vào dạng và nội dung của toán tử](https://w3c.github.io/mathml-core/#algorithm-for-determining-the-properties-of-an-embellished-operator):

- `accent` {{Non-standard_Inline}}
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết toán tử có nên được xử lý như một dấu nhấn khi dùng làm [chỉ số dưới](/en-US/docs/Web/MathML/Reference/Element/munder) hoặc [chỉ số trên](/en-US/docs/Web/MathML/Reference/Element/mover) hay không (tức là được vẽ lớn hơn và gần với biểu thức gốc hơn).
- `fence`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết toán tử có phải là một dấu bao hay không (chẳng hạn dấu ngoặc). Thuộc tính này không có hiệu ứng trực quan.
- `form`
  - : Một thuộc tính [liệt kê](/en-US/docs/Glossary/Enumerated) xác định cách toán tử sẽ được trình bày. Ví dụ, tùy theo giá trị, một lượng khoảng trống khác nhau có thể được hiển thị ở hai bên toán tử. Nó có thể nhận một trong các giá trị sau:
    - `prefix`: Toán tử xuất hiện trước các toán hạng của nó. Ví dụ, trong biểu thức `+ a`, dấu `+` là toán tử tiền tố.
    - `infix`: Toán tử xuất hiện giữa các toán hạng của nó. Trong biểu thức `a + b`, dấu `+` là toán tử trung tố.
    - `postfix`: Toán tử xuất hiện sau các toán hạng của nó. Ví dụ, trong biểu thức `a +`, dấu `+` là toán tử hậu tố.
- `largeop`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết toán tử có nên được vẽ lớn hơn khi {{cssxref("math-style")}} được đặt thành `normal` hay không.
- `lspace`
  - : Một {{cssxref("length-percentage")}} cho biết lượng khoảng trống trước toán tử.
- `maxsize`
  - : Một {{cssxref("length-percentage")}} cho biết kích thước tối đa của toán tử khi nó co giãn.
- `minsize`
  - : Một {{cssxref("length-percentage")}} cho biết kích thước tối thiểu của toán tử khi nó co giãn.
- `movablelimits`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết các chỉ số dưới và trên đi kèm có nên chuyển sang vị trí chỉ số dưới và chỉ số trên khi {{cssxref("math-style")}} được đặt thành `compact` hay không.
- `rspace`
  - : Một {{cssxref("length-percentage")}} cho biết lượng khoảng trống sau toán tử.
- `separator`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết toán tử có phải là dấu phân tách hay không (chẳng hạn dấu phẩy). Thuộc tính này không có hiệu ứng trực quan.
- `stretchy`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết toán tử có co giãn theo kích thước của phần tử kề bên hay không.
- `symmetric`
  - : Một [`<boolean>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) cho biết một toán tử co giãn có nên đối xứng theo chiều dọc quanh trục toán học tưởng tượng (đường phân số ở giữa) hay không.

> [!NOTE]
> Với các thuộc tính `lspace`, `maxsize`, `minsize` và `rspace`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML kiểu cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

```html-nolint
<math display="block">
  <mrow>
    <mn>5</mn>
    <mo>+</mo>
    <mn>5</mn>
  </mrow>
</math>

<math display="block">
  <mrow>
    <mo>[</mo> <!-- giá trị form mặc định: prefix -->
    <mrow>
      <mn>0</mn>
      <mo>;</mo> <!-- giá trị form mặc định: infix -->
      <mn>1</mn>
    </mrow>
    <mo>)</mo> <!-- giá trị form mặc định: postfix -->
  </mrow>
</math>
```

{{ EmbedLiveSample('mo_example', 700, 200, "", "") }}

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
