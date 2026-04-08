---
title: Math.abs()
short-title: abs()
slug: Web/JavaScript/Reference/Global_Objects/Math/abs
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.abs
sidebar: jsref
---

Phương thức tĩnh **`Math.abs()`** trả về giá trị tuyệt đối của một số.

{{InteractiveExample("JavaScript Demo: Math.abs()")}}

```js interactive-example
function difference(a, b) {
  return Math.abs(a - b);
}

console.log(difference(3, 5));
// Expected output: 2

console.log(difference(5, 3));
// Expected output: 2

console.log(difference(1.23456, 7.89012));
// Expected output: 6.6555599999999995
```

## Cú pháp

```js-nolint
Math.abs(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Giá trị tuyệt đối của `x`. Nếu `x` âm hoặc là `-0`, trả về số đối `-x` (là số không âm). Ngược lại, trả về chính `x`. Kết quả luôn là một số dương hoặc `0`.

## Mô tả

Vì `abs()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.abs()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.abs()

```js
Math.abs(-Infinity); // Infinity
Math.abs(-1); // 1
Math.abs(-0); // 0
Math.abs(0); // 0
Math.abs(1); // 1
Math.abs(Infinity); // Infinity
```

### Ép kiểu tham số

`Math.abs()` [ép kiểu tham số về dạng số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Các giá trị không thể ép kiểu sẽ trở thành `NaN`, khiến `Math.abs()` cũng trả về `NaN`.

```js
Math.abs("-1"); // 1
Math.abs(-2); // 2
Math.abs(null); // 0
Math.abs(""); // 0
Math.abs([]); // 0
Math.abs([2]); // 2
Math.abs([1, 2]); // NaN
Math.abs({}); // NaN
Math.abs("string"); // NaN
Math.abs(); // NaN
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.ceil()")}}
- {{jsxref("Math.floor()")}}
- {{jsxref("Math.round()")}}
- {{jsxref("Math.sign()")}}
- {{jsxref("Math.trunc()")}}
