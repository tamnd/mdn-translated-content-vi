---
title: TypedArray.prototype.buffer
short-title: buffer
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/buffer
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.TypedArray.buffer
sidebar: jsref
---

Thuộc tính truy cập **`buffer`** của các thực thể {{jsxref("TypedArray")}} trả về {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} được tham chiếu bởi mảng được gõ kiểu này tại thời điểm xây dựng.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.buffer", "shorter")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);
const uint16 = new Uint16Array(buffer);

console.log(uint16.buffer.byteLength);
// Expected output: 8
```

## Mô tả

Thuộc tính `buffer` là một thuộc tính truy cập mà hàm truy cập thiết lập của nó là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi _TypedArray_ được xây dựng và không thể thay đổi. _TypedArray_ là một trong các [đối tượng TypedArray](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#typedarray_objects).

Vì mảng được gõ kiểu là một _khung nhìn_ của bộ đệm, nên bộ đệm bên dưới có thể dài hơn chính mảng được gõ kiểu đó.

## Ví dụ

### Sử dụng thuộc tính buffer

```js
const buffer = new ArrayBuffer(8);
const uint16 = new Uint16Array(buffer);
uint16.buffer; // ArrayBuffer { byteLength: 8 }
```

### Truy cập bộ đệm bên dưới từ một khung nhìn mảng đã cắt

```js
const buffer = new ArrayBuffer(1024);
const arr = new Uint8Array(buffer, 64, 128);
console.log(arr.byteLength); // 128
console.log(arr.buffer.byteLength); // 1024
console.log(arr.buffer === buffer); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
