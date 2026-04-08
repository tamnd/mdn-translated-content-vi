---
title: TypedArray.prototype.byteOffset
short-title: byteOffset
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/byteOffset
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.TypedArray.byteOffset
sidebar: jsref
---

Thuộc tính truy cập **`byteOffset`** của các thực thể {{jsxref("TypedArray")}} trả về độ lệch (tính bằng byte) của mảng được gõ kiểu này từ đầu {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} của nó.

## Mô tả

Thuộc tính `byteOffset` là một thuộc tính truy cập mà hàm truy cập thiết lập của nó là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng được gõ kiểu được xây dựng và không thể thay đổi. Tuy nhiên, `byteOffset` trở thành 0 nếu bộ đệm bên dưới được thay đổi kích thước sao cho phạm vi được xem không còn hợp lệ nữa.

## Ví dụ

### Sử dụng thuộc tính byteOffset

```js
const buffer = new ArrayBuffer(8);

const uint8array1 = new Uint8Array(buffer);
uint8array1.byteOffset; // 0 (không có offset được chỉ định)

const uint8array2 = new Uint8Array(buffer, 3);
uint8array2.byteOffset; // 3 (như được chỉ định khi xây dựng Uint8Array)

const buffer2 = new ArrayBuffer(16, { maxByteLength: 32 });
const uint8lengthTracking = new Uint8Array(buffer2, 4);
uint8lengthTracking.byteOffset; // 4
buffer2.resize(3);
uint8lengthTracking.byteOffset; // 0 (phạm vi được xem không còn hợp lệ)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
