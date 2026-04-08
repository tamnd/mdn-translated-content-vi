---
title: TypedArray.prototype.findLastIndex()
short-title: findLastIndex()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/findLastIndex
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.findLastIndex
sidebar: jsref
---

Phương thức **`findLastIndex()`** của các thực thể {{jsxref("TypedArray")}} lặp qua mảng được gõ kiểu theo thứ tự ngược và trả về chỉ số của phần tử đầu tiên thỏa mãn hàm kiểm tra đã cung cấp. Nếu không có phần tử nào thỏa mãn hàm kiểm tra, -1 được trả về. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.findLastIndex()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.findLastIndex()")}}

```js interactive-example
function isNegative(element /*, index, array */) {
  return element < 0;
}

const int8 = new Int8Array([10, -20, 30, -40, 50]);

console.log(int8.findLastIndex(isNegative));
// Expected output: 3
```

## Cú pháp

```js-nolint
findLastIndex(callbackFn)
findLastIndex(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Nó phải trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra đã tìm thấy phần tử khớp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `findLastIndex()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Chỉ số của phần tử cuối cùng (chỉ số cao nhất) trong mảng được gõ kiểu qua được bài kiểm tra. Ngược lại `-1` nếu không tìm thấy phần tử khớp.

## Mô tả

Xem {{jsxref("Array.prototype.findLastIndex()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Tìm chỉ số của số nguyên tố cuối cùng trong mảng được gõ kiểu

Ví dụ sau trả về chỉ số của phần tử cuối cùng trong mảng được gõ kiểu là số nguyên tố, hoặc `-1` nếu không có số nguyên tố.

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

let uint8 = new Uint8Array([4, 6, 8, 12]);
console.log(uint8.findLastIndex(isPrime));
// -1 (no primes in array)
uint8 = new Uint8Array([4, 5, 7, 8, 9, 11, 12]);
console.log(uint8.findLastIndex(isPrime));
// 5
```

> [!NOTE]
> Cài đặt `isPrime()` chỉ dành cho mục đích minh họa. Trong ứng dụng thực tế, bạn nên sử dụng thuật toán được ghi nhớ nhiều như [Sàng Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.findLastIndex` trong `core-js`](https://github.com/zloirock/core-js#array-find-from-last)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.find()")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
- {{jsxref("TypedArray.prototype.findLast()")}}
- {{jsxref("TypedArray.prototype.indexOf()")}}
- {{jsxref("TypedArray.prototype.lastIndexOf()")}}
- {{jsxref("Array.prototype.findLastIndex()")}}
