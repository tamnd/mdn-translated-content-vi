---
title: DataView.prototype.getInt8()
short-title: getInt8()
slug: Web/JavaScript/Reference/Global_Objects/DataView/getInt8
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.getInt8
sidebar: jsref
---

Phương thức **`getInt8()`** của các instance {{jsxref("DataView")}} đọc 1 byte tại độ lệch byte được chỉ định của `DataView` này và diễn giải nó như một số nguyên có dấu 8-bit.

{{InteractiveExample("JavaScript Demo: DataView.prototype.getInt8()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view = new DataView(buffer);
view.setInt8(1, 127); // Max signed 8-bit integer

console.log(view.getInt8(1));
// Expected output: 127
```

## Cú pháp

```js-nolint
getInt8(byteOffset)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để đọc dữ liệu từ.

### Giá trị trả về

Một số nguyên từ -128 đến 127, bao gồm.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ đọc vượt quá cuối view.

## Ví dụ

### Sử dụng getInt8()

```js
const { buffer } = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const dataview = new DataView(buffer);
console.log(dataview.getInt8(1)); // 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Int8Array")}}
