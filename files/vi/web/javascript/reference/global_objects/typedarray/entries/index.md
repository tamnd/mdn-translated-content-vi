---
title: TypedArray.prototype.entries()
short-title: entries()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/entries
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.entries
sidebar: jsref
---

Phương thức **`entries()`** của các thực thể {{jsxref("TypedArray")}} trả về một đối tượng _[iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các cặp khóa/giá trị cho mỗi chỉ số trong mảng được gõ kiểu. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.entries()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.entries()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);
const eArr = uint8.entries();

eArr.next();
eArr.next();

console.log(eArr.next().value);
// Expected output: Array [2, 30]
```

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator có thể lặp lại](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Mô tả

Xem {{jsxref("Array.prototype.entries()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Lặp qua vòng lặp for...of

```js
const array = new Uint8Array([10, 20, 30, 40, 50]);
const arrayEntries = arr.entries();
for (const element of arrayEntries) {
  console.log(element);
}
```

### Lặp theo cách khác

```js
const array = new Uint8Array([10, 20, 30, 40, 50]);
const arrayEntries = arr.entries();

console.log(arrayEntries.next().value); // [0, 10]
console.log(arrayEntries.next().value); // [1, 20]
console.log(arrayEntries.next().value); // [2, 30]
console.log(arrayEntries.next().value); // [3, 40]
console.log(arrayEntries.next().value); // [4, 50]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.entries` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.keys()")}}
- {{jsxref("TypedArray.prototype.values()")}}
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
- {{jsxref("Array.prototype.entries()")}}
- [Giao thức lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
