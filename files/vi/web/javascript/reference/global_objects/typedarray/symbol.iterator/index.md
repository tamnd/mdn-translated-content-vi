---
title: TypedArray.prototype[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.@@iterator
sidebar: jsref
---

Phương thức **`[Symbol.iterator]()`** của các thực thể {{jsxref("TypedArray")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép mảng được gõ kiểu được sử dụng bởi hầu hết các cú pháp mong đợi iterable, chẳng hạn như [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về một [đối tượng iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) trả về giá trị của mỗi chỉ số trong mảng được gõ kiểu.

Giá trị ban đầu của thuộc tính này giống như đối tượng hàm ban đầu của thuộc tính {{jsxref("TypedArray.prototype.values")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype[Symbol.iterator]()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30]);
const iterator = uint8[Symbol.iterator]();

for (const value of iterator) {
  console.log(value);
}

// Expected output: 10
// Expected output: 20
// Expected output: 30
```

## Cú pháp

```js-nolint
typedArray[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị trả về giống như {{jsxref("TypedArray.prototype.values()")}}: một [đối tượng iterator có thể lặp lại](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới trả về giá trị của mỗi chỉ số trong mảng được gõ kiểu.

## Ví dụ

### Lặp qua vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` làm cho mảng được gõ kiểu [có thể lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp lặp như vòng lặp `for...of` sẽ tự động gọi phương thức này để lấy iterator để lặp qua.

```js
const arr = new Uint8Array([10, 20, 30, 40, 50]);
for (const n of arr) {
  console.log(n);
}
```

### Điều khiển iterator thủ công

Bạn vẫn có thể gọi thủ công phương thức `next()` của đối tượng iterator được trả về để đạt được sự kiểm soát tối đa đối với quá trình lặp.

```js
const arr = new Uint8Array([10, 20, 30, 40, 50]);
const arrIter = arr[Symbol.iterator]();
console.log(arrIter.next().value); // 10
console.log(arrIter.next().value); // 20
console.log(arrIter.next().value); // 30
console.log(arrIter.next().value); // 40
console.log(arrIter.next().value); // 50
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype[Symbol.iterator]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.entries()")}}
- {{jsxref("TypedArray.prototype.keys()")}}
- {{jsxref("TypedArray.prototype.values()")}}
- {{jsxref("Symbol.iterator")}}
- [Giao thức lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
