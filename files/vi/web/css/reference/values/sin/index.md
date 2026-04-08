---
title: sin()
slug: Web/CSS/Reference/Values/sin
page-type: css-function
browser-compat: css.types.sin
sidebar: cssref
---

Hàm **`sin()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) là một hàm lượng giác trả về sin của một số, là giá trị nằm trong khoảng từ `-1` đến `1`. Hàm nhận một phép tính duy nhất phải cho kết quả là {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("angle")}} bằng cách diễn giải kết quả của đối số theo radian. Tức là `sin(45deg)`, `sin(0.125turn)` và `sin(3.14159 / 4)` đều biểu diễn cùng một giá trị, xấp xỉ `0.707`.

{{InteractiveExample("CSS Demo: sin()")}}

```css interactive-example-choice
transform: translateX(calc(cos(0deg) * 140px))
  translateY(calc(sin(0deg) * -140px));
```

```css interactive-example-choice
transform: translateX(calc(cos(90deg) * 140px))
  translateY(calc(sin(90deg) * -140px));
```

```css interactive-example-choice
transform: translateX(calc(cos(135deg) * 140px))
  translateY(calc(sin(135deg) * -140px));
```

```css interactive-example-choice
transform: translateX(calc(cos(180deg) * 140px))
  translateY(calc(sin(180deg) * -140px));
```

```css interactive-example-choice
transform: translateX(calc(cos(-45deg) * 140px))
  translateY(calc(sin(-45deg) * -140px));
```

```html interactive-example
<div class="circle">
  <span class="dot" id="example-element"></span>
</div>
```

```css interactive-example
:root {
  --radius: 140px;
  --dot-size: 10px;
}
.circle {
  display: grid;
  place-content: center;
  margin: 0 auto;
  width: calc(var(--radius) * 2);
  aspect-ratio: 1;
  border-radius: 50%;
  border: 2px solid #666666;
  background-image:
    radial-gradient(black var(--dot-size), transparent var(--dot-size)),
    linear-gradient(135deg, blue, deepskyblue, lightgreen, lavender, honeydew);
}
.dot {
  display: block;
  width: var(--dot-size);
  aspect-ratio: 1;
  border-radius: 50%;
  border: 2px solid #666666;
  background-color: #ff6666;
  transform: translateX(calc(cos(0deg) * var(--radius)))
    translateY(calc(sin(0deg) * var(--radius) * -1));
}
```

## Cú pháp

```css
/* Giá trị <angle> đơn lẻ */
width: calc(100px * sin(45deg));
width: calc(100px * sin(0.25turn));
width: calc(100px * sin(1.0471967rad));

/* Giá trị <number> đơn lẻ */
width: calc(100px * sin(63.673));
width: calc(100px * sin(2 * 0.125));

/* Các giá trị khác */
width: calc(100px * sin(pi / 2));
width: calc(100px * sin(e / 4));
```

### Tham số

Hàm `sin(angle)` chỉ nhận một giá trị duy nhất làm tham số.

- `angle`
  - : Một phép tính cho kết quả là {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("angle")}}. Khi chỉ định các số không có đơn vị, chúng được diễn giải là số radian, biểu diễn một {{cssxref("angle")}}.

### Giá trị trả về

Sin của `angle` luôn trả về một số nằm trong khoảng từ `−1` đến `1`.

- Nếu `angle` là `infinity`, `-infinity` hoặc `NaN`, kết quả là `NaN`.
- Nếu `angle` là `0⁻`, kết quả là `0⁻`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Thay đổi kích thước hộp

Trong ví dụ này, `sin(30deg)` sẽ trả về `0.5`, làm cho hộp có chiều rộng `50px` và chiều cao `50px`.

```css
div {
  background-color: red;
  width: calc(sin(30deg) * 100px);
  height: calc(sin(30deg) * 100px);
}
```

### Kiểm soát thời lượng hoạt ảnh

Một trường hợp sử dụng khác là kiểm soát {{cssxref("animation-duration")}}, rút ngắn thời lượng dựa trên giá trị sin. Trong trường hợp này, thời lượng hoạt ảnh sẽ là `1s`.

```css
div {
  animation-name: myAnimation;
  animation-duration: calc(sin(0.25turn) * 1s);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("cos")}}
- {{CSSxRef("tan")}}
- {{CSSxRef("asin")}}
- {{CSSxRef("acos")}}
- {{CSSxRef("atan")}}
- {{CSSxRef("atan2")}}
