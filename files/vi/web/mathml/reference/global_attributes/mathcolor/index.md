---
title: mathcolor
slug: Web/MathML/Reference/Global_attributes/mathcolor
page-type: mathml-attribute
status:
  - deprecated
browser-compat: mathml.global_attributes.mathcolor
sidebar: mathmlref
---

{{Deprecated_Header}}

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`mathcolor`** đặt [color](/en-US/docs/Web/CSS/Reference/Properties/color) của một phần tử MathML.

> [!NOTE]
> Hãy dùng CSS để tạo kiểu MathML khi có thể. Thuộc tính `mathcolor` chỉ nên được dùng cho các ứng dụng không nhận biết CSS và sẽ bị ghi đè bởi giá trị thuộc tính CSS `color`, nếu có.

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
<math display="block">
  <msqrt mathcolor="tomato">
    <mi mathcolor="darkgreen">x</mi>
  </msqrt>
</math>
```

{{EmbedLiveSample("Example", "", "150")}}

## Cú pháp

```html-nolint
<!-- Keyword values -->
<math mathcolor="currentColor">

<!-- <named-color> values -->
<math mathcolor="red">
<math mathcolor="orange">
<math mathcolor="tan">
<math mathcolor="rebeccapurple">

<!-- <hex-color> values -->
<math mathcolor="#090">
<math mathcolor="#009900">
<math mathcolor="#090a">
<math mathcolor="#009900aa">

<!-- <rgb()> values -->
<math mathcolor="rgb(34, 12, 64, 0.6)">
<math mathcolor="rgb(34 12 64 / 0.6)">
<math mathcolor="rgb(34.6 12 64 / 60%)">

<!-- <hsl()> values -->
<math mathcolor="hsl(30, 100%, 50%, 0.6)">
<math mathcolor="hsl(30 100% 50% / 0.6)">
<math mathcolor="hsl(30.2 100% 50% / 60%)">

<!-- <hwb()> values -->
<math mathcolor="hwb(90 10% 10%)">
<math mathcolor="hwb(90 10% 10% / 0.5)">
<math mathcolor="hwb(90deg 10% 10%)">
<math mathcolor="hwb(1.5708rad 60% 0%)">
<math mathcolor="hwb(.25turn 0% 40% / 50%)">
```

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Đặt màu cho các phần văn bản và phần trang trí của phần tử, bao gồm ví dụ như thanh phân số hoặc ký hiệu căn.

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
- {{cssxref("color")}}
