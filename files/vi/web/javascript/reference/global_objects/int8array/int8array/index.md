---
title: Int8Array() constructor
short-title: Int8Array()
slug: Web/JavaScript/Reference/Global_Objects/Int8Array/Int8Array
page-type: javascript-constructor
browser-compat: javascript.builtins.Int8Array.Int8Array
sidebar: jsref
---

Hàm khởi tạo **`Int8Array()`** tạo các đối tượng {{jsxref("Int8Array")}}. Nội dung được khởi tạo thành `0` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new Int8Array()
new Int8Array(length)
new Int8Array(typedArray)
new Int8Array(object)

new Int8Array(buffer)
new Int8Array(buffer, byteOffset)
new Int8Array(buffer, byteOffset, length)
```

> [!NOTE]
> `Int8Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo Int8Array

```js
// Từ độ dài
const int8 = new Int8Array(2);
int8[0] = 42;
console.log(int8[0]); // 42
console.log(int8.length); // 2
console.log(int8.BYTES_PER_ELEMENT); // 1

// Từ một mảng
const x = new Int8Array([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Int8Array(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(8);
const z = new Int8Array(buffer, 1, 4);
console.log(z.byteOffset); // 1

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const int8FromIterable = new Int8Array(iterable);
console.log(int8FromIterable);
// Int8Array [1, 2, 3]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Int8Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
