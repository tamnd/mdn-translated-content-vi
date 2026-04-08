---
title: acos()
slug: Web/CSS/Reference/Values/acos
page-type: css-function
browser-compat: css.types.acos
sidebar: cssref
---

Hàm **`acos()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) lượng giác trả về arccos (cosin nghịch đảo) của một số từ `-1` đến `1`. Hàm này chứa một phép tính duy nhất trả về một {{cssxref("angle")}} từ `0deg` đến `180deg`.

## Cú pháp

```css
/* Single <number> values */
transform: rotate(acos(-0.2));
transform: rotate(acos(2 * 0.125));

/* Other values */
transform: rotate(acos(pi / 5));
transform: rotate(acos(e / 3));
```

### Tham số

Hàm `acos(number)` chấp nhận chỉ một giá trị làm tham số.

- `number`
  - : Một phép tính cho kết quả là {{cssxref("&lt;number&gt;")}} từ `-1` đến `1`.

### Giá trị trả về

Cosin nghịch đảo của `number` sẽ luôn trả về một {{cssxref("angle")}} từ `0deg` đến `180deg`.

- Nếu `number` nhỏ hơn `-1` hoặc lớn hơn `1`, kết quả là `NaN`.
- Nếu `number` chính xác là `1`, kết quả là `0`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Xoay các phần tử

Hàm `acos()` có thể được sử dụng để {{cssxref("transform-function/rotate", "xoay")}} các phần tử vì nó trả về một {{cssxref("angle")}}.

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
  transform: rotate(acos(1));
}
div.box-2 {
  transform: rotate(acos(0.5));
}
div.box-3 {
  transform: rotate(acos(0));
}
div.box-4 {
  transform: rotate(acos(-0.5));
}
div.box-5 {
  transform: rotate(acos(-1));
}
```

#### Kết quả

{{EmbedLiveSample('Rotate elements', '100%', '200px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sin")}}
- {{CSSxRef("cos")}}
- {{CSSxRef("tan")}}
- {{CSSxRef("asin")}}
- {{CSSxRef("atan")}}
- {{CSSxRef("atan2")}}
