---
title: pow()
slug: Web/CSS/Reference/Values/pow
page-type: css-function
browser-compat: css.types.pow
sidebar: cssref
---

Hàm **`pow()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) lũy thừa trả về giá trị của một cơ số được nâng lên lũy thừa của một số.

Hàm {{CSSxRef("exp")}} là trường hợp đặc biệt của `pow()` trong đó giá trị cơ số là hằng số toán học [e](<https://en.wikipedia.org/wiki/E_(mathematical_constant)>).

## Cú pháp

```css
/* Giá trị <number> */
width: calc(10px * pow(5, 2)); /* 10px * 25 = 250px */
width: calc(10px * pow(5, 3)); /* 10px * 125 = 1250px */
width: calc(10px * pow(2, 10)); /* 10px * 1024 = 10240px */
```

### Tham số

Hàm `pow(base, number)` chấp nhận hai giá trị phân tách bằng dấu phẩy làm tham số.

- `base`
  - : Một phép tính cho kết quả là {{CSSxRef("&lt;number&gt;")}}, đại diện cho cơ số.
- `number`
  - : Một phép tính cho kết quả là {{CSSxRef("&lt;number&gt;")}}, đại diện cho số mũ.

### Giá trị trả về

Trả về một {{CSSxRef("&lt;number&gt;")}} đại diện cho base<sup>number</sup>, tức là `base` được nâng lên lũy thừa của `number`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Chia tỷ lệ tiêu đề theo tỷ lệ cố định

Hàm `pow()` có thể hữu ích cho các chiến lược như CSS Modular Scale, liên kết tất cả các cỡ chữ trên trang với nhau theo một tỷ lệ cố định.

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
  font-size: calc(1rem * pow(1.5, 4));
}
h2 {
  font-size: calc(1rem * pow(1.5, 3));
}
h3 {
  font-size: calc(1rem * pow(1.5, 2));
}
h4 {
  font-size: calc(1rem * pow(1.5, 1));
}
h5 {
  font-size: calc(1rem * pow(1.5, 0));
}
h6 {
  font-size: calc(1rem * pow(1.5, -1));
}
```

#### Kết quả

{{EmbedLiveSample('Scale headings by fixed ratio', '100%', '300px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sqrt")}}
- {{CSSxRef("hypot")}}
- {{CSSxRef("exp")}}
- {{CSSxRef("log")}}
