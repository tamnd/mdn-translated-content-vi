---
title: asin()
slug: Web/CSS/Reference/Values/asin
page-type: css-function
browser-compat: css.types.asin
sidebar: cssref
---

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) [CSS](/vi/docs/Web/CSS) **`asin()`** là một hàm lượng giác trả về arcsin (hàm sin ngược) của một số trong khoảng `-1` đến `1`. Hàm chứa một phép tính duy nhất trả về {{cssxref("angle")}} trong khoảng `-90deg` đến `90deg`.

## Cú pháp

```css
/* Single <number> values */
transform: rotate(asin(-0.2));
transform: rotate(asin(2 * 0.125));

/* Other values */
transform: rotate(asin(pi / 5));
transform: rotate(asin(e / 3));
```

### Tham số

Hàm `asin(number)` chỉ chấp nhận một giá trị làm tham số.

- `number`
  - : Một phép tính được phân giải thành {{cssxref("&lt;number&gt;")}} trong khoảng `-1` đến `1`.

### Giá trị trả về

Arcsin của `number` sẽ luôn trả về {{cssxref("angle")}} trong khoảng `-90deg` đến `90deg`.

- Nếu `number` nhỏ hơn `-1` hoặc lớn hơn `1`, kết quả là `NaN`.
- Nếu `number` là `0⁻`, kết quả là `0⁻`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Xoay các phần tử

Hàm `asin()` có thể được dùng để {{cssxref("transform-function/rotate", "xoay")}} các phần tử vì nó trả về {{cssxref("angle")}}.

#### HTML

```html
<div class="box box-1"></div>
<div class="box box-2"></div>
<div class="box box-3"></div>
<div class="box box-4"></div>
<div class="box box-5"></div>
```

#### CSS

```css hidden
body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 50px;
}
```

```css
div.box {
  width: 100px;
  height: 100px;
  background: linear-gradient(orange, red);
}
div.box-1 {
  transform: rotate(asin(1));
}
div.box-2 {
  transform: rotate(asin(0.5));
}
div.box-3 {
  transform: rotate(asin(0));
}
div.box-4 {
  transform: rotate(asin(-0.5));
}
div.box-5 {
  transform: rotate(asin(-1));
}
```

#### Kết quả

{{EmbedLiveSample('Rotate elements', '100%', '200px')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sin")}}
- {{CSSxRef("cos")}}
- {{CSSxRef("tan")}}
- {{CSSxRef("acos")}}
- {{CSSxRef("atan")}}
- {{CSSxRef("atan2")}}
