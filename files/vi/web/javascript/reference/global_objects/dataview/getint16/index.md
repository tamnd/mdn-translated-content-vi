---
title: DataView.prototype.getInt16()
short-title: getInt16()
slug: Web/JavaScript/Reference/Global_Objects/DataView/getInt16
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.getInt16
sidebar: jsref
---

Phương thức **`getInt16()`** của các instance {{jsxref("DataView")}} đọc 2 byte bắt đầu tại độ lệch byte được chỉ định của `DataView` này và diễn giải chúng như một số nguyên có dấu 16-bit. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lấy từ bất kỳ độ lệch nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.getInt16()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view = new DataView(buffer);
view.setInt16(1, 32767); // Max signed 16-bit integer

console.log(view.getInt16(1));
// Expected output: 32767
```

## Cú pháp

```js-nolint
getInt16(byteOffset)
getInt16(byteOffset, littleEndian)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để đọc dữ liệu từ.
- `littleEndian` {{optional_inline}}
  - : Chỉ ra liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu `false` hoặc `undefined`, một giá trị big-endian được đọc.

### Giá trị trả về

Một số nguyên từ -32768 đến 32767, bao gồm.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ đọc vượt quá cuối view.

## Ví dụ

### Sử dụng getInt16()

```js
const { buffer } = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const dataview = new DataView(buffer);
console.log(dataview.getInt16(1)); // 258
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Int16Array")}}
