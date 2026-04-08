---
title: DataView.prototype.setBigInt64()
short-title: setBigInt64()
slug: Web/JavaScript/Reference/Global_Objects/DataView/setBigInt64
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.setBigInt64
sidebar: jsref
---

Phương thức **`setBigInt64()`** của các instance {{jsxref("DataView")}} nhận một BigInt và lưu trữ nó như một số nguyên có dấu 64-bit trong 8 byte bắt đầu tại độ lệch byte được chỉ định của `DataView` này. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lưu trữ tại bất kỳ độ lệch nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.setBigInt64()")}}

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
setBigInt64(byteOffset, value)
setBigInt64(byteOffset, value, littleEndian)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để lưu trữ dữ liệu vào.
- `value`
  - : Giá trị cần đặt dưới dạng {{jsxref("BigInt")}}. Để biết cách giá trị được mã hóa trong byte, xem [Mã hóa và chuẩn hóa giá trị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#value_encoding_and_normalization).
- `littleEndian` {{optional_inline}}
  - : Chỉ ra liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu `false` hoặc `undefined`, một giá trị big-endian được ghi.

### Giá trị trả về

{{jsxref("undefined")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ lưu trữ vượt quá cuối view.

## Ví dụ

### Sử dụng setBigInt64()

```js
const buffer = new ArrayBuffer(10);
const dataview = new DataView(buffer);
dataview.setBigInt64(0, 3n);
dataview.getBigInt64(1); // 768n
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
