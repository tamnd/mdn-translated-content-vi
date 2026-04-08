---
title: Uint8Array() constructor
short-title: Uint8Array()
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array/Uint8Array
page-type: javascript-constructor
browser-compat: javascript.builtins.Uint8Array.Uint8Array
sidebar: jsref
---

Hàm khởi tạo **`Uint8Array()`** tạo các đối tượng {{jsxref("Uint8Array")}}. Nội dung được khởi tạo thành `0` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new Uint8Array()
new Uint8Array(length)
new Uint8Array(typedArray)
new Uint8Array(object)

new Uint8Array(buffer)
new Uint8Array(buffer, byteOffset)
new Uint8Array(buffer, byteOffset, length)
```

> [!NOTE]
> `Uint8Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo Uint8Array

```js
// Từ độ dài
const uint8 = new Uint8Array(2);
uint8[0] = 42;
console.log(uint8[0]); // 42
console.log(uint8.length); // 2
console.log(uint8.BYTES_PER_ELEMENT); // 1

// Từ một mảng
const x = new Uint8Array([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Uint8Array(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(8);
const z = new Uint8Array(buffer, 1, 4);
console.log(z.byteOffset); // 1

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const uint8FromIterable = new Uint8Array(iterable);
console.log(uint8FromIterable);
// Uint8Array [1, 2, 3]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
