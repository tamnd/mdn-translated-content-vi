---
title: Math.fround()
short-title: fround()
slug: Web/JavaScript/Reference/Global_Objects/Math/fround
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.fround
sidebar: jsref
---

Phương thức tĩnh **`Math.fround()`** trả về biểu diễn số thực dấu phẩy động [32-bit độ chính xác đơn](https://en.wikipedia.org/wiki/Single-precision_floating-point_format) gần nhất của một số.

{{InteractiveExample("JavaScript Demo: Math.fround()")}}

```js interactive-example
console.log(Math.fround(5.5));
// Expected output: 5.5

console.log(Math.fround(5.05));
// Expected output: 5.050000190734863

console.log(Math.fround(5));
// Expected output: 5

console.log(Math.fround(-5.05));
// Expected output: -5.050000190734863
```

## Cú pháp

```js-nolint
Math.fround(doubleFloat)
```

### Tham số

- `doubleFloat`
  - : Một số.

### Giá trị trả về

Biểu diễn số thực dấu phẩy động [32-bit độ chính xác đơn](https://en.wikipedia.org/wiki/Single-precision_floating-point_format) gần nhất của `doubleFloat`.

## Mô tả

JavaScript sử dụng số thực dấu phẩy động 64-bit (double) nội bộ, cung cấp độ chính xác rất cao. Tuy nhiên, đôi khi bạn làm việc với số thực 32-bit, ví dụ khi đọc giá trị từ {{jsxref("Float32Array")}}. Điều này có thể gây nhầm lẫn: so sánh bằng giữa một số 64-bit và một số 32-bit có thể thất bại dù các số có vẻ giống nhau.

Để giải quyết vấn đề này, `Math.fround()` có thể chuyển đổi số 64-bit về số 32-bit. Nội bộ, JavaScript vẫn coi số đó là 64-bit, nhưng thực hiện "làm tròn chẵn" ở bit thứ 23 của phần định trị và đặt tất cả các bit định trị sau đó về `0`. Nếu số nằm ngoài phạm vi số thực 32-bit, trả về {{jsxref("Infinity")}} hoặc `-Infinity`.

Vì `fround()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.fround()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.fround()

Số 1.5 có thể biểu diễn chính xác trong hệ nhị phân, và giống nhau ở cả 32-bit và 64-bit:

```js
Math.fround(1.5); // 1.5
Math.fround(1.5) === 1.5; // true
```

Tuy nhiên, số 1.337 không thể biểu diễn chính xác trong hệ nhị phân, nên nó khác nhau ở 32-bit và 64-bit:

```js
Math.fround(1.337); // 1.3370000123977661
Math.fround(1.337) === 1.337; // false
```

<math><semantics><msup><mn>2</mn><mn>150</mn></msup><annotation encoding="TeX">2^150</annotation></semantics></math> quá lớn cho số thực 32-bit, nên trả về `Infinity`:

```js
2 ** 150; // 1.42724769270596e+45
Math.fround(2 ** 150); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.fround` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.fround`](https://www.npmjs.com/package/math.fround)
- {{jsxref("Math.round()")}}
