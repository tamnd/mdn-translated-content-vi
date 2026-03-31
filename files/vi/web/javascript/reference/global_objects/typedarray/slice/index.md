---
title: TypedArray.prototype.slice()
short-title: slice()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/slice
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.slice
sidebar: jsref
---

Phương thức **`slice()`** của các thực thể {{jsxref("TypedArray")}} trả về một bản sao của một phần mảng được gõ kiểu vào một đối tượng mảng được gõ kiểu mới được chọn từ `start` đến `end` (không bao gồm `end`) trong đó `start` và `end` đại diện cho chỉ số của các mục trong mảng được gõ kiểu đó. Mảng được gõ kiểu ban đầu sẽ không bị sửa đổi. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.slice()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.slice()", "shorter")}}

```js interactive-example
const bytes = new Uint8Array([10, 20, 30, 40, 50]);
const byteSlice = bytes.slice(1, 3);

console.log(byteSlice);
// Expected output: Uint8Array [20, 30]
```

## Cú pháp

```js-nolint
slice()
slice(start)
slice(start, end)
```

### Tham số

- `start` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu trích xuất, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
- `end` {{optional_inline}}
  - : Chỉ số dựa trên 0 để kết thúc trích xuất, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `slice()` trích xuất đến nhưng không bao gồm `end`.

### Giá trị trả về

Một mảng được gõ kiểu mới chứa các phần tử được trích xuất.

## Mô tả

Xem {{jsxref("Array.prototype.slice()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Trả về một phần của mảng được gõ kiểu hiện có

```js
const bytes = new Uint8Array([1, 2, 3]);
bytes.slice(1); // Uint8Array [ 2, 3 ]
bytes.slice(2); // Uint8Array [ 3 ]
bytes.slice(-2); // Uint8Array [ 2, 3 ]
bytes.slice(0, 1); // Uint8Array [ 1 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.slice` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- [es-shims polyfill của `TypedArray.prototype.slice`](https://www.npmjs.com/package/typedarray.prototype.slice)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("Array.prototype.slice()")}}
- {{jsxref("String.prototype.slice()")}}
