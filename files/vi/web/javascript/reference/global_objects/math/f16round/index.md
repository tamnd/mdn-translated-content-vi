---
title: Math.f16round()
short-title: f16round()
slug: Web/JavaScript/Reference/Global_Objects/Math/f16round
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.f16round
sidebar: jsref
---

Phương thức tĩnh **`Math.f16round()`** trả về biểu diễn float [16-bit half precision](https://en.wikipedia.org/wiki/Half-precision_floating-point_format) gần nhất của một số.

{{InteractiveExample("JavaScript Demo: Math.f16round()")}}

```js interactive-example
console.log(Math.f16round(5.5));
// Expected output: 5.5

console.log(Math.f16round(5.05));
// Expected output: 5.05078125

console.log(Math.f16round(5));
// Expected output: 5

console.log(Math.f16round(-5.05));
// Expected output: -5.05078125
```

## Cú pháp

```js-nolint
Math.f16round(doubleFloat)
```

### Tham số

- `doubleFloat`
  - : Một số.

### Giá trị trả về

Biểu diễn float [16-bit half precision](https://en.wikipedia.org/wiki/Half-precision_floating-point_format) gần nhất của `doubleFloat`.

## Mô tả

`Math.f16round` là đối tác 16-bit của {{jsxref("Math.fround()")}}. Nó được thiết kế để làm mịn một số cạnh thô khi tương tác với các số float16, chẳng hạn khi đọc từ {{jsxref("Float16Array")}}. Bên trong, JavaScript vẫn xử lý số như một float 64-bit, nó chỉ thực hiện "round to even" trên bit thứ 10 của mantissa, và đặt tất cả các bit mantissa tiếp theo thành `0`. Nếu số nằm ngoài phạm vi của float 16-bit, {{jsxref("Infinity")}} hoặc `-Infinity` được trả về.

Vì `f16round()` là một phương thức tĩnh của `Math`, bạn luôn dùng nó là `Math.f16round()`, chứ không phải như một phương thức của đối tượng `Math` bạn tạo (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.f16round()

Số 1.5 có thể được biểu diễn chính xác trong hệ nhị phân, và giống nhau ở dạng 16-bit và 64-bit:

```js
Math.f16round(1.5); // 1.5
Math.f16round(1.5) === 1.5; // true
```

Tuy nhiên, số 1.337 không thể được biểu diễn chính xác trong hệ nhị phân, vì vậy nó khác nhau ở dạng 16-bit và 64-bit:

```js
Math.f16round(1.337); // 1.3369140625
Math.f16round(1.337) === 1.337; // false
```

100000 quá lớn so với float 16-bit, vì vậy `Infinity` được trả về:

```js
Math.f16round(100000); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Math.f16round` trong `core-js`](https://github.com/zloirock/core-js#float16-methods)
- [es-shims polyfill của `Math.f16round`](https://www.npmjs.com/package/math.f16round)
- {{jsxref("Math.fround()")}}
- {{jsxref("Math.round()")}}
