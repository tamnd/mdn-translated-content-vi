---
title: rem()
slug: Web/CSS/Reference/Values/rem
page-type: css-function
browser-compat: css.types.rem
sidebar: cssref
---

Hàm **`rem()`** [CSS](/vi/docs/Web/CSS) [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) trả về phần dư còn lại khi tham số đầu tiên được chia cho tham số thứ hai, tương tự như [toán tử phần dư (`%`)](/vi/docs/Web/JavaScript/Reference/Operators/Remainder) trong JavaScript. Phần dư là giá trị còn lại khi một toán hạng, số bị chia, được chia cho toán hạng thứ hai, số chia. Nó luôn mang dấu của số bị chia.

> [!NOTE]
> Để đọc về đơn vị `rem`, xem trang {{CSSxRef("&lt;length&gt;")}}.

Ví dụ, hàm CSS `rem(27, 5)` trả về phần dư là `2`. Khi chia 27 cho 5, kết quả là 5 với phần dư là 2. Phép tính đầy đủ là `27 / 5 = 5 * 5 + 2`.

## Cú pháp

```css
/* <number> không có đơn vị */
line-height: rem(21, 2); /* 1 */
line-height: rem(14, 5); /* 4 */
line-height: rem(5.5, 2); /* 1.5 */

/* <percentage> và <dimension> có đơn vị */
margin: rem(14%, 3%); /* 2% */
margin: rem(18px, 5px); /* 3px */
margin: rem(10rem, 6rem); /* 4rem */
margin: rem(26vmin, 7vmin); /* 5vmin */
margin: rem(1000px, 29rem); /* 72px - nếu font-size gốc là 16px */

/* Giá trị âm/dương */
rotate: rem(200deg, 30deg); /* 20deg */
rotate: rem(140deg, -90deg); /* 50deg */
rotate: rem(-90deg, 20deg); /* -10deg */
rotate: rem(-55deg, -15deg); /* -10deg */

/* Các phép tính */
scale: rem(10 * 2, 1.7); /* 1.3 */
rotate: rem(10turn, 18turn / 3); /* 4turn */
transition-duration: rem(20s / 2, 3000ms * 2); /* 4s */
```

### Tham số

Hàm `rem(dividend, divisor)` chấp nhận hai giá trị phân cách bằng dấu phẩy làm tham số. Cả hai tham số phải có cùng kiểu, [number](/vi/docs/Web/CSS/Reference/Values/number), [dimension](/vi/docs/Web/CSS/Reference/Values/dimension), hoặc {{cssxref("percentage")}}, để hàm hợp lệ. Mặc dù các đơn vị trong hai tham số không cần giống nhau, chúng cần phải có cùng loại chiều, chẳng hạn như {{cssxref("length")}}, {{cssxref("angle")}}, {{cssxref("time")}}, hoặc {{cssxref("frequency")}} để hợp lệ.

- `dividend`
  - : Một phép tính trả về {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}} đại diện cho số bị chia.

- `divisor`
  - : Một phép tính trả về {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}} đại diện cho số chia.

### Giá trị trả về

Trả về {{CSSxREF("&lt;number&gt;")}}, {{CSSxREF("&lt;dimension&gt;")}}, hoặc {{CSSxREF("&lt;percentage&gt;")}} (tương ứng với kiểu của các tham số) đại diện cho phần dư, tức là phép tính còn lại.

- Nếu `divisor` là `0`, kết quả là `NaN`.
- Nếu `dividend` là vô cùng, kết quả là `NaN`.
- Nếu `dividend` là dương thì kết quả là dương (`0⁺`), và nếu `dividend` là âm thì kết quả là âm (`0⁻`).

## Cú pháp chính thức

{{CSSSyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("round")}}
- {{CSSxRef("mod")}}
- {{CSSxRef("&lt;length&gt;")}}
