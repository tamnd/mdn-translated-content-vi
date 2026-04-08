---
title: math-shift
slug: Web/CSS/Reference/Properties/math-shift
page-type: css-property
browser-compat: css.properties.math-shift
sidebar: cssref
---

Thuộc tính `math-shift` chỉ ra liệu các chỉ số trên (superscript) bên trong các công thức MathML có nên được nâng lên bằng độ dịch chuyển thông thường hay độ dịch chuyển thu gọn.

## Cú pháp

```css
/* Giá trị từ khóa */
math-shift: normal;
math-shift: compact;

/* Giá trị toàn cục */
math-shift: inherit;
math-shift: initial;
math-shift: revert;
math-shift: revert-layer;
math-shift: unset;
```

### Giá trị

- `normal`
  - : Giá trị ban đầu, chỉ ra cách hiển thị thông thường. Các chỉ số trên trong công thức MathML sử dụng tham số [superscriptShiftUp](https://w3c.github.io/mathml-core/#dfn-superscriptshiftup) từ bảng OpenType MATH.
- `compact`
  - : Chỉ ra cách hiển thị thu gọn. Các chỉ số trên trong công thức MathML sử dụng tham số [superscriptShiftUpCramped](https://w3c.github.io/mathml-core/#dfn-superscriptshiftupcramped) từ bảng OpenType MATH, thường nhỏ hơn.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Độ dịch chuyển thông thường và thu gọn

MathML sau đây hiển thị hai phiên bản "x bình phương" sử dụng phông chữ có bảng OpenType MATH.
Thuộc tính `math-shift` được sử dụng để nâng các chỉ số trên bằng độ dịch chuyển `normal` và `compact`.

#### CSS

```css
math {
  font-size: 64pt;
  math-shift: normal;
}

.compact-shift {
  math-shift: compact;
}
```

#### MathML

```html
<math>
  <msup>
    <mi>x</mi>
    <mn>2</mn>
  </msup>
  <msup class="compact-shift">
    <mi>x</mi>
    <mn>2</mn>
  </msup>
</math>
```

#### Kết quả

Lưu ý rằng chữ số "2" thứ hai có độ dịch chuyển thu gọn hơn (thấp hơn).

{{EmbedLiveSample("math-shift-example", "100%", "150px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("math-depth")}}
- {{cssxref("font-size")}}
