---
title: DataView.prototype.getFloat32()
short-title: getFloat32()
slug: Web/JavaScript/Reference/Global_Objects/DataView/getFloat32
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.getFloat32
sidebar: jsref
---

Phương thức **`getFloat32()`** của các instance {{jsxref("DataView")}} đọc 4 byte bắt đầu tại độ lệch byte được chỉ định của `DataView` này và diễn giải chúng như một số dấu phẩy động 32-bit. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lấy từ bất kỳ độ lệch nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.getFloat32()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view = new DataView(buffer);
view.setFloat32(1, Math.PI);

console.log(view.getFloat32(1));
// Expected output: 3.1415927410125732
```

## Cú pháp

```js-nolint
getFloat32(byteOffset)
getFloat32(byteOffset, littleEndian)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để đọc dữ liệu từ.
- `littleEndian` {{optional_inline}}
  - : Chỉ ra liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu `false` hoặc `undefined`, một giá trị big-endian được đọc.

### Giá trị trả về

Một số dấu phẩy động từ `-3.4e38` đến `3.4e38`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ đọc vượt quá cuối view.

## Ví dụ

### Sử dụng getFloat32()

```js
const { buffer } = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const dataview = new DataView(buffer);
console.log(dataview.getFloat32(1)); // 2.387939260590663e-38
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Float32Array")}}
