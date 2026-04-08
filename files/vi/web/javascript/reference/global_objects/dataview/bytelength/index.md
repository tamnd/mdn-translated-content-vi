---
title: DataView.prototype.byteLength
short-title: byteLength
slug: Web/JavaScript/Reference/Global_Objects/DataView/byteLength
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.DataView.byteLength
sidebar: jsref
---

Thuộc tính truy cập **`byteLength`** của các instance {{jsxref("DataView")}} trả về độ dài (tính bằng byte) của view này.

{{InteractiveExample("JavaScript Demo: DataView.prototype.byteLength")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view1 = new DataView(buffer);
const view2 = new DataView(buffer, 12, 4); // From byte 12 for the next 4 bytes

console.log(view1.byteLength + view2.byteLength); // 16 + 4
// Expected output: 20
```

## Mô tả

Thuộc tính `byteLength` là một thuộc tính truy cập có hàm truy cập đặt là `undefined`, nghĩa là bạn chỉ có thể đọc thuộc tính này. Nếu `DataView` là [theo dõi độ dài](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#behavior_when_viewing_a_resizable_buffer), thì độ dài của nó phụ thuộc vào độ dài của buffer cơ bản và có thể thay đổi nếu buffer được thay đổi kích thước. Ngược lại, giá trị được thiết lập khi `DataView` được khởi tạo và không thể thay đổi. Dù có theo dõi độ dài hay không, `byteLength` trở thành 0 nếu buffer cơ bản được thay đổi kích thước sao cho phạm vi được xem không còn hợp lệ.

## Ví dụ

### Sử dụng thuộc tính byteLength

```js
const buffer = new ArrayBuffer(8);
const dataview = new DataView(buffer);
dataview.byteLength; // 8 (matches the byteLength of the buffer)

const dataview2 = new DataView(buffer, 1, 5);
dataview2.byteLength; // 5 (as specified when constructing the DataView)

const dataview3 = new DataView(buffer, 2);
dataview3.byteLength; // 6 (due to the offset of the constructed DataView)

const buffer2 = new ArrayBuffer(16, { maxByteLength: 32 });
const dataviewLengthTracking = new DataView(buffer2, 4);
dataviewLengthTracking.byteLength; // 12 (16 - 4)
buffer2.resize(20);
dataviewLengthTracking.byteLength; // 16 (20 - 4)
buffer2.resize(3);
dataviewLengthTracking.byteLength; // 0 (viewed range is no longer valid)
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
