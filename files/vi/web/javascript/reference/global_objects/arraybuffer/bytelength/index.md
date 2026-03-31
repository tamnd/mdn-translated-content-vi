---
title: ArrayBuffer.prototype.byteLength
short-title: byteLength
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/byteLength
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.ArrayBuffer.byteLength
sidebar: jsref
---

Thuộc tính truy cập **`byteLength`** của các instance {{jsxref("ArrayBuffer")}} trả về độ dài (tính bằng byte) của array buffer này.

{{InteractiveExample("JavaScript Demo: ArrayBuffer.prototype.byteLength")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);

// Use byteLength to check the size
const bytes = buffer.byteLength;

console.log(bytes);
// Expected output: 8
```

## Mô tả

Thuộc tính `byteLength` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng được khởi tạo và không thể thay đổi. Thuộc tính này trả về 0 nếu `ArrayBuffer` này đã bị tách ra.

## Ví dụ

### Sử dụng byteLength

```js
const buffer = new ArrayBuffer(8);
buffer.byteLength; // 8
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("ArrayBuffer")}}
