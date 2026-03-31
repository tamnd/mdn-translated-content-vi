---
title: TypedArray.prototype.keys()
short-title: keys()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/keys
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.keys
sidebar: jsref
---

Phương thức **`keys()`** của các thực thể {{jsxref("TypedArray")}} trả về một đối tượng _[iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các khóa cho mỗi chỉ số trong mảng được gõ kiểu. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.keys()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.keys()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
const keys = uint8.keys();

keys.next();
keys.next();

console.log(keys.next().value);
// Expected output: 2
```

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp lại](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Mô tả

Xem {{jsxref("Array.prototype.keys()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Lặp qua vòng lặp for...of

```js
const arr = new Uint8Array([10, 20, 30, 40, 50]);
const arrKeys = arr.keys();
for (const n of arrKeys) {
  console.log(n);
}
```

### Lặp theo cách khác

```js
const arr = new Uint8Array([10, 20, 30, 40, 50]);
const arrKeys = arr.keys();
console.log(arrKeys.next().value); // 0
console.log(arrKeys.next().value); // 1
console.log(arrKeys.next().value); // 2
console.log(arrKeys.next().value); // 3
console.log(arrKeys.next().value); // 4
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.keys` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.entries()")}}
- {{jsxref("TypedArray.prototype.values()")}}
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
- {{jsxref("Array.prototype.keys()")}}
- [Giao thức lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
