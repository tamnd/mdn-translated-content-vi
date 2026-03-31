---
title: TypedArray.prototype.indexOf()
short-title: indexOf()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/indexOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.indexOf
sidebar: jsref
---

Phương thức **`indexOf()`** của các thực thể {{jsxref("TypedArray")}} trả về chỉ số đầu tiên mà tại đó một phần tử nhất định có thể được tìm thấy trong mảng được gõ kiểu, hoặc -1 nếu không có. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.indexOf()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.indexOf()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);

console.log(uint8.indexOf(50));
// Expected output: 4

// From position 3
console.log(uint8.indexOf(20, 3));
// Expected output: -1

console.log(uint8.indexOf(51));
// Expected output: -1
```

## Cú pháp

```js-nolint
indexOf(searchElement)
indexOf(searchElement, fromIndex)
```

### Tham số

- `searchElement`
  - : Phần tử cần xác định vị trí trong mảng được gõ kiểu.
- `fromIndex` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu tìm kiếm, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).

### Giá trị trả về

Chỉ số đầu tiên của `searchElement` trong mảng được gõ kiểu; `-1` nếu không tìm thấy.

## Mô tả

Xem {{jsxref("Array.prototype.indexOf()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng indexOf()

```js
const uint8 = new Uint8Array([2, 5, 9]);
uint8.indexOf(2); // 0
uint8.indexOf(7); // -1
uint8.indexOf(9, 2); // 2
uint8.indexOf(2, -1); // -1
uint8.indexOf(2, -3); // 0
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.indexOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
- {{jsxref("TypedArray.prototype.findLastIndex()")}}
- {{jsxref("TypedArray.prototype.lastIndexOf()")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("String.prototype.indexOf()")}}
