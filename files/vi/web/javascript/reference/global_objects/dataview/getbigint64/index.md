---
title: DataView.prototype.getBigInt64()
short-title: getBigInt64()
slug: Web/JavaScript/Reference/Global_Objects/DataView/getBigInt64
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.getBigInt64
sidebar: jsref
---

Phương thức **`getBigInt64()`** của các instance {{jsxref("DataView")}} đọc 8 byte bắt đầu tại độ lệch byte được chỉ định của `DataView` này và diễn giải chúng như một số nguyên có dấu 64-bit. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lấy từ bất kỳ độ lệch nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.getBigInt64()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

// Highest possible BigInt value that fits in a signed 64-bit integer
const max = 2n ** (64n - 1n) - 1n;

const view = new DataView(buffer);
view.setBigInt64(1, max);

console.log(view.getBigInt64(1));
// Expected output: 9223372036854775807n
```

## Cú pháp

```js-nolint
getBigInt64(byteOffset)
getBigInt64(byteOffset, littleEndian)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để đọc dữ liệu từ.
- `littleEndian` {{optional_inline}}
  - : Chỉ ra liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu `false` hoặc `undefined`, một giá trị big-endian được đọc.

### Giá trị trả về

Một {{jsxref("BigInt")}} từ -2<sup>63</sup> đến 2<sup>63</sup>-1, bao gồm.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ đọc vượt quá cuối view.

## Ví dụ

### Sử dụng getBigInt64()

```js
const { buffer } = new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const dataview = new DataView(buffer);
console.log(dataview.getBigInt64(1)); // 72623859790382856n
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("BigInt64Array")}}
