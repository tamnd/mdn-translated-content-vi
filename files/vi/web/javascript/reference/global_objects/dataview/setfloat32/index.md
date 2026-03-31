---
title: DataView.prototype.setFloat32()
short-title: setFloat32()
slug: Web/JavaScript/Reference/Global_Objects/DataView/setFloat32
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.setFloat32
sidebar: jsref
---

Phương thức **`setFloat32()`** của các instance {{jsxref("DataView")}} nhận một số và lưu trữ nó như một số dấu phẩy động 32-bit trong 4 byte bắt đầu tại độ lệch byte được chỉ định của `DataView` này. Không có ràng buộc căn chỉnh; các giá trị nhiều byte có thể được lưu trữ tại bất kỳ độ lệch nào trong giới hạn.

{{InteractiveExample("JavaScript Demo: DataView.prototype.setFloat32()")}}

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
setFloat32(byteOffset, value)
setFloat32(byteOffset, value, littleEndian)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để lưu trữ dữ liệu vào.
- `value`
  - : Giá trị cần đặt. Để biết cách giá trị được mã hóa trong byte, xem [Mã hóa và chuẩn hóa giá trị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#value_encoding_and_normalization).
- `littleEndian` {{optional_inline}}
  - : Chỉ ra liệu dữ liệu có được lưu trữ ở định dạng [little- hay big-endian](/en-US/docs/Glossary/Endianness). Nếu `false` hoặc `undefined`, một giá trị big-endian được ghi.

### Giá trị trả về

{{jsxref("undefined")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ lưu trữ vượt quá cuối view.

## Ví dụ

### Sử dụng setFloat32()

```js
const buffer = new ArrayBuffer(10);
const dataview = new DataView(buffer);
dataview.setFloat32(0, 3);
dataview.getFloat32(1); // 2
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
