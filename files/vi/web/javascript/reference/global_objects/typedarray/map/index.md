---
title: TypedArray.prototype.map()
short-title: map()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/map
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.map
sidebar: jsref
---

Phương thức **`map()`** của các thực thể {{jsxref("TypedArray")}} tạo một mảng được gõ kiểu mới được điền với kết quả của việc gọi một hàm đã cung cấp trên mỗi phần tử trong mảng được gõ kiểu đang gọi. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.map()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.map()", "shorter")}}

```js interactive-example
const uint8 = new Uint8Array([25, 36, 49]);
const roots = uint8.map(Math.sqrt);

console.log(roots);
// Expected output: Uint8Array [5, 6, 7]
```

## Cú pháp

```js-nolint
map(callbackFn)
map(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng được gõ kiểu. Giá trị trả về của nó được thêm vào như một phần tử đơn trong mảng được gõ kiểu mới. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng được gõ kiểu.
    - `array`
      - : Mảng được gõ kiểu mà `map()` đã được gọi trên.
- `thisArg` {{optional_inline}}
  - : Giá trị để sử dụng như `this` khi thực thi `callbackFn`. Xem [các phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Giá trị trả về

Một mảng được gõ kiểu mới với mỗi phần tử là kết quả của hàm callback.

## Mô tả

Xem {{jsxref("Array.prototype.map()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Ánh xạ mảng được gõ kiểu thành mảng được gõ kiểu chứa căn bậc hai

Đoạn mã sau lấy một mảng được gõ kiểu và tạo một mảng được gõ kiểu mới chứa căn bậc hai của các số trong mảng được gõ kiểu đầu tiên.

```js
const numbers = new Uint8Array([1, 4, 9]);
const roots = numbers.map(Math.sqrt);
// roots bây giờ là: Uint8Array [1, 2, 3],
// numbers vẫn là Uint8Array [1, 4, 9]
```

### Ánh xạ mảng được gõ kiểu của các số sử dụng hàm chứa đối số

Đoạn mã sau cho thấy cách `map()` hoạt động khi một hàm yêu cầu một đối số được sử dụng với nó. Đối số sẽ tự động được gán cho mỗi phần tử của mảng được gõ kiểu khi `map()` lặp qua mảng được gõ kiểu ban đầu.

```js
const numbers = new Uint8Array([1, 4, 9]);
const doubles = numbers.map((num) => num * 2);
// doubles bây giờ là Uint8Array [2, 8, 18]
// numbers vẫn là Uint8Array [1, 4, 9]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.map` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.forEach()")}}
- {{jsxref("TypedArray.from()")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Map")}}
