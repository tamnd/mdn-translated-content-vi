---
title: math-style
slug: Web/CSS/Reference/Properties/math-style
page-type: css-property
browser-compat: css.properties.math-style
sidebar: cssref
---

Thuộc tính `math-style` chỉ ra liệu các phương trình MathML có nên được hiển thị với chiều cao thông thường hay chiều cao thu gọn.

## Cú pháp

```css
/* Giá trị từ khóa */
math-style: normal;
math-style: compact;

/* Giá trị toàn cục */
math-style: inherit;
math-style: initial;
math-style: revert;
math-style: revert-layer;
math-style: unset;
```

### Giá trị

- `normal`
  - : Giá trị ban đầu, chỉ ra cách hiển thị thông thường.
- `compact`
  - : Bố cục toán học trên các phần tử con cố gắng tối thiểu hóa chiều cao logic.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Thay đổi kiểu của công thức thành compact

#### CSS

```css
math {
  math-style: normal;
}
.compact {
  math-style: compact;
}
```

#### HTML

```html
<p>
  Normal height
  <math>
    <mrow>
      <munderover>
        <mo>∑</mo>
        <mrow>
          <mi>n</mi>
          <mo>=</mo>
          <mn>1</mn>
        </mrow>
        <mrow>
          <mo>+</mo>
          <mn>∞</mn>
        </mrow>
      </munderover>
    </mrow>
  </math>
  and compact height
  <math class="compact">
    <mrow>
      <munderover>
        <mo>∑</mo>
        <mrow>
          <mi>n</mi>
          <mo>=</mo>
          <mn>1</mn>
        </mrow>
        <mrow>
          <mo>+</mo>
          <mn>∞</mn>
        </mrow>
      </munderover>
    </mrow>
  </math>
  equations.
</p>
```

#### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("math-depth")}}
- {{cssxref("font-size")}}
