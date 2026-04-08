---
title: mod()
slug: Web/CSS/Reference/Values/mod
page-type: css-function
browser-compat: css.types.mod
sidebar: cssref
---

Hàm **`mod()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) trả về phần dư khi chia tham số thứ nhất cho tham số thứ hai, tương tự toán tử [phần dư (`%`)](/vi/docs/Web/JavaScript/Reference/Operators/Remainder) trong JavaScript. Phần dư là giá trị còn lại khi một toán hạng (số bị chia) được chia cho toán hạng thứ hai (số chia). Kết quả luôn mang dấu của số chia.

Phép tính là `a - (Math.floor(a / b) * b)`. Ví dụ, hàm CSS `mod(21, -4)` trả về phần dư `-3`. Phép tính đầy đủ là `21 - (Math.floor(21 / -4) * -4)`. Khi chia `21` cho `-4`, kết quả là `-5.25`. Giá trị này được làm tròn xuống thành `-6`. Nhân `-6` với `-4` được `24`. Lấy `21` trừ `24`, phần dư là -3.

## Cú pháp

```css
/* <number> không có đơn vị */
line-height: mod(7, 2); /* 1 */
line-height: mod(14, 5); /* 4 */
line-height: mod(3.5, 2); /* 1.5 */

/* <percentage> và <dimension> có đơn vị */
margin: mod(15%, 2%); /* 1% */
margin: mod(18px, 4px); /* 2px */
margin: mod(19rem, 5rem); /* 4rem */
margin: mod(29vmin, 6vmin); /* 5vmin */
margin: mod(1000px, 29rem); /* 72px - nếu font-size gốc là 16px */

/* Giá trị âm/dương */
rotate: mod(100deg, 30deg); /* 10deg */
rotate: mod(135deg, -90deg); /* -45deg */
rotate: mod(-70deg, 20deg); /* 10deg */
rotate: mod(-70deg, -15deg); /* -10deg */

/* Các phép tính */
scale: mod(10 * 2, 1.7); /* 1.3 */
rotate: mod(10turn, 18turn / 3); /* 4turn */
transition-duration: mod(20s / 2, 3000ms * 2); /* 4s */
```

### Tham số

Hàm `mod(dividend, divisor)` nhận hai giá trị phân tách bằng dấu phẩy làm tham số. Cả hai tham số phải có cùng kiểu, là [number](/vi/docs/Web/CSS/Reference/Values/number), [dimension](/vi/docs/Web/CSS/Reference/Values/dimension), hoặc {{cssxref("percentage")}}, để hàm hợp lệ. Trong khi các đơn vị trong hai tham số không cần giống nhau, chúng cần thuộc cùng loại dimension, chẳng hạn như {{cssxref("length")}}, {{cssxref("angle")}}, {{cssxref("time")}}, hoặc {{cssxref("frequency")}} để hợp lệ.

- `dividend`
  - : Một phép tính trả về giá trị {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}} đại diện cho số bị chia.

- `divisor`
  - : Một phép tính trả về giá trị {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}} đại diện cho số chia.

### Giá trị trả về

Trả về giá trị {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}} (tương ứng với kiểu của các tham số) đại diện cho phần dư, tức là phần còn lại của phép tính.

- Nếu `divisor` là `0`, kết quả là `NaN`.
- Nếu `dividend` là vô cực, kết quả là `NaN`.
- Nếu `divisor` dương, kết quả là dương (`0⁺`); nếu `divisor` âm, kết quả là âm (`0⁻`).

## Cú pháp chính thức

{{CSSSyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("round")}}
- {{CSSxRef("rem")}}
