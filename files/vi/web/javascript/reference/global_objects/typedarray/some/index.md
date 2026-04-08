---
title: TypedArray.prototype.some()
short-title: some()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/some
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.some
sidebar: jsref
---

Phương thức **`some()`** của các thực thể {{jsxref("TypedArray")}} trả về `true` nếu tìm thấy một phần tử trong mảng thỏa mãn hàm kiểm tra đã cung cấp. Nếu không, nó trả về `false`. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.some()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.some()")}}

```js interactive-example
function isNegative(element, index, array) {
  return element < 0;
}

const int8 = new Int8Array([-10, 20, -30, 40, -50]);
const positives = new Int8Array([10, 20, 30, 40, 50]);

console.log(int8.some(isNegative));
// Expected output: true

console.log(positives.some(isNegative));
// Expected output: false
```

## Cú pháp

```js-nolint
some(callbackFn)
some(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Nó phải trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra phần tử đó qua kiểm tra, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `some()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

`false` trừ khi `callbackFn` trả về một giá trị {{Glossary("truthy")}} cho một phần tử mảng được gõ kiểu, trong trường hợp đó `true` sẽ được trả về ngay lập tức.

## Mô tả

Xem {{jsxref("Array.prototype.some()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Kiểm tra kích thước của tất cả phần tử trong mảng được gõ kiểu

Ví dụ sau kiểm tra xem bất kỳ phần tử nào trong mảng được gõ kiểu có lớn hơn 10 không.

```js
function isBiggerThan10(element, index, array) {
  return element > 10;
}
new Uint8Array([2, 5, 8, 1, 4]).some(isBiggerThan10); // false
new Uint8Array([12, 5, 8, 1, 4]).some(isBiggerThan10); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.some` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.every()")}}
- {{jsxref("TypedArray.prototype.forEach()")}}
- {{jsxref("TypedArray.prototype.find()")}}
- {{jsxref("TypedArray.prototype.includes()")}}
- {{jsxref("Array.prototype.some()")}}
