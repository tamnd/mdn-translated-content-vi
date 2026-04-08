---
title: sign()
slug: Web/CSS/Reference/Values/sign
page-type: css-function
browser-compat: css.types.sign
sidebar: cssref
---

Hàm **`sign()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm](/vi/docs/Web/CSS/Reference/Values/Functions) chứa một phép tính và trả về `-1` nếu giá trị số của đối số là âm, `+1` nếu giá trị số của đối số là dương, `0⁺` nếu giá trị số của đối số là 0⁺, và `0⁻` nếu giá trị số của đối số là 0⁻.

> [!NOTE]
> Trong khi {{CSSxRef("abs")}} trả về giá trị tuyệt đối của đối số, `sign()` trả về dấu của đối số.

## Cú pháp

```css
/* property: sign( expression ) */
top: sign(20vh - 100px);
```

### Tham số

Hàm `sign(x)` chỉ chấp nhận một giá trị làm tham số.

- `x`
  - : Một phép tính trả về một số.

### Giá trị trả về

Một số đại diện cho dấu của `A`:

- Nếu `x` là dương, trả về `1`.
- Nếu `x` là âm, trả về `-1`.
- Nếu `x` là số không dương, trả về `0`.
- Nếu `x` là số không âm, trả về `-0`.
- Trường hợp khác, trả về `NaN`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Vị trí ảnh nền

Ví dụ, trong {{cssxref("background-position")}}, các phần trăm dương trả về độ dài âm, và ngược lại, nếu ảnh nền lớn hơn vùng nền. Do đó `sign(10%)` có thể trả về `1` hoặc `-1`, tùy thuộc vào cách phần trăm được giải quyết! (Hoặc thậm chí `0`, nếu nó được giải quyết theo độ dài không.)

```css
div {
  background-position: sign(10%);
}
```

### Hướng vị trí

Một trường hợp sử dụng khác là kiểm soát {{cssxref("position")}} của phần tử. Giá trị có thể là dương hoặc âm.

```css
div {
  position: absolute;
  top: calc(100px * sign(var(--value)));
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("abs")}}
- [Sử dụng số học có kiểu CSS](/vi/docs/Web/CSS/Guides/Values_and_units/Using_typed_arithmetic)
