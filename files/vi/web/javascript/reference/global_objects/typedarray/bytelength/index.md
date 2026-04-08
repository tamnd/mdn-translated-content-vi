---
title: TypedArray.prototype.byteLength
short-title: byteLength
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/byteLength
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.TypedArray.byteLength
sidebar: jsref
---

Thuộc tính truy cập **`byteLength`** của các thực thể {{jsxref("TypedArray")}} trả về độ dài (tính bằng byte) của mảng được gõ kiểu này.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.byteLength", "shorter")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);
const uint8 = new Uint8Array(buffer, 2);

console.log(uint8.byteLength);
// Expected output: 6
```

## Mô tả

Thuộc tính `byteLength` là một thuộc tính truy cập mà hàm truy cập thiết lập của nó là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Nếu mảng được gõ kiểu [theo dõi độ dài](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#behavior_when_viewing_a_resizable_buffer), thì độ dài của nó phụ thuộc vào độ dài của bộ đệm bên dưới và có thể thay đổi nếu bộ đệm được thay đổi kích thước. Nếu không, giá trị được thiết lập khi mảng được gõ kiểu được xây dựng và không thể thay đổi. Dù theo dõi độ dài hay không, `byteLength` trở thành 0 nếu bộ đệm bên dưới được thay đổi kích thước sao cho phạm vi được xem không còn hợp lệ nữa.

## Ví dụ

### Sử dụng thuộc tính byteLength

```js
const buffer = new ArrayBuffer(8);

const uint8 = new Uint8Array(buffer);
uint8.byteLength; // 8 (khớp với byteLength của buffer)

const uint8newLength = new Uint8Array(buffer, 1, 5);
uint8newLength.byteLength; // 5 (như được chỉ định khi xây dựng Uint8Array)

const uint8offset = new Uint8Array(buffer, 2);
uint8offset.byteLength; // 6 (do offset của Uint8Array được xây dựng)

const buffer2 = new ArrayBuffer(16, { maxByteLength: 32 });
const uint8lengthTracking = new Uint8Array(buffer2, 4);
uint8lengthTracking.byteLength; // 12 (16 - 4)
buffer2.resize(20);
uint8lengthTracking.byteLength; // 16 (20 - 4)
buffer2.resize(3);
uint8lengthTracking.byteLength; // 0 (phạm vi được xem không còn hợp lệ)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
