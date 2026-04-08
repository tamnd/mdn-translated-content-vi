---
title: TypedArray.BYTES_PER_ELEMENT
short-title: BYTES_PER_ELEMENT
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT
page-type: javascript-static-data-property
browser-compat: javascript.builtins.TypedArray.BYTES_PER_ELEMENT
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`TypedArray.BYTES_PER_ELEMENT`** biểu thị kích thước tính bằng byte của mỗi phần tử trong một mảng được gõ kiểu.

{{InteractiveExample("JavaScript Demo: TypedArray.BYTES_PER_ELEMENT", "shorter")}}

```js interactive-example
console.log(Float64Array.BYTES_PER_ELEMENT);
// Expected output: 8

console.log(Int8Array.BYTES_PER_ELEMENT);
// Expected output: 1
```

## Giá trị

Một số có giá trị phụ thuộc vào loại `TypedArray`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Các đối tượng `TypedArray` khác nhau ở số byte mỗi phần tử và cách các byte được giải thích. Hằng số `BYTES_PER_ELEMENT` chứa số byte mỗi phần tử trong `TypedArray` đã cho.

Thuộc tính `BYTES_PER_ELEMENT` vừa là _thuộc tính thực thể_ vừa là _thuộc tính tĩnh_. Nó có sẵn trên cả các constructor lớp con `TypedArray` và trên các thực thể của những constructor đó.

Là thuộc tính thực thể, `BYTES_PER_ELEMENT` được định nghĩa trên `prototype` của constructor.

```js
console.log(Object.hasOwn(Int8Array.prototype, "BYTES_PER_ELEMENT")); // true
```

## Ví dụ

### Sử dụng BYTES_PER_ELEMENT

Là thuộc tính tĩnh:

```js
Int8Array.BYTES_PER_ELEMENT; // 1
Uint8Array.BYTES_PER_ELEMENT; // 1
Uint8ClampedArray.BYTES_PER_ELEMENT; // 1
Int16Array.BYTES_PER_ELEMENT; // 2
Uint16Array.BYTES_PER_ELEMENT; // 2
Float16Array.BYTES_PER_ELEMENT; // 2
Int32Array.BYTES_PER_ELEMENT; // 4
Uint32Array.BYTES_PER_ELEMENT; // 4
Float32Array.BYTES_PER_ELEMENT; // 4
Float64Array.BYTES_PER_ELEMENT; // 8
BigInt64Array.BYTES_PER_ELEMENT; // 8
BigUint64Array.BYTES_PER_ELEMENT; // 8
```

Là thuộc tính thực thể:

```js
new Int8Array([]).BYTES_PER_ELEMENT; // 1
new Uint8Array([]).BYTES_PER_ELEMENT; // 1
new Uint8ClampedArray([]).BYTES_PER_ELEMENT; // 1
new Int16Array([]).BYTES_PER_ELEMENT; // 2
new Uint16Array([]).BYTES_PER_ELEMENT; // 2
new Float16Array([]).BYTES_PER_ELEMENT; // 2
new Int32Array([]).BYTES_PER_ELEMENT; // 4
new Uint32Array([]).BYTES_PER_ELEMENT; // 4
new Float32Array([]).BYTES_PER_ELEMENT; // 4
new Float64Array([]).BYTES_PER_ELEMENT; // 8
new BigInt64Array([]).BYTES_PER_ELEMENT; // 8
new BigUint64Array([]).BYTES_PER_ELEMENT; // 8
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
