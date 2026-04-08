---
title: Uint16Array
slug: Web/JavaScript/Reference/Global_Objects/Uint16Array
page-type: javascript-class
browser-compat: javascript.builtins.Uint16Array
sidebar: jsref
---

Mảng được gõ kiểu **`Uint16Array`** biểu diễn một mảng các số nguyên không dấu 16-bit theo thứ tự byte của nền tảng. Nếu cần kiểm soát thứ tự byte, hãy sử dụng {{jsxref("DataView")}} thay thế. Nội dung được khởi tạo về `0` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`Uint16Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

## Constructor

- {{jsxref("Uint16Array/Uint16Array", "Uint16Array()")}}
  - : Tạo một đối tượng `Uint16Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint16Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `2` trong trường hợp của `Uint16Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `Uint16Array.prototype` và được chia sẻ bởi tất cả các thực thể `Uint16Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint16Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `2` trong trường hợp của `Uint16Array`.
- {{jsxref("Object/constructor", "Uint16Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Uint16Array`, giá trị ban đầu là constructor {{jsxref("Uint16Array/Uint16Array", "Uint16Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo Uint16Array

```js
// Từ một độ dài
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint16Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
