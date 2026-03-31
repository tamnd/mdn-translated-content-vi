---
title: TypedArray.prototype.toSorted()
short-title: toSorted()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/toSorted
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.toSorted
sidebar: jsref
---

Phương thức **`toSorted()`** của các thực thể {{jsxref("TypedArray")}} là phiên bản [sao chép](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods) của phương thức {{jsxref("TypedArray/sort", "sort()")}}. Nó trả về một mảng được gõ kiểu mới với các phần tử được sắp xếp theo thứ tự tăng dần. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.toSorted()")}}, ngoại trừ nó sắp xếp các giá trị theo số thay vì theo chuỗi theo mặc định.

## Cú pháp

```js-nolint
toSorted()
toSorted(compareFn)
```

### Tham số

- `compareFn` {{optional_inline}}
  - : Hàm xác định thứ tự của các phần tử. Nếu bị bỏ qua, các phần tử mảng được gõ kiểu được sắp xếp theo giá trị số. Xem {{jsxref("TypedArray/sort", "sort()")}} để biết thêm thông tin.

### Giá trị trả về

Một mảng được gõ kiểu mới với các phần tử được sắp xếp theo thứ tự tăng dần.

## Mô tả

Xem {{jsxref("Array.prototype.toSorted()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sắp xếp một mảng

Để biết thêm ví dụ, hãy xem phương thức {{jsxref("Array.prototype.sort()")}}.

```js
const numbers = new Uint8Array([40, 1, 5, 200]);
const numberSorted = numbers.toSorted();
console.log(numberSorted); // Uint8Array [ 1, 5, 40, 200 ]
// Không giống như các mảng thông thường, không cần hàm so sánh
// để sắp xếp các số theo thứ tự số.
console.log(numbers); // Uint8Array [ 40, 1, 5, 200 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.toSorted` trong `core-js`](https://github.com/zloirock/core-js#change-array-by-copy)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray.prototype.sort()")}}
- {{jsxref("TypedArray.prototype.toReversed()")}}
- {{jsxref("TypedArray.prototype.with()")}}
- {{jsxref("Array.prototype.toSorted()")}}
