---
title: exp()
slug: Web/CSS/Reference/Values/exp
page-type: css-function
browser-compat: css.types.exp
sidebar: cssref
---

Hàm **`exp()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) là hàm số mũ nhận một số làm đối số và trả về hằng số toán học `e` được nâng lên lũy thừa của số đã cho.

Hằng số toán học [`e`](<https://en.wikipedia.org/wiki/E_(mathematical_constant)>) là cơ số của logarit tự nhiên, xấp xỉ bằng `2.718281828459045`.

Hàm `exp(number)` chứa một phép tính trả về giá trị tương đương với {{CSSxRef("pow", "pow(e, number)")}}.

## Cú pháp

```css
/* A <number> value */
width: calc(100px * exp(-1)); /* 100px * 0.367879441171442 = 36.8px */
width: calc(100px * exp(0)); /* 100px * 1 = 100px */
width: calc(100px * exp(1)); /* 100px * 2.718281828459045 = 271.8px */
```

### Tham số

Hàm `exp(number)` chỉ chấp nhận một giá trị làm tham số.

- `number`
  - : Một phép tính có kết quả là {{CSSxRef("number")}}. Đại diện cho giá trị sẽ được nâng lên lũy thừa của `e`.

### Giá trị trả về

Trả về một {{CSSxRef("number")}} không âm đại diện cho e<sup>number</sup>, là kết quả của việc tính `e` nâng lên lũy thừa của `number`.

- Nếu `number` là `-Infinity`, kết quả là `0`.
- Nếu `number` là `0`, kết quả là `1`.
- Nếu `number` là `1`, kết quả là `e` (tức là `2.718281828459045`).
- Nếu `number` là `Infinity`, kết quả là `Infinity`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Xoay các phần tử

Hàm `exp()` có thể được dùng để {{CSSxRef("transform-function/rotate", "xoay")}} các phần tử vì nó trả về {{CSSxRef("number")}}.

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
  transform: rotate(calc(1turn * exp(-1))); /* 0.3678794411714423turn */
}
div.box-2 {
  transform: rotate(calc(1turn * exp(-0.75))); /* 0.4723665527410147turn */
}
div.box-3 {
  transform: rotate(calc(1turn * exp(-0.5))); /* 0.6065306597126334turn */
}
div.box-4 {
  transform: rotate(calc(1turn * exp(-0.25))); /* 0.7788007830714049turn */
}
div.box-5 {
  transform: rotate(calc(1turn * exp(0))); /* 1turn */
}
```

#### Kết quả

{{EmbedLiveSample('Rotate elements', '100%', '200px')}}

### Điều chỉnh kích thước tiêu đề theo tỷ lệ cố định

Hàm `exp()` có thể hữu ích cho các chiến lược như CSS modular scale, liên kết tất cả các kích thước font trên trang với nhau theo tỷ lệ cố định.

#### HTML

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>
```

#### CSS

```css
h1 {
  font-size: calc(1rem * exp(1.25)); /* 3.4903429574618414rem */
}
h2 {
  font-size: calc(1rem * exp(1)); /* 2.718281828459045rem */
}
h3 {
  font-size: calc(1rem * exp(0.75)); /* 2.117000016612675rem */
}
h4 {
  font-size: calc(1rem * exp(0.5)); /* 1.6487212707001282rem */
}
h5 {
  font-size: calc(1rem * exp(0.25)); /* 1.2840254166877414rem */
}
h6 {
  font-size: calc(1rem * exp(0)); /* 1rem */
}
```

#### Kết quả

{{EmbedLiveSample('Scale headings by fixed ratio', '100%', '300px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("pow")}}
- {{CSSxRef("sqrt")}}
- {{CSSxRef("hypot")}}
- {{CSSxRef("log")}}
