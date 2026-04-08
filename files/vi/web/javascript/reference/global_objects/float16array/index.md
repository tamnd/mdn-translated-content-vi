---
title: Float16Array
slug: Web/JavaScript/Reference/Global_Objects/Float16Array
page-type: javascript-class
browser-compat: javascript.builtins.Float16Array
sidebar: jsref
---

Mảng được gõ kiểu **`Float16Array`** biểu diễn một mảng các số dấu phẩy động 16-bit theo thứ tự byte của nền tảng. Nếu cần kiểm soát thứ tự byte, hãy sử dụng {{jsxref("DataView")}} thay thế. Nội dung được khởi tạo về `0` trừ khi dữ liệu khởi tạo được cung cấp một cách rõ ràng. Sau khi được thiết lập, bạn có thể tham chiếu đến các phần tử trong mảng bằng cách sử dụng các phương thức của đối tượng, hoặc sử dụng cú pháp chỉ số mảng tiêu chuẩn (tức là sử dụng ký hiệu ngoặc).

`Float16Array` là lớp con của lớp {{jsxref("TypedArray")}} ẩn.

> [!NOTE]
> Hỗ trợ Float16 không phổ biến, cả trong API JavaScript và kiến trúc CPU bên dưới. Sử dụng nó có thể dẫn đến hiệu suất chậm hơn trên một số nền tảng. Nó được thiết kế để tương tác với các hệ thống được tối ưu hóa cao và nhạy cảm với hiệu suất như [canvas được hỗ trợ bởi float](https://github.com/w3c/ColorWeb-CG/blob/main/canvas_float.md), WebGPU, WebGL và các mô hình học sâu bao gồm [stable diffusion](https://github.com/huggingface/blog/blob/main/stable_diffusion.md).

## Constructor

- {{jsxref("Float16Array/Float16Array", "Float16Array()")}}
  - : Tạo một đối tượng `Float16Array` mới.

## Thuộc tính tĩnh

_Cũng kế thừa các thuộc tính tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Float16Array.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `2` trong trường hợp của `Float16Array`.

## Phương thức tĩnh

_Kế thừa các phương thức tĩnh từ lớp cha {{jsxref("TypedArray")}}_.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính thực thể từ lớp cha {{jsxref("TypedArray")}}_.

Các thuộc tính này được định nghĩa trên `Float16Array.prototype` và được chia sẻ bởi tất cả các thực thể `Float16Array`.

- {{jsxref("TypedArray/BYTES_PER_ELEMENT", "Float16Array.prototype.BYTES_PER_ELEMENT")}}
  - : Trả về giá trị số của kích thước phần tử. `2` trong trường hợp của `Float16Array`.
- {{jsxref("Object/constructor", "Float16Array.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng thực thể. Đối với các thực thể `Float16Array`, giá trị ban đầu là constructor {{jsxref("Float16Array/Float16Array", "Float16Array")}}.

## Phương thức thực thể

_Kế thừa các phương thức thực thể từ lớp cha {{jsxref("TypedArray")}}_.

## Ví dụ

### Các cách khác nhau để tạo Float16Array

```js
// Từ một độ dài
const float16 = new Float16Array(2);
float16[0] = 42;
console.log(float16[0]); // 42
console.log(float16.length); // 2
console.log(float16.BYTES_PER_ELEMENT); // 2

// Từ một mảng
const x = new Float16Array([21, 31]);
console.log(x[1]); // 31

// Từ một TypedArray khác
const y = new Float16Array(x);
console.log(y[0]); // 21

// Từ một ArrayBuffer
const buffer = new ArrayBuffer(32);
const z = new Float16Array(buffer, 4, 4);
console.log(z.byteOffset); // 4

// Từ một iterable
const iterable = (function* () {
  yield* [1, 2, 3];
})();
const float16FromIterable = new Float16Array(iterable);
console.log(float16FromIterable);
// Float16Array [1, 2, 3]
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
