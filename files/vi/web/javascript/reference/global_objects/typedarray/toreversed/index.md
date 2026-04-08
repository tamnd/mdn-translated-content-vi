---
title: TypedArray.prototype.toReversed()
short-title: toReversed()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/toReversed
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.toReversed
sidebar: jsref
---

Phương thức **`toReversed()`** của các thực thể {{jsxref("TypedArray")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) tương ứng với phương thức {{jsxref("TypedArray/reverse", "reverse()")}}. Nó trả về một mảng được gõ kiểu mới với các phần tử theo thứ tự ngược lại. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.toReversed()")}}.

## Cú pháp

```js-nolint
toReversed()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng được gõ kiểu mới chứa các phần tử theo thứ tự ngược lại.

## Mô tả

Xem {{jsxref("Array.prototype.toReversed()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng toReversed()

```js
const uint8 = new Uint8Array([1, 2, 3]);
const reversedUint8 = uint8.toReversed();
console.log(reversedUint8); // Uint8Array [3, 2, 1]
console.log(uint8); // Uint8Array [1, 2, 3]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.toReversed` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray.prototype.reverse()")}}
- {{jsxref("TypedArray.prototype.toSorted()")}}
- {{jsxref("TypedArray.prototype.with()")}}
- {{jsxref("Array.prototype.toReversed()")}}
