---
title: ArrayBuffer.prototype.resizable
short-title: resizable
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/resizable
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.ArrayBuffer.resizable
sidebar: jsref
---

Thuộc tính truy cập **`resizable`** của các instance {{jsxref("ArrayBuffer")}} trả về liệu array buffer này có thể thay đổi kích thước hay không.

{{InteractiveExample("JavaScript Demo: ArrayBuffer.prototype.resizable")}}

```js interactive-example
const buffer1 = new ArrayBuffer(8, { maxByteLength: 16 });
const buffer2 = new ArrayBuffer(8);

console.log(buffer1.resizable);
// Expected output: true

console.log(buffer2.resizable);
// Expected output: false
```

## Mô tả

Thuộc tính `resizable` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi mảng được khởi tạo. Nếu tùy chọn `maxByteLength` được đặt trong constructor, `resizable` sẽ trả về `true`; nếu không, nó sẽ trả về `false`.

## Ví dụ

### Sử dụng resizable

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
- {{jsxref("ArrayBuffer.prototype.maxByteLength")}}
- {{jsxref("ArrayBuffer.prototype.resize()")}}
