---
title: <mpadded>
slug: Web/MathML/Reference/Element/mpadded
page-type: mathml-element
browser-compat: mathml.elements.mpadded
sidebar: mathmlref
---

**`<mpadded>`** [MathML](/en-US/docs/Web/MathML) element được dùng để thêm khoảng đệm bổ sung và đặt điều chỉnh chung về vị trí và kích thước của nội dung bên trong.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cũng như các thuộc tính sau:

- `depth`
  - : Một {{cssxref("length-percentage")}} cho biết độ sâu mong muốn (bên dưới đường cơ sở) của phần tử `<mpadded>`.
- `height`
  - : Một {{cssxref("length-percentage")}} cho biết chiều cao mong muốn (bên trên đường cơ sở) của phần tử `<mpadded>`.
- `lspace`
  - : Một {{cssxref("length-percentage")}} cho biết vị trí ngang của điểm định vị của nội dung con so với điểm định vị của phần tử `<mpadded>`.
- `voffset`
  - : Một {{cssxref("length-percentage")}} cho biết vị trí dọc của điểm định vị của nội dung con so với điểm định vị của phần tử `<mpadded>`.
- `width`
  - : Một {{cssxref("length-percentage")}} cho biết chiều ngang mong muốn của phần tử `<mpadded>`.

### Cú pháp kiểu cũ

Với các thuộc tính `depth`, `height`, `lspace`, `voffset` và `width`, một số trình duyệt có thể chấp nhận cú pháp phức tạp hơn:

1. Một dấu `+` hoặc `-` tùy chọn ở đầu, chỉ định tăng hoặc giảm kích thước tương ứng (nếu không có, kích thước tương ứng được đặt trực tiếp thành giá trị được chỉ định).
2. Tiếp theo là một [`<unsigned-number>`](/en-US/docs/Web/MathML/Reference/Values#mathml-specific_types) (gọi là α bên dưới).
3. Tùy chọn theo sau là một giá trị (nếu không có, giá trị được chỉ định được hiểu là "100 lần phần trăm của α").
   - Một [unit](/en-US/docs/Web/MathML/Reference/Values#units). Giá trị được chỉ định được hiểu giống như [độ dài MathML kiểu cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).
   - Một [namedspace constant](/en-US/docs/Web/MathML/Reference/Values#constants). Giá trị được chỉ định được hiểu là α nhân với hằng số đó.
   - Một pseudo-unit `width`, `height` hoặc `depth`. Giá trị được chỉ định được hiểu là α nhân với kích thước tương ứng của nội dung.
   - Một dấu phần trăm theo sau bởi một pseudo-unit `width`, `height` hoặc `depth`. Giá trị được chỉ định được hiểu là α% kích thước tương ứng của nội dung.

## Ví dụ

### Kích thước và độ lệch

```html
<math display="block">
  <mpadded width="400px" height="5em" depth="4em" lspace="300px" voffset="-2em">
    <mi>x</mi>
    <mo>+</mo>
    <mi>y</mi>
  </mpadded>
</math>
```

```css
mpadded {
  background: lightblue;
}
```

{{ EmbedLiveSample('dimensions_and_offsets_example', 700, 200, "", "") }}

### Cú pháp kiểu cũ

```html
<math display="block">
  <!-- tăng thêm theo một độ dài -->
  <mpadded width="+20px">
    <mtext>+20px</mtext>
  </mpadded>

  <!-- đặt thành pseudo-unit -->
  <mpadded width="2width">
    <mtext>2width</mtext>
  </mpadded>

  <!-- tăng thêm theo phần trăm của pseudo-unit -->
  <mpadded width="+400%height">
    <mtext>+400%height</mtext>
  </mpadded>

  <!-- giảm xuống còn một bội số của namedspace -->
  <mpadded width="-1thickmathspace">
    <mtext>-1thickmathspace</mtext>
  </mpadded>
</math>
```

```css
mpadded:nth-child(1) {
  background: lightblue;
}
mpadded:nth-child(2) {
  background: lightgreen;
}
mpadded:nth-child(3) {
  background: lightyellow;
}
mpadded:nth-child(4) {
  background: pink;
}
```

{{ EmbedLiveSample('legacy_syntax_example', 700, 200, "", "") }}

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

- {{ MathMLElement("mphantom") }}
- {{ MathMLElement("mspace") }}
