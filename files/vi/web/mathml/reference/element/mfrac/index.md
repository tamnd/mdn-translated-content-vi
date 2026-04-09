---
title: <mfrac>
slug: Web/MathML/Reference/Element/mfrac
page-type: mathml-element
browser-compat: mathml.elements.mfrac
sidebar: mathmlref
---

Phần tử **`<mfrac>`** [MathML](/en-US/docs/Web/MathML) được dùng để hiển thị phân số. Nó cũng có thể được dùng để đánh dấu các đối tượng giống phân số như [hệ số nhị thức](https://en.wikipedia.org/wiki/Binomial_coefficient) và [ký hiệu Legendre](https://en.wikipedia.org/wiki/Legendre_symbol).

## Cú pháp

```html
<mfrac>tử số mẫu số</mfrac>
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính MathML toàn cục](/en-US/docs/Web/MathML/Reference/Global_attributes) cùng với các thuộc tính sau:

- `denomalign` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Căn chỉnh của mẫu số bên dưới phân số. Các giá trị có thể có là: `left`, `center` (mặc định) và `right`.
- `linethickness`
  - : Một giá trị {{cssxref("length-percentage")}} cho biết độ dày của đường kẻ ngang của phân số.
- `numalign` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Căn chỉnh của tử số bên trên phân số. Các giá trị có thể có là: `left`, `center` (mặc định) và `right`.

> [!NOTE]
> Đối với thuộc tính `linethickness`, một số trình duyệt cũng có thể chấp nhận các giá trị đã lỗi thời `medium`, `thin` và `thick` (việc diễn giải chính xác các giá trị này tùy thuộc vào nhà triển khai) hoặc [độ dài MathML cũ](/en-US/docs/Web/MathML/Reference/Values#legacy_mathml_lengths).

## Ví dụ

### Phân số đơn giản

Đoạn mã MathML sau sẽ hiển thị thành một phân số với tử số "a + 2" và mẫu số "3 − b":

```html
<math display="block">
  <mfrac>
    <mrow>
      <mi>a</mi>
      <mo>+</mo>
      <mn>2</mn>
    </mrow>
    <mrow>
      <mn>3</mn>
      <mo>−</mo>
      <mi>b</mi>
    </mrow>
  </mfrac>
</math>
```

{{ EmbedLiveSample('simple_fraction', 700, 200, "", "") }}

### Phân số không có vạch

Đoạn mã MathML sau sẽ hiển thị thành một [hệ số nhị thức](https://en.wikipedia.org/wiki/Binomial_coefficient):

```html
<math display="block">
  <mrow>
    <mo>(</mo>
    <mfrac linethickness="0">
      <mi>n</mi>
      <mi>k</mi>
    </mfrac>
    <mo>)</mo>
  </mrow>
</math>
```

{{ EmbedLiveSample('Fraction_without_bar', 700, 200, "", "") }}

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
