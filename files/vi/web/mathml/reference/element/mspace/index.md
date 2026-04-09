---
title: <mspace>
slug: Web/MathML/Reference/Element/mspace
page-type: mathml-element
browser-compat: mathml.elements.mspace
sidebar: mathmlref
---

**`<mspace>`** [MathML](/en-US/docs/Web/MathML) element được dùng để hiển thị một khoảng trống, kích thước của nó được đặt bằng các thuộc tính của nó.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cũng như các thuộc tính sau:

- `depth`
  - : Một {{cssxref("length-percentage")}} cho biết độ sâu mong muốn (bên dưới đường cơ sở) của khoảng trống.
- `height`
  - : Một {{cssxref("length-percentage")}} cho biết chiều cao mong muốn (bên trên đường cơ sở) của khoảng trống.
- `width`
  - : Một {{cssxref("length-percentage")}} cho biết chiều rộng mong muốn của khoảng trống.

> [!NOTE]
> Với các thuộc tính `depth`, `height`, `width`, một số trình duyệt cũng có thể chấp nhận [độ dài MathML kiểu cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

```html
<math display="block">
  <mn>1</mn>
  <mspace depth="40px" height="20px" width="100px" />
  <mn>2</mn>
</math>
```

```css
mspace {
  background: lightblue;
}
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

- {{ MathMLElement("mpadded") }}
- {{ MathMLElement("mphantom") }}
