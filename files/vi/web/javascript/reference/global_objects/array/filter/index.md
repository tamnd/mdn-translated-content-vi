---
title: Array.prototype.filter()
short-title: filter()
slug: Web/JavaScript/Reference/Global_Objects/Array/filter
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.filter
sidebar: jsref
---

Phương thức **`filter()`** của các instance {{jsxref("Array")}} tạo ra một [bản sao nông (shallow copy)](/en-US/docs/Glossary/Shallow_copy) của một phần của mảng đã cho, được lọc xuống chỉ còn các phần tử từ mảng đã cho vượt qua bài kiểm tra được thực hiện bởi hàm được cung cấp.

{{InteractiveExample("JavaScript Demo: Array.prototype.filter()", "shorter")}}

```js interactive-example
const words = ["spray", "elite", "exuberant", "destruction", "present"];

const result = words.filter((word) => word.length > 6);

console.log(result);
// Expected output: Array ["exuberant", "destruction", "present"]
```

## Syntax

```js-nolint
filter(callbackFn)
filter(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để giữ phần tử trong mảng kết quả, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `filter()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Một [bản sao nông (shallow copy)](/en-US/docs/Glossary/Shallow_copy) của mảng đã cho chỉ chứa các phần tử vượt qua bài kiểm tra. Nếu không có phần tử nào vượt qua bài kiểm tra, một mảng rỗng được trả về.

## Description

Phương thức `filter()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng, và tạo một mảng mới gồm tất cả các giá trị mà `callbackFn` trả về giá trị [truthy](/en-US/docs/Glossary/Truthy). Các phần tử mảng không vượt qua bài kiểm tra `callbackFn` sẽ không được bao gồm trong mảng mới. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` chỉ được gọi cho các chỉ số mảng đã được gán giá trị. Nó không được gọi cho các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `filter()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Lọc bỏ tất cả các giá trị nhỏ

Ví dụ sau dùng `filter()` để tạo mảng được lọc đã loại bỏ tất cả các phần tử có giá trị nhỏ hơn 10.

```js
function isBigEnough(value) {
  return value >= 10;
}

const filtered = [12, 5, 8, 130, 44].filter(isBigEnough);
// filtered is [12, 130, 44]
```

### Tìm tất cả số nguyên tố trong mảng

Ví dụ sau trả về tất cả các số nguyên tố trong mảng:

```js
const array = [-3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

function isPrime(n) {
  if (n < 2) {
    return false;
  }
  if (n % 2 === 0) {
    return n === 2;
  }
  for (let factor = 3; factor * factor <= n; factor += 2) {
    if (n % factor === 0) {
      return false;
    }
  }
  return true;
}

console.log(array.filter(isPrime)); // [2, 3, 5, 7, 11, 13]
```

> [!NOTE]
> Cài đặt `isPrime()` này chỉ dùng cho mục đích minh họa. Với ứng dụng thực tế, bạn nên dùng một thuật toán được ghi nhớ (memoized) nhiều như [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

### Lọc các đối tượng không hợp lệ khỏi mảng đối tượng

Ví dụ sau dùng `filter()` để tạo mảng được lọc gồm tất cả các đối tượng có `id` là số khác không.

```js
const arr = [
  { id: 15 },
  { id: -1 },
  { id: 0 },
  { id: 3 },
  { id: 12.2 },
  {},
  { id: null },
  { id: NaN },
  { id: "undefined" },
];

let invalidEntries = 0;

function filterByID(item) {
  if (Number.isFinite(item.id) && item.id !== 0) {
    return true;
  }
  invalidEntries++;
  return false;
}

const arrByID = arr.filter(filterByID);

console.log("Filtered Array\n", arrByID);
// Filtered Array
// [{ id: 15 }, { id: -1 }, { id: 3 }, { id: 12.2 }]

console.log("Number of Invalid Entries =", invalidEntries);
// Number of Invalid Entries = 5
```

### Tìm kiếm trong mảng

Ví dụ sau dùng `filter()` để lọc nội dung mảng dựa trên tiêu chí tìm kiếm.

```js
const fruits = ["apple", "banana", "grapes", "mango", "orange"];

/**
 * Filter array items based on search criteria (query)
 */
function filterItems(arr, query) {
  return arr.filter((el) => el.toLowerCase().includes(query.toLowerCase()));
}

console.log(filterItems(fruits, "ap")); // ['apple', 'grapes']
console.log(filterItems(fruits, "an")); // ['banana', 'mango', 'orange']
```

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `map()` để trích xuất ID số từ mỗi tên và sau đó dùng `filter()` để chọn các ID lớn hơn các láng giềng của nó.

```js
const names = ["JC63", "Bob132", "Ursula89", "Ben96"];
const greatIDs = names
  .map((name) => parseInt(name.match(/\d+/)[0], 10))
  .filter((id, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx > 0 && id <= arr[idx - 1]) return false;
    if (idx < arr.length - 1 && id <= arr[idx + 1]) return false;
    return true;
  });
console.log(greatIDs); // [132, 96]
```

Đối số `array` _không phải_ là mảng đang được xây dựng — không có cách nào để truy cập mảng đang được xây dựng từ hàm callback.

### Dùng filter() trên mảng thưa

`filter()` sẽ bỏ qua các slot rỗng.

```js
console.log([1, , undefined].filter((x) => x === undefined)); // [undefined]
console.log([1, , undefined].filter((x) => x !== 2)); // [1, undefined]
```

### Gọi filter() trên các đối tượng không phải mảng

Phương thức `filter()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: "a", // ignored by filter() since length is 3
};
console.log(Array.prototype.filter.call(arrayLike, (x) => x <= "b"));
// [ 'a', 'b' ]
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.filter` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.filter`](https://www.npmjs.com/package/array.prototype.filter)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.forEach()")}}
- {{jsxref("Array.prototype.every()")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Array.prototype.some()")}}
- {{jsxref("Array.prototype.reduce()")}}
- {{jsxref("TypedArray.prototype.filter()")}}
