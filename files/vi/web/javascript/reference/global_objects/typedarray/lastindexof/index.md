---
title: TypedArray.prototype.lastIndexOf()
short-title: lastIndexOf()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/lastIndexOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.lastIndexOf
sidebar: jsref
---

Phương thức **`lastIndexOf()`** của các thực thể {{jsxref("TypedArray")}} trả về chỉ số cuối cùng mà tại đó một phần tử nhất định có thể được tìm thấy trong mảng được gõ kiểu, hoặc -1 nếu không có. Mảng được gõ kiểu được tìm kiếm ngược, bắt đầu từ `fromIndex`. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.lastIndexOf()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.lastIndexOf()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 50, 50, 50, 60]);

console.log(uint8.lastIndexOf(50, 5));
// Expected output: 4

console.log(uint8.lastIndexOf(50, 3));
// Expected output: 3
```

## Cú pháp

```js-nolint
lastIndexOf(searchElement)
lastIndexOf(searchElement, fromIndex)
```

### Tham số

- `searchElement`
  - : Phần tử cần xác định vị trí trong mảng được gõ kiểu.
- `fromIndex` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu tìm kiếm ngược, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).

### Giá trị trả về

Chỉ số cuối cùng của `searchElement` trong mảng được gõ kiểu; `-1` nếu không tìm thấy.

## Mô tả

Xem {{jsxref("Array.prototype.lastIndexOf()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng lastIndexOf()

```js
const uint8 = new Uint8Array([2, 5, 9, 2]);
uint8.lastIndexOf(2); // 3
uint8.lastIndexOf(7); // -1
uint8.lastIndexOf(2, 3); // 3
uint8.lastIndexOf(2, 2); // 0
uint8.lastIndexOf(2, -2); // 0
uint8.lastIndexOf(2, -1); // 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.lastIndexOf` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
- {{jsxref("TypedArray.prototype.findLastIndex()")}}
- {{jsxref("TypedArray.prototype.indexOf()")}}
- {{jsxref("Array.prototype.lastIndexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
