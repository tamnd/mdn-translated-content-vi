---
title: ArrayBuffer() constructor
short-title: ArrayBuffer()
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/ArrayBuffer
page-type: javascript-constructor
browser-compat: javascript.builtins.ArrayBuffer.ArrayBuffer
sidebar: jsref
---

Constructor **`ArrayBuffer()`** tạo các đối tượng {{jsxref("ArrayBuffer")}}.

{{InteractiveExample("JavaScript Demo: ArrayBuffer() constructor", "shorter")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);

console.log(buffer.byteLength);
// Expected output: 8
```

## Cú pháp

```js-nolint
new ArrayBuffer(length)
new ArrayBuffer(length, options)
```

> [!NOTE]
> `ArrayBuffer()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `length`
  - : Kích thước, tính bằng byte, của array buffer cần tạo.
- `options` {{optional_inline}}
  - : Một đối tượng, có thể chứa các thuộc tính sau:
    - `maxByteLength` {{optional_inline}}
      - : Kích thước tối đa, tính bằng byte, mà array buffer có thể được thay đổi kích thước đến.

### Giá trị trả về

Một đối tượng `ArrayBuffer` mới có kích thước được chỉ định, với thuộc tính {{jsxref("ArrayBuffer/maxByteLength", "maxByteLength")}} của nó được đặt thành `maxByteLength` được chỉ định nếu có được chỉ định. Nội dung của nó được khởi tạo thành 0.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `length` hoặc `maxByteLength` lớn hơn {{jsxref("Number.MAX_SAFE_INTEGER")}} (≥ 2<sup>53</sup>) hoặc âm.
    - `length` lớn hơn `maxByteLength`.

## Ví dụ

### Tạo một ArrayBuffer

Trong ví dụ này, chúng ta tạo một buffer 8 byte với view {{jsxref("Int32Array")}} tham chiếu đến buffer:

```js
const buffer = new ArrayBuffer(8);
const view = new Int32Array(buffer);
```

### Tạo một ArrayBuffer có thể thay đổi kích thước

Trong ví dụ này, chúng ta tạo một buffer 8 byte có thể thay đổi kích thước đến tối đa 16 byte, sau đó {{jsxref("ArrayBuffer/resize", "resize()")}} nó lên 12 byte:

```js
const buffer = new ArrayBuffer(8, { maxByteLength: 16 });

buffer.resize(12);
```

> [!NOTE]
> Khuyến nghị rằng `maxByteLength` được đặt thành giá trị nhỏ nhất có thể cho trường hợp sử dụng của bạn. Nó không bao giờ nên vượt quá `1073741824` (1GB) để giảm nguy cơ lỗi hết bộ nhớ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `ArrayBuffer` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("SharedArrayBuffer")}}
