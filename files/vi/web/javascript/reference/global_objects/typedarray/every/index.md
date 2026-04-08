---
title: TypedArray.prototype.every()
short-title: every()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/every
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.every
sidebar: jsref
---

Phương thức **`every()`** của các thực thể {{jsxref("TypedArray")}} trả về `false` nếu tìm thấy một phần tử trong mảng không thỏa mãn hàm kiểm tra đã cung cấp. Nếu không, nó trả về `true`. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.every()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.every()")}}

```js interactive-example
function isNegative(element, index, array) {
  return element < 0;
}

const int8 = new Int8Array([-10, -20, -30, -40, -50]);

console.log(int8.every(isNegative));
// Expected output: true
```

## Cú pháp

```js-nolint
every(callbackFn)
every(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Nó phải trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra phần tử đó qua kiểm tra, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `every()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

`true` trừ khi `callbackFn` trả về một giá trị {{Glossary("falsy")}} cho một phần tử mảng được gõ kiểu, trong trường hợp đó `false` sẽ được trả về ngay lập tức.

## Mô tả

Xem {{jsxref("Array.prototype.every()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Kiểm tra kích thước của tất cả phần tử trong mảng được gõ kiểu

Ví dụ sau kiểm tra xem tất cả các phần tử trong mảng được gõ kiểu có phải là 10 hoặc lớn hơn không.

```js
function isBigEnough(element, index, array) {
  return element >= 10;
}
new Uint8Array([12, 5, 8, 130, 44]).every(isBigEnough); // false
new Uint8Array([12, 54, 18, 130, 44]).every(isBigEnough); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.every` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.forEach()")}}
- {{jsxref("TypedArray.prototype.some()")}}
- {{jsxref("TypedArray.prototype.find()")}}
- {{jsxref("Array.prototype.every()")}}
