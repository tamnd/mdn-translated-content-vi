---
title: TypedArray.prototype.findIndex()
short-title: findIndex()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/findIndex
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.findIndex
sidebar: jsref
---

Phương thức **`findIndex()`** của các thực thể {{jsxref("TypedArray")}} trả về chỉ số của phần tử đầu tiên trong mảng được gõ kiểu thỏa mãn hàm kiểm tra đã cung cấp. Nếu không có phần tử nào thỏa mãn hàm kiểm tra, -1 được trả về. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.findIndex()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.findIndex()")}}

```js interactive-example
function isNegative(element, index, array) {
  return element < 0;
}

const int8 = new Int8Array([10, -20, 30, -40, 50]);

console.log(int8.findIndex(isNegative));
// Expected output: 1
```

## Cú pháp

```js-nolint
findIndex(callbackFn)
findIndex(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Nó phải trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ ra đã tìm thấy phần tử khớp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `findIndex()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Chỉ số của phần tử đầu tiên trong mảng được gõ kiểu qua được bài kiểm tra. Ngược lại, `-1`.

## Mô tả

Xem {{jsxref("Array.prototype.findIndex()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Tìm chỉ số của số nguyên tố đầu tiên trong mảng được gõ kiểu

Ví dụ sau trả về chỉ số của phần tử đầu tiên trong mảng được gõ kiểu là số nguyên tố, hoặc `-1` nếu không có số nguyên tố.

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

const uint8 = new Uint8Array([4, 6, 8, 12]);
const uint16 = new Uint16Array([4, 6, 7, 12]);

console.log(uint8.findIndex(isPrime)); // -1, not found
console.log(uint16.findIndex(isPrime)); // 2
```

> [!NOTE]
> Cài đặt `isPrime()` chỉ dành cho mục đích minh họa. Trong ứng dụng thực tế, bạn nên sử dụng thuật toán được ghi nhớ nhiều như [Sàng Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.findIndex` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.find()")}}
- {{jsxref("TypedArray.prototype.findLast()")}}
- {{jsxref("TypedArray.prototype.findLastIndex()")}}
- {{jsxref("TypedArray.prototype.indexOf()")}}
- {{jsxref("TypedArray.prototype.lastIndexOf()")}}
- {{jsxref("Array.prototype.findIndex()")}}
