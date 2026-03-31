---
title: BigInt64Array() constructor
short-title: BigInt64Array()
slug: Web/JavaScript/Reference/Global_Objects/BigInt64Array/BigInt64Array
page-type: javascript-constructor
browser-compat: javascript.builtins.BigInt64Array.BigInt64Array
sidebar: jsref
---

Hàm khởi tạo **`BigInt64Array()`** tạo các đối tượng {{jsxref("BigInt64Array")}}. Nội dung được khởi tạo thành `0n` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new BigInt64Array()
new BigInt64Array(length)
new BigInt64Array(typedArray)
new BigInt64Array(object)

new BigInt64Array(buffer)
new BigInt64Array(buffer, byteOffset)
new BigInt64Array(buffer, byteOffset, length)
```

> [!NOTE]
> `BigInt64Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo BigInt64Array

```js
// Từ độ dài
const bigint64 = new BigInt64Array(2);
bigint64[0] = 42n;
console.log(bigint64[0]); // 42n
console.log(bigint64.length); // 2
console.log(bigint64.BYTES_PER_ELEMENT); // 8

// Từ một mảng
const x = new BigInt64Array([21n, 31n]);
console.log(x[1]); // 31n

// Từ một TypedArray khác
const y = new BigInt64Array(x);
console.log(y[0]); // 21n

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(64);
const z = new BigInt64Array(buffer, 8, 4);
console.log(z.byteOffset); // 8

// Từ một iterable
const iterable = (function* () {
  yield* [1n, 2n, 3n];
})();
const bigint64FromIterable = new BigInt64Array(iterable);
console.log(bigint64FromIterable);
// BigInt64Array [1n, 2n, 3n]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
