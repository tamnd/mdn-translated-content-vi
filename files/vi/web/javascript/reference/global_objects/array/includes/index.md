---
title: Array.prototype.includes()
short-title: includes()
slug: Web/JavaScript/Reference/Global_Objects/Array/includes
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.includes
sidebar: jsref
---

Phương thức **`includes()`** của các đối tượng {{jsxref("Array")}} kiểm tra xem mảng có chứa một giá trị nhất định trong các phần tử của nó hay không, trả về `true` hoặc `false` tùy theo kết quả.

{{InteractiveExample("JavaScript Demo: Array.prototype.includes()")}}

```js interactive-example
const array = [1, 2, 3];

console.log(array.includes(2));
// Expected output: true

const pets = ["cat", "dog", "bat"];

console.log(pets.includes("cat"));
// Expected output: true

console.log(pets.includes("at"));
// Expected output: false
```

## Cú pháp

```js-nolint
includes(searchElement)
includes(searchElement, fromIndex)
```

### Tham số

- `searchElement`
  - : Giá trị cần tìm kiếm.
- `fromIndex` {{optional_inline}}
  - : Chỉ mục (dựa trên 0) để bắt đầu tìm kiếm, [được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion).
    - Chỉ mục âm đếm ngược từ cuối mảng — nếu `-array.length <= fromIndex < 0`, sẽ dùng `fromIndex + array.length`. Tuy nhiên, mảng vẫn được tìm kiếm từ đầu đến cuối trong trường hợp này.
    - Nếu `fromIndex < -array.length` hoặc `fromIndex` bị bỏ qua, sẽ dùng `0`, khiến toàn bộ mảng được tìm kiếm.
    - Nếu `fromIndex >= array.length`, mảng sẽ không được tìm kiếm và trả về `false`.

### Giá trị trả về

Một giá trị boolean là `true` nếu giá trị `searchElement` được tìm thấy trong mảng (hoặc phần mảng được chỉ định bởi chỉ mục `fromIndex`, nếu được chỉ định).

## Mô tả

Phương thức `includes()` so sánh `searchElement` với các phần tử của mảng bằng thuật toán [SameValueZero](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness#same-value-zero_equality). Các giá trị bằng không đều được coi là bằng nhau, bất kể dấu. (Tức là `-0` bằng `0`), nhưng `false` _không_ được coi là giống với `0`. [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) có thể được tìm kiếm chính xác.

Khi dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `includes()` lặp qua các ô trống như thể chúng có giá trị `undefined`.

Phương thức `includes()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Sử dụng includes()

```js
[1, 2, 3].includes(2); // true
[1, 2, 3].includes(4); // false
[1, 2, 3].includes(3, 3); // false
[1, 2, 3].includes(3, -1); // true
[1, 2, NaN].includes(NaN); // true
["1", "2", "3"].includes(3); // false
```

### fromIndex lớn hơn hoặc bằng độ dài mảng

Nếu `fromIndex` lớn hơn hoặc bằng độ dài mảng, sẽ trả về `false`. Mảng sẽ không được tìm kiếm.

```js
const arr = ["a", "b", "c"];

arr.includes("c", 3); // false
arr.includes("c", 100); // false
```

### Chỉ mục tính toán nhỏ hơn 0

Nếu `fromIndex` âm, chỉ mục tính toán sẽ được dùng làm vị trí trong mảng để bắt đầu tìm kiếm `searchElement`. Nếu chỉ mục tính toán nhỏ hơn hoặc bằng `0`, toàn bộ mảng sẽ được tìm kiếm.

```js
// array length is 3
// fromIndex is -100
// computed index is 3 + (-100) = -97

const arr = ["a", "b", "c"];

arr.includes("a", -100); // true
arr.includes("b", -100); // true
arr.includes("c", -100); // true
arr.includes("a", -2); // false
```

### Sử dụng includes() trên mảng thưa

Bạn có thể tìm kiếm `undefined` trong mảng thưa và nhận được `true`.

```js
console.log([1, , 3].includes(undefined)); // true
```

### Gọi includes() trên đối tượng không phải mảng

Phương thức `includes()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 1, // ignored by includes() since length is 3
};
console.log(Array.prototype.includes.call(arrayLike, 2));
// true
console.log(Array.prototype.includes.call(arrayLike, 1));
// false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.includes` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.includes`](https://www.npmjs.com/package/array-includes)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("TypedArray.prototype.includes()")}}
- {{jsxref("String.prototype.includes()")}}
