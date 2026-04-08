---
title: abs()
slug: Web/CSS/Reference/Values/abs
page-type: css-function
browser-compat: css.types.abs
sidebar: cssref
---

Hàm **`abs()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) trả về giá trị tuyệt đối của đối số, cùng kiểu với đầu vào.

## Cú pháp

```css
/* abs( <calc-sum> ) */
abs(20% - 100px)
abs(var(--gradientAngle))
```

### Tham số

Hàm `abs()` chấp nhận một tham số.

- `<calc-sum>`
  - : Một biểu thức hoặc phép tính cho kết quả là {{cssxref("number")}}, {{cssxref("dimension")}}, {{cssxref("percentage")}} hoặc {{cssxref("calc-keyword")}}.

### Giá trị trả về

Giá trị tuyệt đối của `<calc-sum>`.

- Nếu giá trị số của `<calc-sum>` là dương hoặc `0⁺`, hàm trả về `<calc-sum>`.
- Ngược lại, nó trả về `-1 * <calc-sum>`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Biến luôn dương

Hàm `abs()` có thể được sử dụng để đảm bảo giá trị luôn dương. Trong ví dụ sau, thuộc tính CSS tùy chỉnh `--font-size` được sử dụng làm giá trị của {{CSSxRef("font-size")}}. Bọc thuộc tính tùy chỉnh này trong `abs()` sẽ chuyển đổi giá trị âm thành giá trị dương.

```css
h1 {
  font-size: abs(var(--font-size));
}
```

### Kiểm soát góc hướng gradient

Bạn cũng có thể kiểm soát hướng gradient bằng hàm `abs()`. Trong ví dụ sau, với góc -45deg, gradient sẽ bắt đầu bằng màu đỏ và chuyển sang màu xanh lam. Bằng cách sử dụng `abs()` để làm cho giá trị dương, gradient sẽ bắt đầu bằng màu xanh lam và chuyển sang màu đỏ.

```css
div {
  --deg: -45deg;
  background-image: linear-gradient(abs(var(--deg)), blue, red);
}
```

### Phương án dự phòng tương thích ngược

Trong các trình duyệt không hỗ trợ hàm CSS `abs()`, bạn có thể sử dụng hàm CSS {{CSSxRef("max")}} để đạt được kết quả tương tự:

```css
p {
  line-height: max(var(--lh), -1 * var(--lh));
}
```

Chúng ta sử dụng hàm {{CSSxRef("max")}} để trả về giá trị lớn nhất (dương nhất) từ danh sách hai giá trị: `var(--lh)` hoặc `-1 * var(--lh)`. Bất kể `--lh` là dương hay âm, giá trị trả về được tính toán sẽ luôn dương, tức là một số tuyệt đối.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("sign")}}
