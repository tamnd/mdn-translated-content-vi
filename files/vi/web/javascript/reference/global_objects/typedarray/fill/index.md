---
title: TypedArray.prototype.fill()
short-title: fill()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/fill
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.fill
sidebar: jsref
---

Phương thức **`fill()`** của các thực thể {{jsxref("TypedArray")}} thay đổi tất cả các phần tử trong một phạm vi chỉ số trong mảng được gõ kiểu thành một giá trị tĩnh. Nó trả về mảng được gõ kiểu đã sửa đổi. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.fill()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.fill()", "shorter")}}

```js interactive-example
const uint8 = new Uint8Array([0, 0, 0, 0]);
// Value, start position, end position
uint8.fill(4, 1, 3);

console.log(uint8);
// Expected output: Uint8Array [0, 4, 4, 0]
```

## Cú pháp

```js-nolint
fill(value)
fill(value, start)
fill(value, start, end)
```

### Tham số

- `value`
  - : Giá trị để lấp đầy mảng được gõ kiểu.
- `start` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu lấp đầy, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
- `end` {{optional_inline}}
  - : Chỉ số dựa trên 0 để kết thúc lấp đầy, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `fill()` lấp đầy đến nhưng không bao gồm `end`.

### Giá trị trả về

Mảng được gõ kiểu đã sửa đổi, được lấp đầy bằng `value`.

## Mô tả

Xem {{jsxref("Array.prototype.fill()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng fill()

```js
new Uint8Array([1, 2, 3]).fill(4); // Uint8Array [4, 4, 4]
new Uint8Array([1, 2, 3]).fill(4, 1); // Uint8Array [1, 4, 4]
new Uint8Array([1, 2, 3]).fill(4, 1, 2); // Uint8Array [1, 4, 3]
new Uint8Array([1, 2, 3]).fill(4, 1, 1); // Uint8Array [1, 2, 3]
new Uint8Array([1, 2, 3]).fill(4, -3, -2); // Uint8Array [4, 2, 3]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.fill` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("Array.prototype.fill()")}}
