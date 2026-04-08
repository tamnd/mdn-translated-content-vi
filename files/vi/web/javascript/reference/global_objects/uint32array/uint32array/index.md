---
title: Uint32Array() constructor
short-title: Uint32Array()
slug: Web/JavaScript/Reference/Global_Objects/Uint32Array/Uint32Array
page-type: javascript-constructor
browser-compat: javascript.builtins.Uint32Array.Uint32Array
sidebar: jsref
---

Hàm khởi tạo **`Uint32Array()`** tạo các đối tượng {{jsxref("Uint32Array")}}. Nội dung được khởi tạo thành `0` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new Uint32Array()
new Uint32Array(length)
new Uint32Array(typedArray)
new Uint32Array(object)

new Uint32Array(buffer)
new Uint32Array(buffer, byteOffset)
new Uint32Array(buffer, byteOffset, length)
```

> [!NOTE]
> `Uint32Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo Uint32Array

```js
// Từ độ dài
const uint32 = new Uint32Array(2);
uint32[0] = 42;
console.log(uint32[0]); // 42
console.log(uint32.length); // 2
console.log(uint32.BYTES_PER_ELEMENT); // 4

// Từ một mảng
const x = new Uint32Array([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Uint32Array(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(32);
const z = new Uint32Array(buffer, 4, 4);
console.log(z.byteOffset); // 4

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const uint32FromIterable = new Uint32Array(iterable);
console.log(uint32FromIterable);
// Uint32Array [1, 2, 3]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint32Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
