---
title: BigInt64Array
slug: Web/JavaScript/Reference/Global_Objects/BigInt64Array
page-type: javascript-class
browser-compat: javascript.builtins.BigInt64Array
sidebar: jsref
---

Mảng được gõ kiểu **`BigInt64Array`** biểu diễn một mảng các số nguyên có dấu 64-bit theo thứ tự byte của nền tảng. Nếu cần kiểm soát thứ tự byte, hãy sử dụng {{jsxref("DataView")}} thay thế. Nội dung được khởi tạo về `0n` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`BigInt64Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

{{InteractiveExample("JavaScript Demo: BigInt64Array", "taller")}}

```js interactive-example
const buffer = new ArrayBuffer(24);
const bigint64 = new BigInt64Array(buffer);
bigint64[0] = 5886014448488689n;
bigint64[1] = 1881938909131133n;
bigint64[2] = 1898875537769492n;

bigint64[0] = 6118793953620967n;
console.log(bigint64);
// Expected Output: BigInt64Array [6118793953620967n, 1881938909131133n, 1898875537769492n]

console.log(bigint64[2]);
// Expected Output: 1898875537769492n

console.log("Array length:", bigint64.length);
// Expected Output: Array length: 3

console.log("Array byte length:", bigint64.byteLength);
// Expected Output: Array byte length: 24

console.log("Array byte offset:", bigint64.byteOffset);
// Expected Output: Array byte offset: 0

bigint64.set([100n, 200n], 1);
console.log(bigint64);
// Expected Output: BigInt64Array [6118793953620967n, 100n, 200n]
```

## Constructor

- {{jsxref("BigInt64Array/BigInt64Array", "BigInt64Array()")}}
  - : Tạo một đối tượng `BigInt64Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "BigInt64Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `8` trong trường hợp của `BigInt64Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `BigInt64Array.prototype` và được chia sẻ bởi tất cả các thực thể `BigInt64Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "BigInt64Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `8` trong trường hợp của `BigInt64Array`.
- {{jsxref("Object/constructor", "BigInt64Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `BigInt64Array`, giá trị ban đầu là constructor {{jsxref("BigInt64Array/BigInt64Array", "BigInt64Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo BigInt64Array

```js
// Từ một độ dài
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
