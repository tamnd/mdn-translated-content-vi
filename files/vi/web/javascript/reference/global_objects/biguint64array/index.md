---
title: BigUint64Array
slug: Web/JavaScript/Reference/Global_Objects/BigUint64Array
page-type: javascript-class
browser-compat: javascript.builtins.BigUint64Array
sidebar: jsref
---

Mảng được gõ kiểu **`BigUint64Array`** biểu diễn một mảng các số nguyên không dấu 64-bit theo thứ tự byte của nền tảng. Nếu cần kiểm soát thứ tự byte, hãy sử dụng {{jsxref("DataView")}} thay thế. Nội dung được khởi tạo về `0n` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`BigUint64Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

## Constructor

- {{jsxref("BigUint64Array/BigUint64Array", "BigUint64Array()")}}
  - : Tạo một đối tượng `BigUint64Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "BigUint64Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `8` trong trường hợp của `BigUint64Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `BigUint64Array.prototype` và được chia sẻ bởi tất cả các thực thể `BigUint64Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "BigUint64Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `8` trong trường hợp của `BigUint64Array`.
- {{jsxref("Object/constructor", "BigUint64Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `BigUint64Array`, giá trị ban đầu là constructor {{jsxref("BigUint64Array/BigUint64Array", "BigUint64Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo BigUint64Array

```js
// Từ một độ dài
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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
