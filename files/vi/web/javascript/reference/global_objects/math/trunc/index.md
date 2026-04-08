---
title: Math.trunc()
short-title: trunc()
slug: Web/JavaScript/Reference/Global_Objects/Math/trunc
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.trunc
sidebar: jsref
---

Phương thức tĩnh **`Math.trunc()`** trả về phần nguyên của một số bằng cách loại bỏ các chữ số thập phân.

{{InteractiveExample("JavaScript Demo: Math.trunc()")}}

```js interactive-example
console.log(Math.trunc(13.37));
// Expected output: 13

console.log(Math.trunc(42.84));
// Expected output: 42

console.log(Math.trunc(0.123));
// Expected output: 0

console.log(Math.trunc(-0.123));
// Expected output: -0
```

## Cú pháp

```js-nolint
Math.trunc(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Phần nguyên của `x`.

## Mô tả

Cách hoạt động của `Math.trunc()` đơn giản hơn so với ba phương thức `Math` khác: {{jsxref("Math.floor()")}}, {{jsxref("Math.ceil()")}} và {{jsxref("Math.round()")}}; nó _cắt bỏ_ (loại bỏ) dấu thập phân và các chữ số bên phải nó, bất kể đối số là số dương hay âm.

Vì `trunc()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.trunc()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.trunc()

```js
Math.trunc(-Infinity); // -Infinity
Math.trunc("-1.123"); // -1
Math.trunc(-0.123); // -0
Math.trunc(-0); // -0
Math.trunc(0); // 0
Math.trunc(0.123); // 0
Math.trunc(13.37); // 13
Math.trunc(42.84); // 42
Math.trunc(Infinity); // Infinity
```

### Sử dụng toán tử bitwise để cắt bỏ phần thập phân

> [!WARNING]
> Đây không phải polyfill cho `Math.trunc()` vì có các trường hợp biên không thể bỏ qua.

Các phép toán bitwise chuyển đổi toán hạng sang số nguyên 32-bit, điều mà lập trình viên đã lợi dụng để cắt bỏ phần thập phân của số thực. Các kỹ thuật phổ biến bao gồm:

```js
const original = 3.14;
const truncated1 = ~~original; // Double negation
const truncated2 = original & -1; // Bitwise AND with -1
const truncated3 = original | 0; // Bitwise OR with 0
const truncated4 = original ^ 0; // Bitwise XOR with 0
const truncated5 = original >> 0; // Bitwise shifting by 0
```

Lưu ý rằng về bản chất đây là `toInt32`, không giống `Math.trunc`. Khi giá trị không thỏa -2<sup>31</sup> - 1 < `value` < 2<sup>31</sup> (-2147483649 < `value` < 2147483648), phép chuyển đổi sẽ tràn số.

```js
const a = ~~2147483648; // -2147483648
const b = ~~-2147483649; // 2147483647
const c = ~~4294967296; // 0
```

Chỉ dùng `~~` thay cho `Math.trunc()` khi bạn chắc chắn phạm vi đầu vào nằm trong phạm vi số nguyên 32-bit.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.trunc` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- {{jsxref("Math.abs()")}}
- {{jsxref("Math.ceil()")}}
- {{jsxref("Math.floor()")}}
- {{jsxref("Math.round()")}}
- {{jsxref("Math.sign()")}}
