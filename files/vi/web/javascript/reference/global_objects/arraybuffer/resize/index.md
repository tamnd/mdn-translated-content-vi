---
title: ArrayBuffer.prototype.resize()
short-title: resize()
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/resize
page-type: javascript-instance-method
browser-compat: javascript.builtins.ArrayBuffer.resize
sidebar: jsref
---

Phương thức **`resize()`** của các instance {{jsxref("ArrayBuffer")}} thay đổi kích thước `ArrayBuffer` thành kích thước được chỉ định, tính bằng byte.

{{InteractiveExample("JavaScript Demo: ArrayBuffer.prototype.resize()")}}

```js interactive-example
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });

console.log(buffer.byteLength);
// Expected output: 8

buffer.resize(12);

console.log(buffer.byteLength);
// Expected output: 12
```

## Cú pháp

```js-nolint
resize(newLength)
```

### Tham số

- `newLength`
  - : Độ dài mới, tính bằng byte, để thay đổi kích thước `ArrayBuffer` thành.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `ArrayBuffer` đã bị tách ra hoặc không thể thay đổi kích thước.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `newLength` lớn hơn {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} của `ArrayBuffer`.

## Mô tả

Phương thức `resize()` thay đổi kích thước một `ArrayBuffer` thành kích thước được chỉ định bởi tham số `newLength`, miễn là `ArrayBuffer` [có thể thay đổi kích thước](/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer/resizable) và kích thước mới nhỏ hơn hoặc bằng {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} của `ArrayBuffer`. Các byte mới được khởi tạo thành 0.

Lưu ý rằng bạn có thể sử dụng `resize()` để thu nhỏ cũng như mở rộng một `ArrayBuffer` — `newLength` được phép nhỏ hơn `byteLength` hiện tại của `ArrayBuffer`.

## Ví dụ

### Sử dụng resize()

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể thay đổi kích thước đến tối đa 16 byte, sau đó kiểm tra thuộc tính `resizable` của nó, thay đổi kích thước nếu `resizable` trả về `true`:

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });

if (buffer.resizable) {
  console.log("Buffer is resizable!");
  buffer.resize(12);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("ArrayBuffer")}}
- {{jsxref("ArrayBuffer.prototype.resizable")}}
- {{jsxref("ArrayBuffer.prototype.maxByteLength")}}
