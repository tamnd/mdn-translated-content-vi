---
title: DataView() constructor
short-title: DataView()
slug: Web/JavaScript/Reference/Global_Objects/DataView/DataView
page-type: javascript-constructor
browser-compat: javascript.builtins.DataView.DataView
sidebar: jsref
---

Constructor **`DataView()`** tạo các đối tượng {{jsxref("DataView")}}.

{{InteractiveExample("JavaScript Demo: DataView() constructor")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

// Create a couple of views
const view1 = new DataView(buffer);
const view2 = new DataView(buffer, 12, 4); // From byte 12 for the next 4 bytes
view1.setInt8(12, 42); // Put 42 in slot 12

console.log(view2.getInt8(0));
// Expected output: 42
```

## Cú pháp

```js-nolint
new DataView(buffer)
new DataView(buffer, byteOffset)
new DataView(buffer, byteOffset, byteLength)
```

> [!NOTE]
> `DataView()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `buffer`
  - : Một {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} hiện có để sử dụng làm vùng lưu trữ cho đối tượng `DataView` mới.
- `byteOffset` {{optional_inline}}
  - : Độ lệch, tính bằng byte, đến byte đầu tiên trong buffer trên để view mới tham chiếu đến. Nếu không được chỉ định, view buffer bắt đầu từ byte đầu tiên.
- `byteLength` {{optional_inline}}
  - : Số phần tử trong mảng byte. Nếu không được chỉ định, độ dài của view sẽ khớp với độ dài của buffer.

### Giá trị trả về

Một đối tượng {{jsxref("DataView")}} mới đại diện cho data buffer được chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu các giá trị tham số `byteOffset` hoặc `byteLength` dẫn đến view vượt quá cuối buffer. Nói cách khác, `byteOffset + byteLength > buffer.byteLength`.

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

- [Polyfill của `DataView` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- {{jsxref("DataView")}}
