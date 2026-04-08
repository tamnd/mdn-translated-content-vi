---
title: TypedArray.of()
short-title: of()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/of
page-type: javascript-static-method
browser-compat: javascript.builtins.TypedArray.of
sidebar: jsref
---

Phương thức tĩnh **`TypedArray.of()`** tạo một [mảng được gõ kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray#typedarray_objects) mới từ một số lượng đối số biến đổi. Phương thức này gần giống như {{jsxref("Array.of()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.of()", "shorter")}}

```js interactive-example
const int16array = Int16Array.of("10", "20", "30", "40", "50");

console.log(int16array);
// Expected output: Int16Array [10, 20, 30, 40, 50]
```

## Cú pháp

```js-nolint
TypedArray.of()
TypedArray.of(element1)
TypedArray.of(element1, element2)
TypedArray.of(element1, element2, /* …, */ elementN)
```

Trong đó `TypedArray` là một trong số:

- {{jsxref("Int8Array")}}
- {{jsxref("Uint8Array")}}
- {{jsxref("Uint8ClampedArray")}}
- {{jsxref("Int16Array")}}
- {{jsxref("Uint16Array")}}
- {{jsxref("Int32Array")}}
- {{jsxref("Uint32Array")}}
- {{jsxref("Float16Array")}}
- {{jsxref("Float32Array")}}
- {{jsxref("Float64Array")}}
- {{jsxref("BigInt64Array")}}
- {{jsxref("BigUint64Array")}}

### Tham số

- `element1`, …, `elementN`
  - : Các phần tử được sử dụng để tạo mảng được gõ kiểu.

### Giá trị trả về

Một thực thể {{jsxref("TypedArray")}} mới.

## Mô tả

Xem {{jsxref("Array.of()")}} để biết thêm chi tiết. Có một số khác biệt tinh tế giữa {{jsxref("Array.of()")}} và `TypedArray.of()`:

- Nếu giá trị `this` được truyền vào `TypedArray.of()` không phải là constructor, `TypedArray.of()` sẽ ném {{jsxref("TypeError")}}, trong khi `Array.of()` mặc định tạo một {{jsxref("Array")}} mới.
- `TypedArray.of()` sử dụng `[[Set]]` trong khi `Array.of()` sử dụng `[[DefineOwnProperty]]`. Do đó, khi làm việc với các đối tượng {{jsxref("Proxy")}}, nó gọi [`handler.set()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/set) để tạo các phần tử mới thay vì [`handler.defineProperty()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty).

## Ví dụ

### Sử dụng of()

```js
Uint8Array.of(1); // Uint8Array [ 1 ]
Int8Array.of("1", "2", "3"); // Int8Array [ 1, 2, 3 ]
Float32Array.of(1, 2, 3); // Float32Array [ 1, 2, 3 ]
Int16Array.of(undefined); // Int16Array [ 0 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.of` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.from()")}}
- {{jsxref("Array.of()")}}
