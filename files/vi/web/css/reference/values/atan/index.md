---
title: atan()
slug: Web/CSS/Reference/Values/atan
page-type: css-function
browser-compat: css.types.atan
sidebar: cssref
---

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) [CSS](/vi/docs/Web/CSS) **`atan()`** là một hàm lượng giác trả về arctan (hàm tang ngược) của một số trong khoảng `-∞` đến `+∞`. Hàm chứa một phép tính duy nhất trả về {{cssxref("angle")}} trong khoảng `-90deg` đến `90deg`.

## Cú pháp

```css
/* Single <number> values */
transform: rotate(atan(1));
transform: rotate(atan(4 * 50));

/* Other values */
transform: rotate(atan(pi / 2));
transform: rotate(atan(e * 3));
```

### Tham số

Hàm `atan(number)` chỉ chấp nhận một giá trị làm tham số.

- `number`
  - : Một phép tính được phân giải thành {{cssxref("&lt;number&gt;")}} trong khoảng `-∞` đến `+∞`.

### Giá trị trả về

Arctan của `number` sẽ luôn trả về {{cssxref("angle")}} trong khoảng `-90deg` đến `90deg`.

- Nếu `number` là `0⁻`, kết quả là `0⁻`.
- Nếu `number` là `+∞`, kết quả là `90deg`.
- Nếu `number` là `-∞`, kết quả là `-90deg`.

Tức là:

- `atan(-infinity)` biểu diễn `-90deg`.
- `atan(-1)` biểu diễn `-45deg`
- `atan(0)` biểu diễn `0deg`
- `atan(1)` biểu diễn `45deg`
- `atan(infinity)` biểu diễn `90deg`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Xoay các phần tử

Hàm `atan()` có thể được dùng để {{cssxref("transform-function/rotate", "xoay")}} các phần tử vì nó trả về {{cssxref("angle")}}.

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
  transform: rotate(atan(-99999));
}
div.box-2 {
  transform: rotate(atan(-1));
}
div.box-3 {
  transform: rotate(atan(0));
}
div.box-4 {
  transform: rotate(atan(1));
}
div.box-5 {
  transform: rotate(atan(99999));
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
- {{CSSxRef("asin")}}
- {{CSSxRef("acos")}}
- {{CSSxRef("atan2")}}
