---
title: TypedArray.prototype.includes()
short-title: includes()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/includes
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.includes
sidebar: jsref
---

Phương thức **`includes()`** của các thực thể {{jsxref("TypedArray")}} xác định xem mảng được gõ kiểu có bao gồm một giá trị nhất định trong các mục của nó hay không, trả về `true` hoặc `false` tùy trường hợp. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.includes()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.includes()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);

console.log(uint8.includes(20));
// Expected output: true

// Check from position 3
console.log(uint8.includes(20, 3));
// Expected output: false
```

## Cú pháp

```js-nolint
includes(searchElement)
includes(searchElement, fromIndex)
```

### Tham số

- `searchElement`
  - : Giá trị cần tìm kiếm.
- `fromIndex` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu tìm kiếm, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).

### Giá trị trả về

Giá trị boolean là `true` nếu giá trị `searchElement` được tìm thấy trong mảng được gõ kiểu (hoặc phần mảng được gõ kiểu được chỉ ra bởi chỉ số `fromIndex`, nếu được chỉ định).

## Mô tả

Xem {{jsxref("Array.prototype.includes()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng includes()

```js
const uint8 = new Uint8Array([1, 2, 3]);
uint8.includes(2); // true
uint8.includes(4); // false
uint8.includes(3, 3); // false

// Xử lý NaN (chỉ liên quan đến mảng dấu phẩy động)
new Uint8Array([NaN]).includes(NaN); // false, vì NaN được truyền vào constructor được chuyển đổi thành 0
new Float32Array([NaN]).includes(NaN); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.includes` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.indexOf()")}}
- {{jsxref("TypedArray.prototype.find()")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
- {{jsxref("Array.prototype.includes()")}}
- {{jsxref("String.prototype.includes()")}}
