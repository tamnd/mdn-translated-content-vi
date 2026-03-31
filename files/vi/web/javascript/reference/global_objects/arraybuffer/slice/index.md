---
title: ArrayBuffer.prototype.slice()
short-title: slice()
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/slice
page-type: javascript-instance-method
browser-compat: javascript.builtins.ArrayBuffer.slice
sidebar: jsref
---

Phương thức **`slice()`** của các instance {{jsxref("ArrayBuffer")}} trả về một `ArrayBuffer` mới có nội dung là bản sao của các byte của `ArrayBuffer` này từ `start`, bao gồm, đến `end`, không bao gồm. Nếu `start` hoặc `end` là âm, nó tham chiếu đến chỉ số từ cuối mảng, thay vì từ đầu.

{{InteractiveExample("JavaScript Demo: ArrayBuffer.prototype.slice()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);
const int32View = new Int32Array(buffer);
// Produces Int32Array [0, 0, 0, 0]

int32View[1] = 42;
const sliced = new Int32Array(buffer.slice(4, 12));
// Produces Int32Array [42, 0]

console.log(sliced[0]);
// Expected output: 42
```

## Cú pháp

```js-nolint
slice()
slice(start)
slice(start, end)
```

### Tham số

- `start` {{optional_inline}}
  - : Chỉ số dựa trên 0 để bắt đầu trích xuất, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ số âm đếm ngược từ cuối buffer — nếu `-buffer.length <= start < 0`, thì `start + buffer.length` được dùng.
    - Nếu `start < -buffer.length` hoặc `start` bị bỏ qua, thì `0` được dùng.
    - Nếu `start >= buffer.length`, một buffer rỗng được trả về.
- `end` {{optional_inline}}
  - : Chỉ số dựa trên 0 để kết thúc trích xuất, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion). `slice()` trích xuất đến nhưng không bao gồm `end`.
    - Chỉ số âm đếm ngược từ cuối buffer — nếu `-buffer.length <= end < 0`, thì `end + buffer.length` được dùng.
    - Nếu `end < -buffer.length`, `0` được dùng.
    - Nếu `end >= buffer.length` hoặc `end` bị bỏ qua là `undefined`, `buffer.length` được dùng, khiến tất cả các phần tử đến cuối được trích xuất.
    - Nếu `end` ngụ ý một vị trí trước hoặc tại vị trí mà `start` ngụ ý, một buffer rỗng được trả về.

### Giá trị trả về

Một {{jsxref("ArrayBuffer")}} mới chứa các phần tử được trích xuất. Nó [không thể thay đổi kích thước](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer/resizable), ngay cả khi bản gốc có thể.

## Ví dụ

### Sao chép một ArrayBuffer

```js
const buf1 = new ArrayBuffer(8);
const buf2 = buf1.slice(0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("ArrayBuffer")}}
- {{jsxref("SharedArrayBuffer.prototype.slice()")}}
