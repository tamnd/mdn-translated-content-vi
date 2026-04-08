---
title: Array.prototype.find()
short-title: find()
slug: Web/JavaScript/Reference/Global_Objects/Array/find
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.find
sidebar: jsref
---

Phương thức **`find()`** của các instance {{jsxref("Array")}} trả về phần tử đầu tiên trong mảng được cung cấp thỏa mãn hàm kiểm tra được cung cấp.
Nếu không có giá trị nào thỏa mãn hàm kiểm tra, {{jsxref("undefined")}} được trả về.

- Nếu bạn cần **chỉ số** của phần tử được tìm thấy trong mảng, hãy dùng {{jsxref("Array/findIndex", "findIndex()")}}.
- Nếu bạn cần tìm **chỉ số của một giá trị**, hãy dùng {{jsxref("Array/indexOf", "indexOf()")}}.
  (Nó tương tự như {{jsxref("Array/findIndex", "findIndex()")}}, nhưng kiểm tra từng phần tử bằng giá trị thay vì dùng hàm kiểm tra.)
- Nếu bạn cần tìm xem một giá trị có **tồn tại** trong mảng không, hãy dùng {{jsxref("Array/includes", "includes()")}}.
  Một lần nữa, nó kiểm tra từng phần tử bằng giá trị thay vì dùng hàm kiểm tra.
- Nếu bạn cần tìm xem có phần tử nào thỏa mãn hàm kiểm tra được cung cấp không, hãy dùng {{jsxref("Array/some", "some()")}}.
- Nếu bạn cần tìm tất cả các phần tử thỏa mãn hàm kiểm tra được cung cấp, hãy dùng {{jsxref("Array/filter", "filter()")}}.

{{InteractiveExample("JavaScript Demo: Array.prototype.find()", "shorter")}}

```js interactive-example
const array = [5, 12, 8, 130, 44];

const found = array.find((element) => element > 10);

console.log(found);
// Expected output: 12
```

## Syntax

```js-nolint
find(callbackFn)
find(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ rằng đã tìm thấy phần tử phù hợp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `find()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Phần tử đầu tiên trong mảng thỏa mãn hàm kiểm tra được cung cấp.
Ngược lại, {{jsxref("undefined")}} được trả về.

## Description

Phương thức `find()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng theo thứ tự chỉ số tăng dần, cho đến khi `callbackFn` trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy). Khi đó `find()` trả về phần tử đó và dừng lặp qua mảng. Nếu `callbackFn` không bao giờ trả về giá trị truthy, `find()` trả về {{jsxref("undefined")}}. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` được gọi cho _mỗi_ chỉ số của mảng, không chỉ những chỉ số đã được gán giá trị. Các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) được xử lý giống như `undefined`.

Phương thức `find()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Tìm đối tượng trong mảng theo một trong các thuộc tính của nó

```js
const inventory = [
  { name: "apples", quantity: 2 },
  { name: "bananas", quantity: 0 },
  { name: "cherries", quantity: 5 },
];

function isCherries(fruit) {
  return fruit.name === "cherries";
}

console.log(inventory.find(isCherries));
// { name: 'cherries', quantity: 5 }
```

#### Dùng arrow function và destructuring

```js
const inventory = [
  { name: "apples", quantity: 2 },
  { name: "bananas", quantity: 0 },
  { name: "cherries", quantity: 5 },
];

const result = inventory.find(({ name }) => name === "cherries");

console.log(result); // { name: 'cherries', quantity: 5 }
```

### Tìm số nguyên tố đầu tiên trong mảng

Ví dụ sau trả về phần tử đầu tiên trong mảng là số nguyên tố, hoặc {{jsxref("undefined")}} nếu không có số nguyên tố nào.

```js
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

console.log([4, 6, 8, 12].find(isPrime)); // undefined, not found
console.log([4, 5, 8, 12].find(isPrime)); // 5
```

> [!NOTE]
> Cài đặt `isPrime()` này chỉ dùng cho mục đích minh họa. Với ứng dụng thực tế, bạn nên dùng một thuật toán được ghi nhớ (memoized) nhiều như [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `find()` để tìm phần tử đầu tiên nhỏ hơn các láng giềng của nó.

```js
const numbers = [3, -1, 1, 4, 1, 5, 9, 2, 6];
const firstTrough = numbers
  .filter((num) => num > 0)
  .find((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx > 0 && num >= arr[idx - 1]) return false;
    if (idx < arr.length - 1 && num >= arr[idx + 1]) return false;
    return true;
  });
console.log(firstTrough); // 1
```

### Dùng find() trên mảng thưa

Các slot rỗng trong mảng thưa _được_ duyệt qua, và được xử lý giống như `undefined`.

```js
// Declare array with no elements at indexes 2, 3, and 4
const array = [0, 1, , , , 5, 6];

// Shows all indexes, not just those with assigned values
array.find((value, index) => {
  console.log("Visited index", index, "with value", value);
  return false;
});
// Visited index 0 with value 0
// Visited index 1 with value 1
// Visited index 2 with value undefined
// Visited index 3 with value undefined
// Visited index 4 with value undefined
// Visited index 5 with value 5
// Visited index 6 with value 6

// Shows all indexes, including deleted
array.find((value, index) => {
  // Delete element 5 on first iteration
  if (index === 0) {
    console.log("Deleting array[5] with value", array[5]);
    delete array[5];
  }
  // Element 5 is still visited even though deleted
  console.log("Visited index", index, "with value", value);
  return false;
});
// Deleting array[5] with value 5
// Visited index 0 with value 0
// Visited index 1 with value 1
// Visited index 2 with value undefined
// Visited index 3 with value undefined
// Visited index 4 with value undefined
// Visited index 5 with value undefined
// Visited index 6 with value 6
```

### Gọi find() trên các đối tượng không phải mảng

Phương thức `find()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  "-1": 0.1, // ignored by find() since -1 < 0
  0: 2,
  1: 7.3,
  2: 4,
};
console.log(Array.prototype.find.call(arrayLike, (x) => !Number.isInteger(x)));
// 7.3
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.find` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.find`](https://www.npmjs.com/package/array.prototype.find)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("Array.prototype.findLast()")}}
- {{jsxref("Array.prototype.findLastIndex()")}}
- {{jsxref("Array.prototype.includes()")}}
- {{jsxref("Array.prototype.filter()")}}
- {{jsxref("Array.prototype.every()")}}
- {{jsxref("Array.prototype.some()")}}
- {{jsxref("TypedArray.prototype.find()")}}
