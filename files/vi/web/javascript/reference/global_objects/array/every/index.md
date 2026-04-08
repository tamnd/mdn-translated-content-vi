---
title: Array.prototype.every()
short-title: every()
slug: Web/JavaScript/Reference/Global_Objects/Array/every
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.every
sidebar: jsref
---

Phương thức **`every()`** của các instance {{jsxref("Array")}} trả về `false` nếu tìm thấy một phần tử trong mảng không thỏa mãn hàm kiểm tra được cung cấp. Ngược lại, nó trả về `true`.

{{InteractiveExample("JavaScript Demo: Array.prototype.every()", "shorter")}}

```js interactive-example
const isBelowThreshold = (currentValue) => currentValue < 40;

const array1 = [1, 30, 39, 29, 10, 13];

console.log(array1.every(isBelowThreshold));
// Expected output: true
```

## Syntax

```js-nolint
every(callbackFn)
every(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ rằng phần tử vượt qua kiểm tra, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `every()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

`true` trừ khi `callbackFn` trả về một giá trị {{Glossary("falsy")}} cho một phần tử mảng, trong trường hợp đó `false` được trả về ngay lập tức.

## Description

Phương thức `every()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng, cho đến khi `callbackFn` trả về một giá trị [falsy](/en-US/docs/Glossary/Falsy). Nếu tìm thấy phần tử như vậy, `every()` ngay lập tức trả về `false` và dừng lặp qua mảng. Ngược lại, nếu `callbackFn` trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) cho tất cả các phần tử, `every()` trả về `true`. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`every` hoạt động như bộ định lượng "với mọi" trong toán học. Đặc biệt, với một mảng rỗng, nó trả về `true`. (Đây là [vacuously true](https://en.wikipedia.org/wiki/Vacuous_truth) rằng tất cả các phần tử của [tập rỗng](https://en.wikipedia.org/wiki/Empty_set#Properties) thỏa mãn bất kỳ điều kiện nào.)

`callbackFn` chỉ được gọi cho các chỉ số mảng đã được gán giá trị. Nó không được gọi cho các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `every()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Kiểm tra kích thước của tất cả phần tử mảng

Ví dụ sau kiểm tra xem tất cả các phần tử trong mảng có lớn hơn hoặc bằng 10 không.

```js
function isBigEnough(element, index, array) {
  return element >= 10;
}
[12, 5, 8, 130, 44].every(isBigEnough); // false
[12, 54, 18, 130, 44].every(isBigEnough); // true
```

### Kiểm tra xem một mảng có phải là tập con của mảng khác không

Ví dụ sau kiểm tra xem tất cả các phần tử của một mảng có xuất hiện trong mảng khác không.

```js
const isSubset = (array1, array2) =>
  array2.every((element) => array1.includes(element));

console.log(isSubset([1, 2, 3, 4, 5, 6, 7], [5, 7, 6])); // true
console.log(isSubset([1, 2, 3, 4, 5, 6, 7], [5, 8, 7])); // false
```

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `every()` để kiểm tra xem mảng có tăng dần nghiêm ngặt không.

```js
const numbers = [-2, 4, -8, 16, -32];
const isIncreasing = numbers
  .filter((num) => num > 0)
  .every((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx === 0) return true;
    return num > arr[idx - 1];
  });
console.log(isIncreasing); // true
```

### Dùng every() trên mảng thưa

`every()` sẽ không chạy predicate của nó trên các slot rỗng.

```js
console.log([1, , 3].every((x) => x !== undefined)); // true
console.log([2, , 2].every((x) => x === 2)); // true
```

### Gọi every() trên các đối tượng không phải mảng

Phương thức `every()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length` cho đến khi tất cả đã được truy cập hoặc `callbackFn` trả về `false`.

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: 345, // ignored by every() since length is 3
};
console.log(
  Array.prototype.every.call(arrayLike, (x) => typeof x === "string"),
); // true
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.every` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.every`](https://www.npmjs.com/package/array.prototype.every)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Array.prototype.some()")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("TypedArray.prototype.every()")}}
