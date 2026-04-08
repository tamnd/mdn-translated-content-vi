---
title: Math.pow()
short-title: pow()
slug: Web/JavaScript/Reference/Global_Objects/Math/pow
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.pow
sidebar: jsref
---

Phương thức tĩnh **`Math.pow()`** trả về giá trị của một cơ số lũy thừa một số mũ. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mrow><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚙𝚘𝚠</mo><mo stretchy="false">(</mo><mi>𝚡</mi><mo>,</mo><mi>𝚢</mi><mo stretchy="false">)</mo></mrow><mo>=</mo><msup><mi>x</mi><mi>y</mi></msup></mrow><annotation encoding="TeX">\mathtt{\operatorname{Math.pow}(x, y)} = x^y</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.pow()")}}

```js interactive-example
console.log(Math.pow(7, 3));
// Expected output: 343

console.log(Math.pow(4, 0.5));
// Expected output: 2

console.log(Math.pow(7, -2));
// Expected output: 0.02040816326530612
//                  (1/49)

console.log(Math.pow(-7, 0.5));
// Expected output: NaN
```

## Cú pháp

```js-nolint
Math.pow(base, exponent)
```

### Tham số

- `base`
  - : Số cơ số.
- `exponent`
  - : Số mũ.

### Giá trị trả về

Một số biểu thị `base` lũy thừa `exponent`. Trả về {{jsxref("NaN")}} trong các trường hợp sau:

- `exponent` là `NaN`.
- `base` là `NaN` và `exponent` khác `0`.
- `base` là ±1 và `exponent` là ±`Infinity`.
- `base < 0` và `exponent` không phải số nguyên.

## Mô tả

`Math.pow()` tương đương với toán tử [`**`](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation), ngoại trừ `Math.pow()` chỉ chấp nhận số.

`Math.pow(NaN, 0)` (và tương đương `NaN ** 0`) là trường hợp duy nhất mà {{jsxref("NaN")}} không lan truyền qua các phép tính toán học — trả về `1` dù toán hạng là `NaN`. Ngoài ra, hành vi khi `base` là 1 và `exponent` là vô hạn (±Infinity hoặc `NaN`) khác với IEEE 754, vốn quy định kết quả phải là 1, trong khi JavaScript trả về `NaN` để giữ tương thích ngược với hành vi ban đầu.

Vì `pow()` là một phương thức tĩnh của `Math`, hãy dùng nó dưới dạng `Math.pow()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.pow()

```js
// Basic cases
Math.pow(7, 2); // 49
Math.pow(7, 3); // 343
Math.pow(2, 10); // 1024

// Fractional exponents
Math.pow(4, 0.5); // 2 (square root of 4)
Math.pow(8, 1 / 3); // 2 (cube root of 8)
Math.pow(2, 0.5); // 1.4142135623730951 (square root of 2)
Math.pow(2, 1 / 3); // 1.2599210498948732 (cube root of 2)

// Signed exponents
Math.pow(7, -2); // 0.02040816326530612 (1/49)
Math.pow(8, -1 / 3); // 0.5

// Signed bases
Math.pow(-7, 2); // 49 (squares are positive)
Math.pow(-7, 3); // -343 (cubes can be negative)
Math.pow(-7, 0.5); // NaN (negative numbers don't have a real square root)
// Due to "even" and "odd" roots laying close to each other,
// and limits in the floating number precision,
// negative bases with fractional exponents always return NaN,
// even when the mathematical result is real
Math.pow(-7, 1 / 3); // NaN

// Zero and infinity
Math.pow(0, 0); // 1 (anything ** ±0 is 1)
Math.pow(Infinity, 0.1); // Infinity (positive exponent)
Math.pow(Infinity, -1); // 0 (negative exponent)
Math.pow(-Infinity, 1); // -Infinity (positive odd integer exponent)
Math.pow(-Infinity, 1.5); // Infinity (positive exponent)
Math.pow(-Infinity, -1); // -0 (negative odd integer exponent)
Math.pow(-Infinity, -1.5); // 0 (negative exponent)
Math.pow(0, 1); // 0 (positive exponent)
Math.pow(0, -1); // Infinity (negative exponent)
Math.pow(-0, 1); // -0 (positive odd integer exponent)
Math.pow(-0, 1.5); // 0 (positive exponent)
Math.pow(-0, -1); // -Infinity (negative odd integer exponent)
Math.pow(-0, -1.5); // Infinity (negative exponent)
Math.pow(0.9, Infinity); // 0
Math.pow(1, Infinity); // NaN
Math.pow(1.1, Infinity); // Infinity
Math.pow(0.9, -Infinity); // Infinity
Math.pow(1, -Infinity); // NaN
Math.pow(1.1, -Infinity); // 0

// NaN: only Math.pow(NaN, 0) does not result in NaN
Math.pow(NaN, 0); // 1
Math.pow(NaN, 1); // NaN
Math.pow(1, NaN); // NaN
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.cbrt()")}}
- {{jsxref("Math.exp()")}}
- {{jsxref("Math.log()")}}
- {{jsxref("Math.sqrt()")}}
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
