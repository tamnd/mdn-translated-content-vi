---
title: mathsize
slug: Web/MathML/Reference/Global_attributes/mathsize
page-type: mathml-attribute
status:
  - deprecated
browser-compat: mathml.global_attributes.mathsize
sidebar: mathmlref
---

{{Deprecated_Header}}

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`mathsize`** đặt [font-size](/en-US/docs/Web/CSS/Reference/Properties/font-size) của một phần tử MathML.

> [!NOTE]
> Hãy dùng CSS để tạo kiểu MathML khi có thể. Thuộc tính `mathsize` chỉ nên được dùng cho các ứng dụng không nhận biết CSS và sẽ bị ghi đè bởi giá trị thuộc tính CSS `font-size`, nếu có.

## Ví dụ

```css hidden
html,
body {
  height: 100%;
}

body {
  display: grid;
  place-items: center;
}
```

```html
<math display="block">
  <msup mathsize="16px">
    <mi>a</mi>
    <mn>2</mn>
  </msup>
  <mo>+</mo>
  <msup mathsize="24px">
    <mi>b</mi>
    <mn>2</mn>
  </msup>
  <mo>=</mo>
  <msup mathsize="32px">
    <mi>c</mi>
    <mn>2</mn>
  </msup>
</math>
```

{{EmbedLiveSample("Example", "", "150")}}

## Cú pháp

```html-nolint
<!-- <length> values -->
<math mathsize="12px">
<math mathsize="0.8em">

<!-- <percentage> values -->
<math mathsize="80%">
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Một giá trị {{cssxref("&lt;length&gt;")}} dương. Với hầu hết các đơn vị tương đối theo font (như `em` và `ex`), kích thước font là tương đối so với kích thước font của phần tử cha.

- {{cssxref("&lt;percentage&gt;")}}
  - : Một giá trị {{cssxref("&lt;percentage&gt;")}} dương, tương đối với kích thước font của phần tử cha.

> [!NOTE]
> Một số trình duyệt cũng có thể chấp nhận [độ dài MathML kiểu cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Đặc tả

{{Specifications}}

- Trong MathML 3 và các phiên bản cũ hơn, các từ khóa `small`, `normal`, `big` cũng như cú pháp độ dài riêng của MathML3 đều được hỗ trợ.
  Từ MathML Core, cú pháp khớp với các giá trị CSS {{cssxref("&lt;length-percentage&gt;")}}.

- Thuộc tính này được thiết kế cho các ứng dụng MathML không nhận biết CSS.
  Từ MathML Core, nên dùng CSS tương đương thay thế.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).
- {{cssxref("font-size")}}
