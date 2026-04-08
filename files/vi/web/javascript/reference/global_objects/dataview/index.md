---
title: DataView
slug: Web/JavaScript/Reference/Global_Objects/DataView
page-type: javascript-class
browser-compat: javascript.builtins.DataView
sidebar: jsref
---

Khung nhìn **`DataView`** cung cấp giao diện cấp thấp để đọc và ghi nhiều kiểu số trong {{jsxref("ArrayBuffer")}} nhị phân, mà không cần quan tâm đến [thứ tự byte (endianness)](/en-US/docs/Glossary/Endianness) của nền tảng.

## Mô tả

### Endianness

Các định dạng số nhiều byte được biểu diễn trong bộ nhớ khác nhau tùy theo kiến trúc máy — xem [Endianness](/en-US/docs/Glossary/Endianness) để giải thích. Các bộ truy cập `DataView` cung cấp kiểm soát rõ ràng cách dữ liệu được truy cập, bất kể thứ tự byte của máy tính đang thực thi. Ví dụ, bộ nhớ [WebAssembly](/en-US/docs/WebAssembly) luôn là little-endian, vì vậy bạn nên sử dụng `DataView` thay vì mảng được gõ kiểu để đọc và ghi các giá trị nhiều byte. Xem [`WebAssembly.Memory`](/en-US/docs/WebAssembly/Reference/JavaScript_interface/Memory) để có ví dụ.

```js
const littleEndian = (() => {
  const buffer = new ArrayBuffer(2);
  new DataView(buffer).setInt16(0, 256, true /* littleEndian */);
  // Int16Array uses the platform's endianness.
  return new Int16Array(buffer)[0] === 256;
})();
console.log(littleEndian); // true or false
```

> [!NOTE]
> `DataView` mặc định đọc và ghi theo big-endian, nhưng hầu hết các nền tảng sử dụng little-endian.

## Constructor

- {{jsxref("DataView/DataView", "DataView()")}}
  - : Tạo đối tượng `DataView` mới.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `DataView.prototype` và được chia sẻ bởi tất cả các instance `DataView`.

- {{jsxref("DataView.prototype.buffer")}}
  - : Trả về {{jsxref("ArrayBuffer")}} được tham chiếu bởi `DataView`.
- {{jsxref("DataView.prototype.byteLength")}}
  - : Trả về độ dài (tính bằng byte) của `DataView`.
- {{jsxref("DataView.prototype.byteOffset")}}
  - : Trả về độ lệch (tính bằng byte) của `DataView` từ đầu {{jsxref("ArrayBuffer")}} của nó.
- {{jsxref("Object/constructor", "DataView.prototype.constructor")}}
  - : Hàm constructor đã tạo đối tượng instance. Đối với các instance `DataView`, giá trị khởi tạo là constructor {{jsxref("DataView/DataView", "DataView")}}.
- `DataView.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"DataView"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("DataView.prototype.getBigInt64()")}}
  - : Đọc 8 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số nguyên có dấu 64-bit.
- {{jsxref("DataView.prototype.getBigUint64()")}}
  - : Đọc 8 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số nguyên không dấu 64-bit.
- {{jsxref("DataView.prototype.getFloat16()")}}
  - : Đọc 2 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số dấu phẩy động 16-bit.
- {{jsxref("DataView.prototype.getFloat32()")}}
  - : Đọc 4 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số dấu phẩy động 32-bit.
- {{jsxref("DataView.prototype.getFloat64()")}}
  - : Đọc 8 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số dấu phẩy động 64-bit.
- {{jsxref("DataView.prototype.getInt16()")}}
  - : Đọc 2 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số nguyên có dấu 16-bit.
- {{jsxref("DataView.prototype.getInt32()")}}
  - : Đọc 4 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số nguyên có dấu 32-bit.
- {{jsxref("DataView.prototype.getInt8()")}}
  - : Đọc 1 byte tại độ lệch byte được chỉ định của `DataView` này và diễn giải nó là số nguyên có dấu 8-bit.
- {{jsxref("DataView.prototype.getUint16()")}}
  - : Đọc 2 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số nguyên không dấu 16-bit.
- {{jsxref("DataView.prototype.getUint32()")}}
  - : Đọc 4 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này và diễn giải chúng là số nguyên không dấu 32-bit.
- {{jsxref("DataView.prototype.getUint8()")}}
  - : Đọc 1 byte tại độ lệch byte được chỉ định của `DataView` này và diễn giải nó là số nguyên không dấu 8-bit.
- {{jsxref("DataView.prototype.setBigInt64()")}}
  - : Nhận BigInt và lưu trữ nó như số nguyên có dấu 64-bit trong 8 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setBigUint64()")}}
  - : Nhận BigInt và lưu trữ nó như số nguyên không dấu 64-bit trong 8 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setFloat16()")}}
  - : Nhận số và lưu trữ nó như số thực 16-bit trong 2 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setFloat32()")}}
  - : Nhận số và lưu trữ nó như số thực 32-bit trong 4 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setFloat64()")}}
  - : Nhận số và lưu trữ nó như số thực 64-bit trong 8 byte bắt đầu từ độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setInt16()")}}
  - : Nhận số và lưu trữ nó như số nguyên có dấu 16-bit trong 2 byte tại độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setInt32()")}}
  - : Nhận số và lưu trữ nó như số nguyên có dấu 32-bit trong 4 byte tại độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setInt8()")}}
  - : Nhận số và lưu trữ nó như số nguyên có dấu 8-bit trong byte tại độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setUint16()")}}
  - : Nhận số và lưu trữ nó như số nguyên không dấu 16-bit trong 2 byte tại độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setUint32()")}}
  - : Nhận số và lưu trữ nó như số nguyên không dấu 32-bit trong 4 byte tại độ lệch byte được chỉ định của `DataView` này.
- {{jsxref("DataView.prototype.setUint8()")}}
  - : Nhận số và lưu trữ nó như số nguyên không dấu 8-bit trong byte tại độ lệch byte được chỉ định của `DataView` này.

## Ví dụ

### Sử dụng DataView

```js
const buffer = new ArrayBuffer(16);
const view = new DataView(buffer, 0);

view.setInt16(1, 42);
view.getInt16(1); // 42
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `DataView` in `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- {{jsxref("ArrayBuffer")}}
- {{jsxref("SharedArrayBuffer")}}
