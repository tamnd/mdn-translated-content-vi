---
title: DataView.prototype.setInt8()
short-title: setInt8()
slug: Web/JavaScript/Reference/Global_Objects/DataView/setInt8
page-type: javascript-instance-method
browser-compat: javascript.builtins.DataView.setInt8
sidebar: jsref
---

Phương thức **`setInt8()`** của các instance {{jsxref("DataView")}} nhận một số và lưu trữ nó như một số nguyên có dấu 8-bit trong byte tại độ lệch byte được chỉ định của `DataView` này.

{{InteractiveExample("JavaScript Demo: DataView.prototype.setInt8()")}}

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
setInt8(byteOffset, value)
```

### Tham số

- `byteOffset`
  - : Độ lệch, tính bằng byte, từ đầu view để lưu trữ dữ liệu vào.
- `value`
  - : Giá trị cần đặt. Để biết cách giá trị được mã hóa trong byte, xem [Mã hóa và chuẩn hóa giá trị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#value_encoding_and_normalization).

### Giá trị trả về

{{jsxref("undefined")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `byteOffset` được đặt sao cho nó sẽ lưu trữ vượt quá cuối view.

## Ví dụ

### Sử dụng setInt8()

```js
const buffer = new ArrayBuffer(10);
const dataview = new DataView(buffer);
dataview.setInt8(0, 3);
dataview.getInt8(0); // 3
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
