---
title: Uint8ClampedArray
slug: Web/JavaScript/Reference/Global_Objects/Uint8ClampedArray
page-type: javascript-class
browser-compat: javascript.builtins.Uint8ClampedArray
sidebar: jsref
---

Mảng được gõ kiểu **`Uint8ClampedArray`** biểu diễn một mảng các số nguyên không dấu 8-bit được kẹp vào phạm vi 0–255. Nội dung được khởi tạo về `0` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`Uint8ClampedArray` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

## Constructor

- {{jsxref("Uint8ClampedArray/Uint8ClampedArray", "Uint8ClampedArray()")}}
  - : Tạo một đối tượng `Uint8ClampedArray` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint8ClampedArray.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `1` trong trường hợp của `Uint8ClampedArray`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `Uint8ClampedArray.prototype` và được chia sẻ bởi tất cả các thực thể `Uint8ClampedArray`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Uint8ClampedArray.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `1` trong trường hợp của `Uint8ClampedArray`.
- {{jsxref("Object/constructor", "Uint8ClampedArray.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Uint8ClampedArray`, giá trị ban đầu là constructor {{jsxref("Uint8ClampedArray/Uint8ClampedArray", "Uint8ClampedArray")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo Uint8ClampedArray

```js
// Từ một độ dài
const uint8c = new Uint8ClampedArray(2);
uint8c[0] = 42;
uint8c[1] = 1337;
console.log(uint8c[0]); // 42
console.log(uint8c[1]); // 255 (clamped)
console.log(uint8c.length); // 2
console.log(uint8c.BYTES_PER_ELEMENT); // 1

// Từ một mảng
const x = new Uint8ClampedArray([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Uint8ClampedArray(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(8);
const z = new Uint8ClampedArray(buffer, 1, 4);
console.log(z.byteOffset); // 1

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const uint8cFromIterable = new Uint8ClampedArray(iterable);
console.log(uint8cFromIterable);
// Uint8ClampedArray [1, 2, 3]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Uint8ClampedArray` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("DataView")}}
