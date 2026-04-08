---
title: Uint8Array
slug: Web/JavaScript/Reference/Global_Objects/Uint8Array
page-type: javascript-class
browser-compat: javascript.builtins.Uint8Array
sidebar: jsref
---

Mảng được gõ kiểu **`Uint8Array`** biểu diễn một mảng các số nguyên không dấu 8-bit. Nội dung được khởi tạo về `0` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`Uint8Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

## Mô tả

`Uint8Array` hiện tại là lớp con `TypedArray` duy nhất có các phương thức bổ sung so với các mảng được gõ kiểu khác. Do bản chất của nó là một mảng byte chung, nó phù hợp nhất để làm việc với dữ liệu nhị phân tùy ý. Nó hỗ trợ hai bộ phương thức để tạo, serialize và sửa đổi dữ liệu `Uint8Array` từ/đến chuỗi hex và chuỗi base64.

- {{jsxref("Uint8Array.fromBase64()")}}, {{jsxref("Uint8Array.prototype.toBase64()")}}, và {{jsxref("Uint8Array.prototype.setFromBase64()")}} để làm việc với chuỗi [base64](/en-US/docs/Glossary/Base64), trong đó 3 byte được mã hóa bởi 4 ký tự là 0–9, A–Z, a–z, "+" và "/" (hoặc "-" và "\_", nếu sử dụng base64 an toàn cho URL).
- {{jsxref("Uint8Array.fromHex()")}}, {{jsxref("Uint8Array.prototype.toHex()")}}, và {{jsxref("Uint8Array.prototype.setFromHex()")}} để làm việc với chuỗi hex, trong đó mỗi byte được mã hóa bởi hai ký tự, mỗi ký tự là 0–9 hoặc A–F (không phân biệt chữ hoa/thường).

## Constructor

- {{jsxref("Uint8Array/Uint8Array", "Uint8Array()")}}
  - : Tạo một đối tượng `Uint8Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint8Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `1` trong trường hợp của `Uint8Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("Uint8Array.fromBase64()")}}
  - : Tạo một đối tượng `Uint8Array` mới từ một chuỗi được mã hóa base64.
- {{jsxref("Uint8Array.fromHex()")}}
  - : Tạo một đối tượng `Uint8Array` mới từ một chuỗi được mã hóa hex.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `Uint8Array.prototype` và được chia sẻ bởi tất cả các thực thể `Uint8Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint8Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `1` trong trường hợp của `Uint8Array`.
- {{jsxref("Object/constructor", "Uint8Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Uint8Array`, giá trị ban đầu là constructor {{jsxref("Uint8Array/Uint8Array", "Uint8Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("Uint8Array.prototype.setFromBase64()")}}
  - : Điền đối tượng `Uint8Array` này với các byte từ một chuỗi được mã hóa base64, trả về một đối tượng cho biết bao nhiêu byte đã được đọc và ghi.
- {{jsxref("Uint8Array.prototype.setFromHex()")}}
  - : Điền đối tượng `Uint8Array` này với các byte từ một chuỗi được mã hóa hex, trả về một đối tượng cho biết bao nhiêu byte đã được đọc và ghi.
- {{jsxref("Uint8Array.prototype.toBase64()")}}
  - : Trả về một chuỗi được mã hóa base64 dựa trên dữ liệu trong đối tượng `Uint8Array` này.
- {{jsxref("Uint8Array.prototype.toHex()")}}
  - : Trả về một chuỗi được mã hóa hex dựa trên dữ liệu trong đối tượng `Uint8Array` này.

## Ví dụ

### Các cách khác nhau để tạo Uint8Array

```js
// Từ một độ dài
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8Array` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
