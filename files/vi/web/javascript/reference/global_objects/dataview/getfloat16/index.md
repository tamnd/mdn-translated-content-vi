---
title: DataView.prototype.getFloat16()
short-title: getFloat16()
slug: Web/JavaScript/Reference/Global_Objects/DataView/getFloat16
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.getFloat16
sidebar: jsref
---

Phương thức **`getFloat16()`** của các instance {{jsxref("DataView")}} đọc 2 byte bắt đầu từ offset byte được chỉ định của `DataView` này và diễn giải chúng như một số dấu phẩy động 16-bit. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lấy từ bất kỳ offset nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.getFloat16()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

const view = new DataView(buffer);
view.setFloat16(1, Math.PI);

console.log(view.getFloat16(1));
// Expected output: 3.140625
```

## Cú pháp

```js-nolint
getFloat16(byteOffset)
getFloat16(byteOffset, littleEndian)
```

### Tham số

- `byteOffset`
  - : Offset tính bằng byte từ đầu view để đọc dữ liệu.
- `littleEndian` {{optional_inline}}
  - : Cho biết liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu là `false` hoặc `undefined`, một giá trị big-endian sẽ được đọc.

### Giá trị trả về

Một số dấu phẩy động từ `-65504` đến `65504`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `byteOffset` được đặt sao cho nó sẽ đọc vượt quá cuối view.

## Ví dụ

### Sử dụng getFloat16()

```js
const { buffer } = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const dataview = new DataView(buffer);
console.log(dataview.getFloat16(1)); // 0.00001537799835205078
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `DataView.prototype.getFloat16` in `core-js`](https://github.com/zloirock/core-js#float16-methods)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Float16Array")}}
