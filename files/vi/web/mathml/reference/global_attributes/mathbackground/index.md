---
title: mathbackground
slug: Web/MathML/Reference/Global_attributes/mathbackground
page-type: mathml-attribute
status:
  - deprecated
browser-compat: mathml.global_attributes.mathbackground
sidebar: mathmlref
---

{{Deprecated_Header}}

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`mathbackground`** đặt [background-color](/en-US/docs/Web/CSS/Reference/Properties/background-color) của một phần tử MathML.

> [!NOTE]
> Hãy dùng CSS để tạo kiểu MathML khi có thể. Thuộc tính `mathbackground` chỉ nên được dùng cho các ứng dụng không nhận biết CSS và sẽ bị ghi đè bởi giá trị thuộc tính CSS `background-color`, nếu có.

## Ví dụ

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  align-items: center;
  font-size: 1.5rem;
}
```

```html
<math display="block" mathbackground="wheat">
  <msqrt>
    <mi>x</mi>
  </msqrt>
</math>
```

{{EmbedLiveSample("Example", "", "150")}}

## Cú pháp

```html-nolint
<!-- Keyword values -->
<math mathbackground="red">
<math mathbackground="indigo">

<!-- Hexadecimal value -->
<math mathbackground="#bbff00"> <!-- Fully opaque -->
<math mathbackground="#bf0"> <!-- Fully opaque shorthand -->
<math mathbackground="#11ffee00"> <!-- Fully transparent -->
<math mathbackground="#1fe0"> <!-- Fully transparent shorthand -->
<math mathbackground="#11ffeeff"> <!-- Fully opaque -->
<math mathbackground="#1fef"> <!-- Fully opaque shorthand -->

<!-- RGB value -->
<math mathbackground="rgb(255 255 128)"> <!-- Fully opaque -->
<math mathbackground="rgb(117 190 218 / 50%)"> <!-- 50% transparent -->

<!-- HSL value -->
<math mathbackground="hsl(50 33% 25%)"> <!-- Fully opaque -->
<math mathbackground="hsl(50 33% 25% / 75%)"> <!-- 75% opaque, i.e. 25% transparent -->
```

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Màu đồng nhất của nền.

## Đặc tả

{{Specifications}}

- Trong MathML 3 và các phiên bản cũ hơn, chỉ hỗ trợ một tập giá trị hạn chế hơn.
  Từ MathML Core, cú pháp khớp với các giá trị CSS {{cssxref("&lt;color&gt;")}}.

- Thuộc tính này được thiết kế cho các ứng dụng MathML không nhận biết CSS.
  Từ MathML Core, nên dùng CSS tương đương thay thế.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).
- {{cssxref("background-color")}}
