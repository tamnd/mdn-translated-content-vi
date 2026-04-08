---
title: Uint16Array() constructor
short-title: Uint16Array()
slug: Web/JavaScript/Reference/Global_Objects/Uint16Array/Uint16Array
page-type: javascript-constructor
browser-compat: javascript.builtins.Uint16Array.Uint16Array
sidebar: jsref
---

Hàm khởi tạo **`Uint16Array()`** tạo các đối tượng {{jsxref("Uint16Array")}}. Nội dung được khởi tạo thành `0` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new Uint16Array()
new Uint16Array(length)
new Uint16Array(typedArray)
new Uint16Array(object)

new Uint16Array(buffer)
new Uint16Array(buffer, byteOffset)
new Uint16Array(buffer, byteOffset, length)
```

> [!NOTE]
> `Uint16Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo Uint16Array

```js
// Từ độ dài
const uint16 = new Uint16Array(2);
uint16[0] = 42;
console.log(uint16[0]); // 42
console.log(uint16.length); // 2
console.log(uint16.BYTES_PER_ELEMENT); // 2

// Từ một mảng
const x = new Uint16Array([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Uint16Array(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(16);
const z = new Uint16Array(buffer, 2, 4);
console.log(z.byteOffset); // 2

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const uint16FromIterable = new Uint16Array(iterable);
console.log(uint16FromIterable);
// Uint16Array [1, 2, 3]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint16Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
