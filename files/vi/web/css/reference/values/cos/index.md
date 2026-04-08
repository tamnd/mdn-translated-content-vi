---
title: cos()
slug: Web/CSS/Reference/Values/cos
page-type: css-function
browser-compat: css.types.cos
sidebar: cssref
---

Hàm **`cos()`** trong [CSS](/vi/docs/Web/CSS) là một hàm lượng giác trả về cosine của một số, là giá trị nằm giữa `-1` và `1`. Hàm chứa một phép tính duy nhất phải giải thành {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("angle")}} bằng cách diễn giải kết quả của đối số theo radian. Nghĩa là, `cos(45deg)`, `cos(0.125turn)`, và `cos(3.14159 / 4)` đều đại diện cho cùng một giá trị, xấp xỉ `0.707`.

{{InteractiveExample("CSS Demo: cos()")}}

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
width: calc(100px * cos(45deg));
width: calc(100px * cos(0.125turn));
width: calc(100px * cos(0.785398163rad));

/* Giá trị <number> đơn lẻ */
width: calc(100px * cos(63.673));
width: calc(100px * cos(2 * 0.125));

/* Các giá trị khác */
width: calc(100px * cos(pi));
width: calc(100px * cos(e / 2));
```

### Tham số

Hàm `cos(angle)` chỉ chấp nhận một giá trị làm tham số.

- `angle`
  - : Một phép tính giải thành {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("angle")}}. Khi chỉ định các số không có đơn vị, chúng được diễn giải là số radian, đại diện cho {{cssxref("angle")}}.

### Giá trị trả về

Cosine của một `angle` luôn trả về một số nằm giữa `−1` và `1`.

- Nếu `angle` là `infinity`, `-infinity`, hoặc `NaN`, kết quả là `NaN`.

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Giữ kích thước của hộp được xoay

Hàm `cos()` có thể được sử dụng để giữ kích thước của hộp được xoay.

Khi phần tử được xoay bằng {{cssxref("transform-function/rotate", "rotate()")}}, nó vượt ra ngoài kích thước ban đầu của nó. Để khắc phục điều này, chúng ta sẽ sử dụng `cos()` để cập nhật kích thước phần tử.

Ví dụ, nếu bạn xoay một hình vuông `100px`/`100px` `45deg`, hình thoi mà nó tạo ra sẽ rộng hơn và cao hơn hình vuông ban đầu. Để thu nhỏ hình thoi vào hộp được phân bổ cho hình vuông ban đầu, bạn phải thu nhỏ hình thoi bằng công thức này: `width = height = 100px * cos(45deg) = 100px * 0.707 = 70.7px`. Bạn cũng cần điều chỉnh {{cssxref("transform-origin")}} và thêm {{cssxref("transform-function/translate", "translate()")}} để sửa vị trí:

#### HTML

```html
<div class="original-square"></div>
<div class="rotated-diamond"></div>
<div class="rotated-scaled-diamond"></div>
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
div.original-square {
  width: 100px;
  height: 100px;
  background-color: blue;
}
div.rotated-diamond {
  width: 100px;
  height: 100px;
  background-color: red;
  transform: rotate(45deg);
}
div.rotated-scaled-diamond {
  width: calc(100px * cos(45deg));
  height: calc(100px * cos(45deg));
  margin: calc(100px / 4 * cos(45deg));
  transform: rotate(45deg);
  transform-origin: center;
  background-color: green;
}
```

#### Kết quả

{{EmbedLiveSample('Keep the size of a rotated box', '100%', '200px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sin")}}
- {{CSSxRef("tan")}}
- {{CSSxRef("asin")}}
- {{CSSxRef("acos")}}
- {{CSSxRef("atan")}}
- {{CSSxRef("atan2")}}
