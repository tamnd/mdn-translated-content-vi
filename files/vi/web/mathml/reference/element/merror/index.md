---
title: <merror>
slug: Web/MathML/Reference/Element/merror
page-type: mathml-element
browser-compat: mathml.elements.merror
sidebar: mathmlref
---

Phần tử **`<merror>`** [MathML](/en-US/docs/Web/MathML) được dùng để hiển thị nội dung dưới dạng thông báo lỗi. Mục đích của phần tử này là cung cấp một cách chuẩn hóa để các chương trình tạo MathML từ đầu vào khác có thể báo lỗi cú pháp.

## Thuộc tính

Phần tử này chấp nhận [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).

## Ví dụ

Trong ví dụ sau, `<merror>` được dùng để chỉ ra lỗi phân tích cú pháp đối với một số đầu vào kiểu LaTeX:

```html
<math display="block">
  <mfrac>
    <merror>
      <mtext>Lỗi cú pháp: \frac{1}</mtext>
    </merror>
    <mn>3</mn>
  </mfrac>
</math>
```

{{ EmbedLiveSample('merror_example', 700, 200, "", "") }}

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
