---
title: TypedArray.prototype.values()
short-title: values()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/values
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.values
sidebar: jsref
---

Phương thức **`values()`** của các thực thể {{jsxref("TypedArray")}} trả về một đối tượng _[iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới lặp qua giá trị của mỗi mục trong mảng được gõ kiểu. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.values()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.values()")}}

```js interactive-example
const bytes = new Uint8Array([10, 20, 30, 40, 50]);
const iterator = bytes.values();

iterator.next();
iterator.next();

console.log(iterator.next().value);
// Expected output: 30
```

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp lại](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Mô tả

Xem {{jsxref("Array.prototype.values()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Lặp qua vòng lặp for...of

```js
const arr = new Uint8Array([10, 20, 30, 40, 50]);
const values = arr.values();
for (const n of values) {
  console.log(n);
}
```

### Lặp theo cách khác

```js
const arr = new Uint8Array([10, 20, 30, 40, 50]);
const values = arr.values();
console.log(values.next().value); // 10
console.log(values.next().value); // 20
console.log(values.next().value); // 30
console.log(values.next().value); // 40
console.log(values.next().value); // 50
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.values` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.entries()")}}
- {{jsxref("TypedArray.prototype.keys()")}}
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
- {{jsxref("Array.prototype.values()")}}
- [Giao thức lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
