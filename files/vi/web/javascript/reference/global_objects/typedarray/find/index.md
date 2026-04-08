---
title: TypedArray.prototype.find()
short-title: find()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/find
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.find
sidebar: jsref
---

Phương thức **`find()`** của các thực thể {{jsxref("TypedArray")}} trả về phần tử đầu tiên trong mảng được gõ kiểu đã cung cấp thỏa mãn hàm kiểm tra đã cung cấp. Nếu không có giá trị nào thỏa mãn hàm kiểm tra, {{jsxref("undefined")}} được trả về. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.find()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.find()")}}

```js interactive-example
function isNegative(element, index, array) {
  return element < 0;
}

const int8 = new Int8Array([10, 0, -10, 20, -30, 40, -50]);

console.log(int8.find(isNegative));
// Expected output: -10
```

## Cú pháp

```js-nolint
find(callbackFn)
find(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Nó phải trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra đã tìm thấy phần tử khớp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `find()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Phần tử đầu tiên trong mảng được gõ kiểu thỏa mãn hàm kiểm tra đã cung cấp. Ngược lại, {{jsxref("undefined")}} được trả về.

## Mô tả

Xem {{jsxref("Array.prototype.find()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Tìm số nguyên tố đầu tiên trong mảng được gõ kiểu

Ví dụ sau trả về phần tử đầu tiên trong mảng được gõ kiểu là số nguyên tố, hoặc {{jsxref("undefined")}} nếu không có số nguyên tố.

```js
function isPrime(n) {
  if (n < 2) {
    return false;
  }
  if (n % 2 === 0) {
    return n === 2;
  }
  for (let factor = 3; factor * factor <= n; factor += 2) {
    if (n % factor === 0) {
      return false;
    }
  }
  return true;
}

const uint8 = new Uint8Array([4, 5, 8, 12]);
console.log(uint8.find(isPrime)); // 5
```

> [!NOTE]
> Cài đặt `isPrime()` chỉ dành cho mục đích minh họa. Trong ứng dụng thực tế, bạn nên sử dụng thuật toán được ghi nhớ nhiều như [Sàng Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.find` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
- {{jsxref("TypedArray.prototype.findLast()")}}
- {{jsxref("TypedArray.prototype.findLastIndex()")}}
- {{jsxref("TypedArray.prototype.includes()")}}
- {{jsxref("TypedArray.prototype.filter()")}}
- {{jsxref("TypedArray.prototype.every()")}}
- {{jsxref("TypedArray.prototype.some()")}}
- {{jsxref("Array.prototype.find()")}}
