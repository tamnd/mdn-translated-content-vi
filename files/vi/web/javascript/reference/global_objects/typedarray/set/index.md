---
title: TypedArray.prototype.set()
short-title: set()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/set
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.set
sidebar: jsref
---

Phương thức **`set()`** của các thực thể {{jsxref("TypedArray")}} lưu trữ nhiều giá trị trong mảng được gõ kiểu, đọc các giá trị đầu vào từ một mảng được chỉ định.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.set()")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);
const uint8 = new Uint8Array(buffer);

// Copy the values into the array starting at index 3
uint8.set([1, 2, 3], 3);

console.log(uint8);
// Expected output: Uint8Array [0, 0, 0, 1, 2, 3, 0, 0]
```

## Cú pháp

```js-nolint
set(array)
set(array, targetOffset)

set(typedarray)
set(typedarray, targetOffset)
```

### Tham số

- `array`
  - : Mảng từ đó sao chép các giá trị. Tất cả các giá trị từ mảng nguồn được sao chép vào mảng đích, trừ khi độ dài của mảng nguồn cộng với offset đích vượt quá độ dài của mảng đích, trong trường hợp đó một ngoại lệ sẽ được ném.
- `typedarray`
  - : Nếu mảng nguồn là mảng được gõ kiểu, hai mảng có thể chia sẻ cùng một {{jsxref("ArrayBuffer")}} bên dưới; JavaScript engine sẽ **sao chép** thông minh phạm vi nguồn của bộ đệm đến phạm vi đích.
- `targetOffset` {{optional_inline}}
  - : Độ lệch vào mảng đích để bắt đầu ghi các giá trị từ mảng nguồn. Nếu giá trị này bị bỏ qua, 0 được giả định (tức là mảng nguồn sẽ ghi đè các giá trị trong mảng đích bắt đầu từ chỉ số 0).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Một phần tử sẽ được lưu trữ vượt quá cuối mảng được gõ kiểu, do `targetOffset` quá lớn hoặc do `array` hoặc `typedarray` quá lớn.
    - `targetOffset` là âm.

## Ví dụ

### Sử dụng set()

```js
const buffer = new ArrayBuffer(8);
const uint8 = new Uint8Array(buffer);

uint8.set([1, 2, 3], 3);

console.log(uint8); // Uint8Array [ 0, 0, 0, 1, 2, 3, 0, 0 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.set` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
