---
title: href
slug: Web/MathML/Reference/Global_attributes/href
page-type: mathml-attribute
status:
  - non-standard
browser-compat: mathml.global_attributes.href
sidebar: mathmlref
---

{{Non-standard_header}}

Thuộc tính [toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) **`href`** tạo một siêu liên kết trên phần tử MathML trỏ tới URL được chỉ định.

## Ví dụ

Phương trình đầu tiên liên kết tới bài viết Wikipedia về [mass-energy equivalence](https://en.wikipedia.org/wiki/Mass-energy_equivalence). Phần căn bậc hai của phương trình thứ hai là một liên kết tới phép tính [SageMath](https://sagecell.sagemath.org/?z=eJwrLiwq0TCOM9I2iTPSBAAeqgPO).

> [!NOTE]
> Bạn nên tránh lồng các phần tử MathML có thuộc tính `href`, giống như các phần tử {{htmlelement("a")}}, vì điều đó sẽ gây nhầm lẫn cho người dùng và tạo vấn đề về khả năng truy cập.

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
<math
  display="block"
  href="https://en.wikipedia.org/wiki/Mass-energy_equivalence">
  <mrow>
    <mi>E</mi>
    <mo>=</mo>
    <mi>m</mi>
    <msup>
      <mi>c</mi>
      <mn>2</mn>
    </msup>
  </mrow>
</math>

<math display="block">
  <mi>c</mi>
  <mo>=</mo>
  <msqrt href="https://sagecell.sagemath.org/?z=eJwrLiwq0TCOM9I2iTPSBAAeqgPO">
    <msup>
      <mn>3</mn>
      <mn>2</mn>
    </msup>
    <mo>+</mo>
    <msup>
      <mn>4</mn>
      <mn>2</mn>
    </msup>
  </msqrt>
  <mo>=</mo>
  <mn>5</mn>
</math>
```

{{ EmbedLiveSample("Example", "", 150) }}

## Cú pháp

```html-nolint
<math href="https://example.com/">
```

### Giá trị

- `URL`
  - : URL mà siêu liên kết trỏ tới.

## Đặc tả

Thuộc tính `href` không được định nghĩa trong bất kỳ đặc tả hướng tới trình duyệt nào, nhưng bạn có thể tìm thấy mô tả trong [MathML 4](https://w3c.github.io/mathml/#interf_link).

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes).
