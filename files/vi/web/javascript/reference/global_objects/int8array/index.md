---
title: Int8Array
slug: Web/JavaScript/Reference/Global_Objects/Int8Array
page-type: javascript-class
browser-compat: javascript.builtins.Int8Array
sidebar: jsref
---

Mảng được gõ kiểu **`Int8Array`** biểu diễn một mảng các số nguyên có dấu 8-bit. Nội dung được khởi tạo về `0` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`Int8Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

## Constructor

- {{jsxref("Int8Array/Int8Array", "Int8Array()")}}
  - : Tạo một đối tượng `Int8Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Int8Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `1` trong trường hợp của `Int8Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `Int8Array.prototype` và được chia sẻ bởi tất cả các thực thể `Int8Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Int8Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `1` trong trường hợp của `Int8Array`.
- {{jsxref("Object/constructor", "Int8Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Int8Array`, giá trị ban đầu là constructor {{jsxref("Int8Array/Int8Array", "Int8Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo Int8Array

```js
// Từ một độ dài
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Int8Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
