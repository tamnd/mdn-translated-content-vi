---
title: <mrow>
slug: Web/MathML/Reference/Element/mrow
page-type: mathml-element
browser-compat: mathml.elements.mrow
sidebar: mathmlref
---

**`<mrow>`** [MathML](/en-US/docs/Web/MathML) element được dùng để nhóm các biểu thức con, thường chứa một hoặc nhiều [toán tử](/en-US/docs/Web/MathML/Reference/Element/mo) cùng các toán hạng tương ứng của chúng (chẳng hạn {{ MathMLElement("mi") }} và {{ MathMLElement("mn") }}). Phần tử này hiển thị dưới dạng một hàng ngang chứa các đối số của nó.

Khi viết một biểu thức MathML, bạn nên nhóm các phần tử bên trong `<mrow>` theo cùng cách mà chúng được nhóm trong cách diễn giải toán học của biểu thức đó. Việc nhóm đúng giúp việc hiển thị biểu thức tốt hơn theo nhiều cách:

- Nó có thể cải thiện cách trình bày bằng cách tác động đến khoảng cách và ngăn ngắt dòng.
- Nó đơn giản hóa việc diễn giải biểu thức bởi các hệ thống tự động như hệ đại số máy tính và bộ hiển thị âm thanh.

## Thuộc tính

Phần tử này chấp nhận các [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

```html
<math display="block">
  <mfrac>
    <mrow>
      <!-- nội dung tử số được nhóm trong một mrow -->
      <mn>1</mn>
      <mo>+</mo>
      <mi>K</mi>
    </mrow>
    <mrow>
      <!-- nội dung mẫu số được nhóm trong một mrow -->
      <mn>3</mn>
      <mrow>
        <!-- biểu thức có ngoặc được nhóm trong một mrow -->
        <mo>(</mo>
        <mrow>
          <!-- nội dung trong ngoặc được nhóm trong một mrow -->
          <mi>x</mi>
          <mo>+</mo>
          <mi>y</mi>
        </mrow>
        <mo>)</mo>
      </mrow>
    </mrow>
  </mfrac>
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

- Phần tử HTML nhóm: {{ HTMLElement("div") }}
