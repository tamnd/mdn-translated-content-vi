---
title: Uint32Array
slug: Web/JavaScript/Reference/Global_Objects/Uint32Array
page-type: javascript-class
browser-compat: javascript.builtins.Uint32Array
sidebar: jsref
---

Mảng được gõ kiểu **`Uint32Array`** biểu diễn một mảng các số nguyên không dấu 32-bit theo thứ tự byte của nền tảng. Nếu cần kiểm soát thứ tự byte, hãy sử dụng {{jsxref("DataView")}} thay thế. Nội dung được khởi tạo về `0` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`Uint32Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

## Constructor

- {{jsxref("Uint32Array/Uint32Array", "Uint32Array()")}}
  - : Tạo một đối tượng `Uint32Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint32Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `4` trong trường hợp của `Uint32Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `Uint32Array.prototype` và được chia sẻ bởi tất cả các thực thể `Uint32Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint32Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `4` trong trường hợp của `Uint32Array`.
- {{jsxref("Object/constructor", "Uint32Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Uint32Array`, giá trị ban đầu là constructor {{jsxref("Uint32Array/Uint32Array", "Uint32Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo Uint32Array

```js
// Từ một độ dài
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint32Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
