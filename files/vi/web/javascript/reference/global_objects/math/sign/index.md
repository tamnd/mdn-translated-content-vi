---
title: Math.sign()
short-title: sign()
slug: Web/JavaScript/Reference/Global_Objects/Math/sign
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.sign
sidebar: jsref
---

Phương thức tĩnh **`Math.sign()`** trả về 1 hoặc -1, biểu thị dấu của số được truyền vào. Nếu đầu vào là 0 hoặc -0, nó sẽ được trả về nguyên vẹn.

{{InteractiveExample("JavaScript Demo: Math.sign()")}}

```js interactive-example
console.log(Math.sign(3));
// Expected output: 1

console.log(Math.sign(-3));
// Expected output: -1

console.log(Math.sign(0));
// Expected output: 0

console.log(Math.sign("-3"));
// Expected output: -1
```

## Cú pháp

```js-nolint
Math.sign(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Một số biểu thị dấu của `x`:

- Nếu `x` dương, trả về `1`.
- Nếu `x` âm, trả về `-1`.
- Nếu `x` là số không dương, trả về `0`.
- Nếu `x` là số không âm, trả về `-0`.
- Ngược lại, trả về {{jsxref("NaN")}}.

## Mô tả

Vì `sign()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.sign()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.sign()

```js
Math.sign(3); // 1
Math.sign(-3); // -1
Math.sign("-3"); // -1
Math.sign(0); // 0
Math.sign(-0); // -0
Math.sign(NaN); // NaN
Math.sign("foo"); // NaN
Math.sign(); // NaN
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.sign` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.sign`](https://www.npmjs.com/package/math.sign)
- {{jsxref("Math.abs()")}}
- {{jsxref("Math.ceil()")}}
- {{jsxref("Math.floor()")}}
- {{jsxref("Math.round()")}}
- {{jsxref("Math.trunc()")}}
