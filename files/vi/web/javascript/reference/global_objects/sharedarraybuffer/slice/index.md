---
title: SharedArrayBuffer.prototype.slice()
short-title: slice()
slug: Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer/slice
page-type: javascript-instance-method
browser-compat: javascript.builtins.SharedArrayBuffer.slice
sidebar: jsref
---

Phương thức **`slice()`** của các instance {{jsxref("SharedArrayBuffer")}} trả về một `SharedArrayBuffer` mới có nội dung là bản sao của các byte của `SharedArrayBuffer` này từ `start`, bao gồm, đến `end`, không bao gồm. Nếu `start` hoặc `end` là âm, nó tham chiếu đến chỉ số từ cuối mảng, thay vì từ đầu.

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
    - Nếu `end >= buffer.length` hoặc `end` bị bỏ qua hoặc `undefined`, `buffer.length` được dùng, khiến tất cả các phần tử đến cuối được trích xuất.
    - Nếu `end` ngụ ý một vị trí trước hoặc tại vị trí mà `start` ngụ ý, một buffer rỗng được trả về.

### Giá trị trả về

Một {{jsxref("SharedArrayBuffer")}} mới chứa các phần tử được trích xuất.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng slice()

```js
// Create a SharedArrayBuffer with a size in bytes
const buffer = new SharedArrayBuffer(16);
const int32View = new Int32Array(buffer);
int32View[1] = 42;
// Produces Int32Array [0, 42, 0, 0]

const sliced = new Int32Array(buffer.slice(4, 12));
console.log(sliced); // Int32Array [42, 0]
```

### Sử dụng các giá trị start và end khác nhau

```js
const sab = new SharedArrayBuffer(1024);
sab.slice(); // SharedArrayBuffer { byteLength: 1024 }
sab.slice(2); // SharedArrayBuffer { byteLength: 1022 }
sab.slice(-2); // SharedArrayBuffer { byteLength: 2 }
sab.slice(0, 1); // SharedArrayBuffer { byteLength: 1 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("SharedArrayBuffer")}}
- {{jsxref("ArrayBuffer.prototype.slice()")}}
