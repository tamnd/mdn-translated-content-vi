---
title: Math.ceil()
short-title: ceil()
slug: Web/JavaScript/Reference/Global_Objects/Math/ceil
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.ceil
sidebar: jsref
---

Phương thức tĩnh **`Math.ceil()`** luôn làm tròn lên và trả về số nguyên nhỏ nhất lớn hơn hoặc bằng số đã cho.

{{InteractiveExample("JavaScript Demo: Math.ceil()")}}

```js interactive-example
console.log(Math.ceil(0.95));
// Expected output: 1

console.log(Math.ceil(4));
// Expected output: 4

console.log(Math.ceil(7.004));
// Expected output: 8

console.log(Math.ceil(-7.004));
// Expected output: -7
```

## Cú pháp

```js-nolint
Math.ceil(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Số nguyên nhỏ nhất lớn hơn hoặc bằng `x`. Kết quả này tương đương với [`-Math.floor(-x)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor).

## Mô tả

Vì `ceil()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.ceil()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.ceil()

```js
Math.ceil(-Infinity); // -Infinity
Math.ceil(-7.004); // -7
Math.ceil(-4); // -4
Math.ceil(-0.95); // -0
Math.ceil(-0); // -0
Math.ceil(0); // 0
Math.ceil(0.95); // 1
Math.ceil(4); // 4
Math.ceil(7.004); // 8
Math.ceil(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.abs()")}}
- {{jsxref("Math.floor()")}}
- {{jsxref("Math.round()")}}
- {{jsxref("Math.sign()")}}
- {{jsxref("Math.trunc()")}}
