---
title: BigUint64Array() constructor
short-title: BigUint64Array()
slug: Web/JavaScript/Reference/Global_Objects/BigUint64Array/BigUint64Array
page-type: javascript-constructor
browser-compat: javascript.builtins.BigUint64Array.BigUint64Array
sidebar: jsref
---

Hàm khởi tạo **`BigUint64Array()`** tạo các đối tượng {{jsxref("BigUint64Array")}}. Nội dung được khởi tạo thành `0n` trừ khi dữ liệu khởi tạo được cung cấp tường minh.

## Cú pháp

```js-nolint
new BigUint64Array()
new BigUint64Array(length)
new BigUint64Array(typedArray)
new BigUint64Array(object)

new BigUint64Array(buffer)
new BigUint64Array(buffer, byteOffset)
new BigUint64Array(buffer, byteOffset, length)
```

> [!NOTE]
> `BigUint64Array()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#parameters).

### Ngoại lệ

Xem [`TypedArray`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#exceptions).

## Ví dụ

### Các cách khác nhau để tạo BigUint64Array

```js
// Từ độ dài
const biguint64 = new BigUint64Array(2);
biguint64[0] = 42n;
console.log(biguint64[0]); // 42n
console.log(biguint64.length); // 2
console.log(biguint64.BYTES_PER_ELEMENT); // 8

// Từ một mảng
const x = new BigUint64Array([21n, 31n]);
console.log(x[1]); // 31n

// Từ một TypedArray khác
const y = new BigUint64Array(x);
console.log(y[0]); // 21n

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(64);
const z = new BigUint64Array(buffer, 8, 4);
console.log(z.byteOffset); // 8

// Từ một iterable
const iterable = (function* () {
  yield* [1n, 2n, 3n];
})();
const biguint64FromIterable = new BigUint64Array(iterable);
console.log(biguint64FromIterable);
// BigUint64Array [1n, 2n, 3n]
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
