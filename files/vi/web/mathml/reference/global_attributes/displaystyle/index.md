---
title: displaystyle
slug: Web/MathML/Reference/Global_attributes/displaystyle
page-type: mathml-attribute
browser-compat: mathml.global_attributes.displaystyle
sidebar: mathmlref
---

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`displaystyle`** là một boolean đặt [math-style](/en-US/docs/Web/CSS/Reference/Properties/math-style) của phần tử MathML.

## Ví dụ

Trong ví dụ này, phần tử [munder](/en-US/docs/Web/MathML/Reference/Element/munder) được dùng để gắn một script "A" vào cơ sở "∑". Theo mặc định, ký hiệu tổng được hiển thị với [font-size](/en-US/docs/Web/CSS/Reference/Properties/font-size) kế thừa từ phần tử cha và ký tự A được thu nhỏ thành chỉ số dưới. Với thuộc tính `displaystyle="true"` rõ ràng, ký hiệu tổng thay vào đó được vẽ lớn hơn và ký tự "A" trở thành một chỉ số dưới.

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
<math>
  <munder>
    <mo>∑</mo>
    <mi>A</mi>
  </munder>
  <munder displaystyle="true">
    <mo>∑</mo>
    <mi>A</mi>
  </munder>
</math>
```

{{ EmbedLiveSample("Example", "", 150) }}

## Cú pháp

```html-nolint
<math displaystyle="true">
<math displaystyle="false">
```

### Giá trị

- `true`
  - : Đặt kiểu hiển thị thành `normal`.
- `false`
  - : Đặt kiểu hiển thị thành `compact`.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).
- Thuộc tính toàn cục [scriptlevel](/en-US/docs/Web/MathML/Reference/Global_attributes/scriptlevel).
- {{cssxref("font-size")}}
- {{cssxref("math-depth")}}
- {{cssxref("math-style")}}
