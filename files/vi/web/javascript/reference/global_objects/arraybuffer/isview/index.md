---
title: ArrayBuffer.isView()
short-title: isView()
slug: Web/JavaScript/Reference/Global_Objects/ArrayBuffer/isView
page-type: javascript-static-method
browser-compat: javascript.builtins.ArrayBuffer.isView
sidebar: jsref
---

Phương thức tĩnh **`ArrayBuffer.isView()`** xác định xem giá trị được truyền vào có phải là một trong các view `ArrayBuffer`, chẳng hạn như [các đối tượng mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) hay {{jsxref("DataView")}} hay không.

{{InteractiveExample("JavaScript Demo: ArrayBuffer.isView()", "shorter")}}

```js interactive-example
// Create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(16);

console.log(ArrayBuffer.isView(new Int32Array()));
// Expected output: true
```

## Cú pháp

```js-nolint
ArrayBuffer.isView(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra.

### Giá trị trả về

`true` nếu đối số đã cho là một trong các view {{jsxref("ArrayBuffer")}}; ngược lại là `false`.

## Ví dụ

### Sử dụng isView

```js
ArrayBuffer.isView(); // false
ArrayBuffer.isView([]); // false
ArrayBuffer.isView({}); // false
ArrayBuffer.isView(null); // false
ArrayBuffer.isView(undefined); // false
ArrayBuffer.isView(new ArrayBuffer(10)); // false

ArrayBuffer.isView(new Uint8Array()); // true
ArrayBuffer.isView(new Float32Array()); // true
ArrayBuffer.isView(new Int8Array(10).subarray(0, 3)); // true

const buffer = new ArrayBuffer(2);
const dv = new DataView(buffer);
ArrayBuffer.isView(dv); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
