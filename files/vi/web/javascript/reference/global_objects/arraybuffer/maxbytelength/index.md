---
title: ArrayBuffer.prototype.maxByteLength
short-title: maxByteLength
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/maxByteLength
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.ArrayBuffer.maxByteLength
sidebar: jsref
---

Thuộc tính truy cập **`maxByteLength`** của các instance {{jsxref("ArrayBuffer")}} trả về độ dài tối đa (tính bằng byte) mà array buffer này có thể được thay đổi kích thước đến.

{{InteractiveExample("JavaScript Demo: ArrayBuffer.prototype.maxByteLength")}}

```js interactive-example
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });

console.log(buffer.byteLength);
// Expected output: 8

console.log(buffer.maxByteLength);
// Expected output: 16
```

## Mô tả

Thuộc tính `maxByteLength` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng được khởi tạo, được đặt thông qua tùy chọn `maxByteLength` của constructor {{jsxref("ArrayBuffer/ArrayBuffer", "ArrayBuffer()")}}, và không thể thay đổi.

Thuộc tính này trả về 0 nếu `ArrayBuffer` này đã bị tách ra. Nếu `ArrayBuffer` này được xây dựng mà không chỉ định giá trị `maxByteLength`, thuộc tính này trả về giá trị bằng với giá trị `byteLength` của `ArrayBuffer`.

## Ví dụ

### Sử dụng maxByteLength

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể thay đổi kích thước đến tối đa 16 byte, sau đó trả về `maxByteLength` của nó:

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });

buffer.maxByteLength; // 16
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("ArrayBuffer")}}
- {{jsxref("ArrayBuffer.prototype.byteLength")}}
- {{jsxref("ArrayBuffer.prototype.resize()")}}
