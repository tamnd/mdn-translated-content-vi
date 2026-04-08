---
title: DataView.prototype.buffer
short-title: buffer
slug: Web/JavaScript/Reference/Global_Objects/DataView/buffer
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.DataView.buffer
sidebar: jsref
---

Thuộc tính truy cập **`buffer`** của các instance {{jsxref("DataView")}} trả về {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} được tham chiếu bởi view này tại thời điểm khởi tạo.

{{InteractiveExample("JavaScript Demo: DataView.prototype.buffer")}}

```js interactive-example
// Create an ArrayBuffer
const buffer = new ArrayBuffer(123);

// Create a view
const view = new DataView(buffer);

console.log(view.buffer.byteLength);
// Expected output: 123
```

## Mô tả

Thuộc tính `buffer` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi `DataView` được khởi tạo và không thể thay đổi.

## Ví dụ

### Sử dụng thuộc tính buffer

```js
const buffer = new ArrayBuffer(8);
const dataview = new DataView(buffer);
dataview.buffer; // ArrayBuffer { byteLength: 8 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("SharedArrayBuffer")}}
