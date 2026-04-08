---
title: sqrt()
slug: Web/CSS/Reference/Values/sqrt
page-type: css-function
browser-compat: css.types.sqrt
sidebar: cssref
---

Hàm **`sqrt()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) là một hàm mũ trả về [căn bậc hai](https://en.wikipedia.org/wiki/Square_root) của một số.

Hàm `pow(x, 0.5)` tương đương với `sqrt(x)`.

## Cú pháp

```css
/* Giá trị <number> */
width: calc(100px * sqrt(9)); /*  300px */
width: calc(100px * sqrt(25)); /*  500px */
width: calc(100px * sqrt(100)); /* 1000px */
```

### Tham số

Hàm `sqrt(x)` chỉ nhận một giá trị duy nhất làm tham số.

- `x`
  - : Một phép tính cho kết quả là {{cssxref("&lt;number&gt;")}} lớn hơn hoặc bằng 0.

### Giá trị trả về

Trả về {{cssxref("&lt;number&gt;")}} là căn bậc hai của `x`.

- Nếu `x` là `+∞`, kết quả là `+∞`.
- Nếu `x` là `0⁻`, kết quả là `0⁻`.
- Nếu `x` nhỏ hơn `0`, kết quả là `NaN`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Chia tỷ lệ kích thước dựa trên căn bậc hai

Ví dụ này cho thấy cách sử dụng hàm `sqrt()` để tính toán kích thước.

#### HTML

```html
<div class="boxes">
  <div class="box">50px</div>
  <div class="box one">100px</div>
  <div class="box two">150px</div>
  <div class="box three">200px</div>
</div>
```

#### CSS

Ở đây chúng ta sử dụng [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) để xác định các kích thước được dùng. Đầu tiên, chúng ta khai báo kích thước đầu tiên (`--size-0`), sau đó dùng nó để tính các kích thước còn lại.

- `--size-1` được tính bằng cách nhân giá trị của `--size-0` (50px) với căn bậc hai của 4 (2), kết quả là 100px.
- `--size-2` được tính bằng cách nhân giá trị của `--size-0` (50px) với căn bậc hai của 9 (3), kết quả là 150px.
- `--size-3` được tính bằng cách nhân giá trị của `--size-0` (50px) với căn bậc hai của 16 (4), kết quả là 200px.

```css
:root {
  --size-0: 50px;
  --size-1: calc(var(--size-0) * sqrt(4)); /*  100px */
  --size-2: calc(var(--size-0) * sqrt(9)); /*  150px */
  --size-3: calc(var(--size-0) * sqrt(16)); /*  200px */
}
```

```css hidden
.boxes {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}

.box {
  width: var(--size-0);
  height: var(--size-0);
  background-color: tomato;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
}
```

Các kích thước sau đó được áp dụng làm giá trị `width` và `height` của các bộ chọn.

```css
.one {
  width: var(--size-1);
  height: var(--size-1);
}
.two {
  width: var(--size-2);
  height: var(--size-2);
}
.three {
  width: var(--size-3);
  height: var(--size-3);
}
```

#### Kết quả

{{EmbedLiveSample('Scale sizes based on square root', '100%', '220px')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("pow")}}
- {{CSSxRef("hypot")}}
- {{CSSxRef("log")}}
- {{CSSxRef("exp")}}
