---
title: TypedArray.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.with
sidebar: jsref
---

Phương thức **`with()`** của các thực thể {{jsxref("TypedArray")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) của việc sử dụng [ký hiệu ngoặc](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation) để thay đổi giá trị của một chỉ số đã cho. Nó trả về một mảng được gõ kiểu mới với phần tử tại chỉ số đã cho được thay thế bằng giá trị đã cho. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.with()")}}.

## Cú pháp

```js-nolint
arrayInstance.with(index, value)
```

### Tham số

- `index`
  - : Chỉ số dựa trên 0 để thay đổi mảng được gõ kiểu, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
- `value`
  - : Bất kỳ giá trị nào được gán cho chỉ số đã cho.

### Giá trị trả về

Một mảng được gõ kiểu mới với phần tử tại `index` được thay thế bằng `value`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `index >= array.length` hoặc `index < -array.length`.

## Mô tả

Xem {{jsxref("Array.prototype.with()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng with()

```js
const arr = new Uint8Array([1, 2, 3, 4, 5]);
console.log(arr.with(2, 6)); // Uint8Array [1, 2, 6, 4, 5]
console.log(arr); // Uint8Array [1, 2, 3, 4, 5]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.with` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray.prototype.toReversed()")}}
- {{jsxref("TypedArray.prototype.toSorted()")}}
- {{jsxref("TypedArray.prototype.at()")}}
- {{jsxref("Array.prototype.with()")}}
