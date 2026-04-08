---
title: DataView.prototype.getUint8()
short-title: getUint8()
slug: Web/JavaScript/Reference/Global_Objects/DataView/getUint8
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.getUint8
sidebar: jsref
---

Phương thức **`getUint8()`** của các instance {{jsxref("DataView")}} đọc 1 byte tại độ lệch byte được chỉ định của `DataView` này và diễn giải nó như một số nguyên không dấu 8-bit.

{{InteractiveExample("JavaScript Demo: DataView.prototype.getUint8()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view = new DataView(buffer);
view.setUint8(1, 255); // Max unsigned 8-bit integer

console.log(view.getUint8(1));
// Expected output: 255
```

## Cú pháp

```js-nolint
getUint8(byteOffset)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để đọc dữ liệu từ.

### Giá trị trả về

Một số nguyên từ 0 đến 255, bao gồm.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ đọc vượt quá cuối view.

## Ví dụ

### Sử dụng getUint8()

```js
const { buffer } = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const dataview = new DataView(buffer);
console.log(dataview.getUint8(1)); // 1
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Uint8Array")}}
