---
title: TypedArray.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.toString
sidebar: jsref
---

Phương thức **`toString()`** của các thực thể {{jsxref("TypedArray")}} trả về một chuỗi biểu diễn mảng được gõ kiểu được chỉ định và các phần tử của nó. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.toString()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.toString()", "shorter")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);

const uint8String = uint8.toString();

console.log(uint8String.startsWith("10"));
// Expected output: true
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Chuỗi biểu diễn các phần tử của mảng được gõ kiểu.

## Mô tả

Xem {{jsxref("Array.prototype.toString()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Chuyển đổi mảng được gõ kiểu thành chuỗi

```js
const uint8 = new Uint8Array([1, 2, 3]);
// Chuyển đổi rõ ràng
console.log(uint8.toString()); // 1,2,3
// Chuyển đổi ngầm định
console.log(`${uint8}`); // 1,2,3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.join()")}}
- {{jsxref("TypedArray.prototype.toLocaleString()")}}
- {{jsxref("Array.prototype.toString()")}}
- {{jsxref("String.prototype.toString()")}}
