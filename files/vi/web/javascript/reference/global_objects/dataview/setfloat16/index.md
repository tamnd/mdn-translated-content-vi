---
title: DataView.prototype.setFloat16()
short-title: setFloat16()
slug: Web/JavaScript/Reference/Global_Objects/DataView/setFloat16
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.setFloat16
sidebar: jsref
---

Phương thức **`setFloat16()`** của các instance {{jsxref("DataView")}} nhận một số và lưu nó dưới dạng số dấu phẩy động 16-bit trong 2 byte bắt đầu từ offset byte được chỉ định của `DataView` này. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lưu tại bất kỳ offset nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.setFloat16()")}}

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
setFloat16(byteOffset, value)
setFloat16(byteOffset, value, littleEndian)
```

### Tham số

- `byteOffset`
  - : Offset tính bằng byte từ đầu view để lưu dữ liệu.
- `value`
  - : Giá trị cần đặt. Để biết cách giá trị được mã hóa trong các byte, xem [Value encoding and normalization](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#value_encoding_and_normalization).
- `littleEndian` {{optional_inline}}
  - : Cho biết liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu là `false` hoặc `undefined`, một giá trị big-endian sẽ được ghi.

### Giá trị trả về

{{jsxref("undefined")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `byteOffset` được đặt sao cho nó sẽ lưu vượt quá cuối view.

## Ví dụ

### Sử dụng setFloat16()

```js
const buffer = new ArrayBuffer(10);
const dataview = new DataView(buffer);
dataview.setFloat16(0, 3);
dataview.getFloat16(1); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `DataView.prototype.setFloat16` in `core-js`](https://github.com/zloirock/core-js#float16-methods)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("DataView")}}
- {{jsxref("ArrayBuffer")}}
- {{jsxref("Float16Array")}}
