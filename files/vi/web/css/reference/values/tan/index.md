---
title: tan()
slug: Web/CSS/Reference/Values/tan
page-type: css-function
browser-compat: css.types.tan
sidebar: cssref
---

Hàm **`tan()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) lượng giác trả về tang của một số, là giá trị nằm trong khoảng từ `−infinity` đến `infinity`. Hàm này chứa một phép tính đơn lẻ phải giải quyết thành {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("angle")}} bằng cách diễn giải kết quả của đối số theo đơn vị radian.

## Cú pháp

```css
/* Single <angle> values */
width: calc(100px * tan(45deg));
width: calc(100px * tan(0.125turn));
width: calc(100px * tan(0.785398163rad));

/* Single <number> values */
width: calc(100px * tan(0.5773502));
width: calc(100px * tan(1.732 - 1));

/* Other values */
width: calc(100px * tan(pi / 3));
width: calc(100px * tan(e));
```

### Tham số

Hàm `tan(angle)` chỉ chấp nhận một giá trị làm tham số.

- `angle`
  - : Một phép tính giải quyết thành {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("angle")}}. Khi chỉ định số không có đơn vị, chúng được diễn giải là số radian, đại diện cho một {{cssxref("angle")}}.

### Giá trị trả về

Tang của một `angle` sẽ luôn trả về một số trong khoảng từ `−∞` đến `+∞`.

- Nếu `angle` là `infinity`, `-infinity` hoặc `NaN`, kết quả là `NaN`.
- Nếu `angle` là `0⁻`, kết quả là `0⁻`.
- Nếu `angle` là một trong các giá trị đường tiệm cận (chẳng hạn như `90deg`, `270deg`, v.v.), kết quả _không được xác định rõ ràng_. Tác giả _không được_ dựa vào `tan()` để trả về bất kỳ giá trị cụ thể nào cho các đầu vào này.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Vẽ hình bình hành

Hàm `tan()` có thể được sử dụng để vẽ một hình bình hành với hộp giới hạn cho trước.

#### HTML

```html
<div class="parallelogram"></div>
```

#### CSS

```css hidden
body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
```

```css
.parallelogram {
  --w: 400;
  --h: 200;
  --angle: 30deg;
  position: relative;
  width: calc(1px * var(--w));
  height: calc(1px * var(--h));
}
.parallelogram::before {
  content: "";
  position: absolute;
  width: calc(100% - 100% * var(--h) / var(--w) * tan(var(--angle)));
  height: 100%;
  transform-origin: 0 100%;
  transform: skewX(calc(0deg - var(--angle)));
  background-color: red;
}
```

#### Kết quả

{{EmbedLiveSample('Drawing parallelograms', '100%', '250px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sin")}}
- {{CSSxRef("cos")}}
- {{CSSxRef("asin")}}
- {{CSSxRef("acos")}}
- {{CSSxRef("atan")}}
- {{CSSxRef("atan2")}}
- [Sử dụng số học có kiểu trong CSS](/vi/docs/Web/CSS/Guides/Values_and_units/Using_typed_arithmetic)
