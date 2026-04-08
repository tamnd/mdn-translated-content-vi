---
title: TypedArray.prototype.copyWithin()
short-title: copyWithin()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/copyWithin
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.copyWithin
sidebar: jsref
---

Phương thức **`copyWithin()`** của các thực thể {{jsxref("TypedArray")}} sao chép nông một phần của mảng được gõ kiểu này sang vị trí khác trong cùng mảng được gõ kiểu và trả về mảng được gõ kiểu này mà không sửa đổi độ dài của nó. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.copyWithin()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.copyWithin()")}}

```js interactive-example
const uint8 = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]);

// Insert position, start position, end position
uint8.copyWithin(3, 1, 3);

console.log(uint8);
// Expected output: Uint8Array [1, 2, 3, 2, 3, 6, 7, 8]
```

## Cú pháp

```js-nolint
copyWithin(target, start)
copyWithin(target, start, end)
```

### Tham số

- `target`
  - : Chỉ số dựa trên 0 mà chuỗi sẽ được sao chép đến, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). Đây là nơi phần tử tại `start` sẽ được sao chép đến, và tất cả các phần tử giữa `start` và `end` được sao chép đến các chỉ số tiếp theo.
- `start`
  - : Chỉ số dựa trên 0 để bắt đầu sao chép các phần tử từ đó, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
- `end` {{optional_inline}}
  - : Chỉ số dựa trên 0 để kết thúc việc sao chép các phần tử, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `copyWithin()` sao chép đến nhưng không bao gồm `end`.

### Giá trị trả về

Mảng được gõ kiểu đã được sửa đổi.

## Mô tả

Xem {{jsxref("Array.prototype.copyWithin()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng copyWithin()

```js
const buffer = new ArrayBuffer(8);
const uint8 = new Uint8Array(buffer);
uint8.set([1, 2, 3]);
console.log(uint8); // Uint8Array [ 1, 2, 3, 0, 0, 0, 0, 0 ]
uint8.copyWithin(3, 0, 3);
console.log(uint8); // Uint8Array [ 1, 2, 3, 1, 2, 3, 0, 0 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.copyWithin` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("Array.prototype.copyWithin()")}}
