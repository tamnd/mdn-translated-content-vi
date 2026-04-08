---
title: DataView.prototype.byteOffset
short-title: byteOffset
slug: Web/JavaScript/Reference/Global_Objects/DataView/byteOffset
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.DataView.byteOffset
sidebar: jsref
---

Thuộc tính truy cập **`byteOffset`** của các instance {{jsxref("DataView")}} trả về độ lệch (tính bằng byte) của view này từ đầu {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} của nó.

{{InteractiveExample("JavaScript Demo: DataView.prototype.byteOffset")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view = new DataView(buffer, 12, 4); // From byte 12 for the next 4 bytes

console.log(view.byteOffset);
// Expected output: 12
```

## Mô tả

Thuộc tính `byteOffset` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Giá trị được thiết lập khi `DataView` được khởi tạo và không thể thay đổi. Tuy nhiên, `byteOffset` trở thành 0 nếu buffer cơ bản được thay đổi kích thước sao cho phạm vi được xem không còn hợp lệ.

## Ví dụ

### Sử dụng thuộc tính byteOffset

```js
const buffer = new ArrayBuffer(8);
const dataview = new DataView(buffer);
dataview.byteOffset; // 0 (no offset specified)

const dataview2 = new DataView(buffer, 3);
dataview2.byteOffset; // 3 (as specified when constructing the DataView)

const buffer2 = new ArrayBuffer(16, { maxByteLength: 32 });
const dataviewLengthTracking = new DataView(buffer2, 4);
dataviewLengthTracking.byteOffset; // 4
buffer2.resize(3);
dataviewLengthTracking.byteOffset; // 0 (viewed range is no longer valid)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("SharedArrayBuffer")}}
