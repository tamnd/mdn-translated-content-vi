---
title: TypedArray.prototype.forEach()
short-title: forEach()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/forEach
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.forEach
sidebar: jsref
---

Phương thức **`forEach()`** của các thực thể {{jsxref("TypedArray")}} thực thi một hàm đã cung cấp một lần cho mỗi phần tử trong mảng được gõ kiểu. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.forEach()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.forEach()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30]);

uint8.forEach((element) => console.log(element));

// Expected output: 10
// Expected output: 20
// Expected output: 30
```

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Giá trị trả về của nó bị bỏ qua. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `forEach()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Mô tả

Xem {{jsxref("Array.prototype.forEach()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Ghi log nội dung của mảng được gõ kiểu

Đoạn mã sau ghi một dòng cho mỗi phần tử trong mảng được gõ kiểu:

```js
function logArrayElements(element, index, array) {
  console.log(`a[${index}] = ${element}`);
}

new Uint8Array([0, 1, 2, 3]).forEach(logArrayElements);
// Logs:
// a[0] = 0
// a[1] = 1
// a[2] = 2
// a[3] = 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.forEach` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.find()")}}
- {{jsxref("TypedArray.prototype.map()")}}
- {{jsxref("TypedArray.prototype.filter()")}}
- {{jsxref("TypedArray.prototype.every()")}}
- {{jsxref("TypedArray.prototype.some()")}}
- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Map.prototype.forEach()")}}
- {{jsxref("Set.prototype.forEach()")}}
