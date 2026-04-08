---
title: TypedArray.prototype.filter()
short-title: filter()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/filter
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.filter
sidebar: jsref
---

Phương thức **`filter()`** của các thực thể {{jsxref("TypedArray")}} tạo ra một bản sao của một phần mảng được gõ kiểu đã cho, được lọc xuống chỉ còn các phần tử từ mảng được gõ kiểu đã cho qua được bài kiểm tra được thực hiện bởi hàm đã cung cấp. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.filter()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.filter()")}}

```js interactive-example
function isNegative(element, index, array) {
  return element < 0;
}

const int8 = new Int8Array([-10, 20, -30, 40, -50]);
const negInt8 = int8.filter(isNegative);

console.log(negInt8);
// Expected output: Int8Array [-10, -30, -50]
```

## Cú pháp

```js-nolint
filter(callbackFn)
filter(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Nó phải trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để giữ phần tử trong mảng được gõ kiểu kết quả, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) nếu không. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `filter()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Một bản sao của mảng được gõ kiểu đã cho chỉ chứa các phần tử qua được bài kiểm tra. Nếu không có phần tử nào qua bài kiểm tra, một mảng được gõ kiểu rỗng được trả về.

## Mô tả

Xem {{jsxref("Array.prototype.filter()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Lọc ra tất cả các giá trị nhỏ

Ví dụ sau sử dụng `filter()` để tạo một mảng được gõ kiểu đã lọc loại bỏ tất cả các phần tử có giá trị nhỏ hơn 10.

```js
function isBigEnough(element, index, array) {
  return element >= 10;
}
new Uint8Array([12, 5, 8, 130, 44]).filter(isBigEnough);
// Uint8Array [ 12, 130, 44 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.filter` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.forEach()")}}
- {{jsxref("TypedArray.prototype.every()")}}
- {{jsxref("TypedArray.prototype.map()")}}
- {{jsxref("TypedArray.prototype.some()")}}
- {{jsxref("TypedArray.prototype.reduce()")}}
- {{jsxref("Array.prototype.filter()")}}
