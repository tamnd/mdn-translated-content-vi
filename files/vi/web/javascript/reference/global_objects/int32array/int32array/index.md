---
title: Int32Array() constructor
short-title: Int32Array()
slug: Web/JavaScript/Reference/Global_Objects/Int32Array/Int32Array
page-type: javascript-constructor
browser-compat: javascript.builtins.Int32Array.Int32Array
sidebar: jsref
---

Hàm khởi tạo **`Int32Array()`** tạo các đối tượng {{jsxref("Int32Array")}}. Nội dung được khởi tạo thành `0` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new Int32Array()
new Int32Array(length)
new Int32Array(typedArray)
new Int32Array(object)

new Int32Array(buffer)
new Int32Array(buffer, byteOffset)
new Int32Array(buffer, byteOffset, length)
```

> [!NOTE]
> `Int32Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo Int32Array

```js
// Từ độ dài
const int32 = new Int32Array(2);
int32[0] = 42;
console.log(int32[0]); // 42
console.log(int32.length); // 2
console.log(int32.BYTES_PER_ELEMENT); // 4

// Từ một mảng
const x = new Int32Array([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Int32Array(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(32);
const z = new Int32Array(buffer, 4, 4);
console.log(z.byteOffset); // 4

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const int32FromIterable = new Int32Array(iterable);
console.log(int32FromIterable);
// Int32Array [1, 2, 3]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Int32Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
