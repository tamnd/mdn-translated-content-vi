---
title: Array.prototype.findLast()
short-title: findLast()
slug: Web/JavaScript/Reference/Global_Objects/Array/findLast
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.findLast
sidebar: jsref
---

Phương thức **`findLast()`** của các instance {{jsxref("Array")}} lặp qua mảng theo thứ tự ngược lại và trả về giá trị của phần tử đầu tiên thỏa mãn hàm kiểm tra được cung cấp.
Nếu không có phần tử nào thỏa mãn hàm kiểm tra, {{jsxref("undefined")}} được trả về.

Nếu bạn cần tìm:

- phần tử _đầu tiên_ khớp, hãy dùng {{jsxref("Array/find", "find()")}}.
- _chỉ số_ của phần tử khớp cuối cùng trong mảng, hãy dùng {{jsxref("Array/findLastIndex", "findLastIndex()")}}.
- _chỉ số của một giá trị_, hãy dùng {{jsxref("Array/indexOf", "indexOf()")}}.
  (Nó tương tự như {{jsxref("Array/findIndex", "findIndex()")}}, nhưng kiểm tra từng phần tử bằng giá trị thay vì dùng hàm kiểm tra.)
- xem một giá trị có _tồn tại_ trong mảng không, hãy dùng {{jsxref("Array/includes", "includes()")}}.
  Một lần nữa, nó kiểm tra từng phần tử bằng giá trị thay vì dùng hàm kiểm tra.
- nếu có phần tử nào thỏa mãn hàm kiểm tra được cung cấp, hãy dùng {{jsxref("Array/some", "some()")}}.

{{InteractiveExample("JavaScript Demo: Array.prototype.findLast()", "shorter")}}

```js interactive-example
const array = [5, 12, 50, 130, 44];

const found = array.findLast((element) => element > 45);

console.log(found);
// Expected output: 130
```

## Syntax

```js-nolint
findLast(callbackFn)
findLast(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ rằng đã tìm thấy phần tử phù hợp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `findLast()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Phần tử cuối cùng (chỉ số cao nhất) trong mảng thỏa mãn hàm kiểm tra được cung cấp; {{jsxref("undefined")}} nếu không tìm thấy phần tử phù hợp.

## Description

Phương thức `findLast()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng theo thứ tự chỉ số giảm dần, cho đến khi `callbackFn` trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy). Khi đó `findLast()` trả về phần tử đó và dừng lặp qua mảng. Nếu `callbackFn` không bao giờ trả về giá trị truthy, `findLast()` trả về {{jsxref("undefined")}}. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` được gọi cho _mỗi_ chỉ số của mảng, không chỉ những chỉ số đã được gán giá trị. Các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) được xử lý giống như `undefined`.

Phương thức `findLast()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Tìm đối tượng cuối cùng trong mảng khớp với thuộc tính phần tử

Ví dụ này cho thấy cách bạn có thể tạo bài kiểm tra dựa trên các thuộc tính của phần tử mảng.

```js
const inventory = [
  { name: "apples", quantity: 2 },
  { name: "bananas", quantity: 0 },
  { name: "fish", quantity: 1 },
  { name: "cherries", quantity: 5 },
];

// return true inventory stock is low
function isNotEnough(item) {
  return item.quantity < 2;
}

console.log(inventory.findLast(isNotEnough));
// { name: "fish", quantity: 1 }
```

#### Dùng arrow function và destructuring

Ví dụ trước có thể được viết lại bằng arrow function và [object destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#object_destructuring):

```js
const inventory = [
  { name: "apples", quantity: 2 },
  { name: "bananas", quantity: 0 },
  { name: "fish", quantity: 1 },
  { name: "cherries", quantity: 5 },
];

const result = inventory.findLast(({ quantity }) => quantity < 2);

console.log(result);
// { name: "fish", quantity: 1 }
```

### Tìm số nguyên tố cuối cùng trong mảng

Ví dụ sau trả về phần tử cuối cùng trong mảng là số nguyên tố, hoặc {{jsxref("undefined")}} nếu không có số nguyên tố nào.

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

console.log([4, 6, 8, 12].findLast(isPrime)); // undefined, not found
console.log([4, 5, 7, 8, 9, 11, 12].findLast(isPrime)); // 11
```

> [!NOTE]
> Cài đặt `isPrime()` này chỉ dùng cho mục đích minh họa. Với ứng dụng thực tế, bạn nên dùng một thuật toán được ghi nhớ (memoized) nhiều như [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

### Tìm nhiệm vụ hoàn thành gần đây nhất

Ví dụ này minh họa một trường hợp sử dụng thực tế của `findLast()` khi làm việc với dữ liệu được sắp xếp theo thời gian. Nó tìm nhiệm vụ hoàn thành gần đây nhất từ danh sách đã được sắp xếp theo `timestamp`.

```js
const tasks = [
  { name: "Setup project", completed: true, timestamp: 1609459200000 },
  { name: "Write tests", completed: false, timestamp: 1609545600000 },
  { name: "Fix bug #42", completed: true, timestamp: 1609632000000 },
  { name: "Deploy to staging", completed: true, timestamp: 1609718400000 },
  { name: "Review PR", completed: false, timestamp: 1609804800000 },
];

const lastCompletedTask = tasks.findLast((task) => task.completed);

console.log(lastCompletedTask.name); // Deploy to staging
```

Cách này hiệu quả hơn so với việc dùng `find()` với mảng đã đảo ngược, vì nó tránh tạo một mảng mới.

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `findLast()` để tìm phần tử cuối cùng nhỏ hơn các láng giềng của nó.

```js
const numbers = [3, -1, 1, 4, 1, 5, 9, 2, 6];
const lastTrough = numbers
  .filter((num) => num > 0)
  .findLast((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx > 0 && num >= arr[idx - 1]) return false;
    if (idx < arr.length - 1 && num >= arr[idx + 1]) return false;
    return true;
  });
console.log(lastTrough); // 2
```

### Dùng findLast() trên mảng thưa

Các slot rỗng trong mảng thưa _được_ duyệt qua, và được xử lý giống như `undefined`.

```js
// Declare array with no elements at indexes 2, 3, and 4
const array = [0, 1, , , , 5, 6];

// Shows all indexes, not just those with assigned values
array.findLast((value, index) => {
  console.log(`Visited index ${index} with value ${value}`);
  return false;
});
// Visited index 6 with value 6
// Visited index 5 with value 5
// Visited index 4 with value undefined
// Visited index 3 with value undefined
// Visited index 2 with value undefined
// Visited index 1 with value 1
// Visited index 0 with value 0

// Shows all indexes, including deleted
array.findLast((value, index) => {
  // Delete element 5 on first iteration
  if (index === 6) {
    console.log(`Deleting array[5] with value ${array[5]}`);
    delete array[5];
  }
  // Element 5 is still visited even though deleted
  console.log(`Visited index ${index} with value ${value}`);
  return false;
});
// Deleting array[5] with value 5
// Visited index 6 with value 6
// Visited index 5 with value undefined
// Visited index 4 with value undefined
// Visited index 3 with value undefined
// Visited index 2 with value undefined
// Visited index 1 with value 1
// Visited index 0 with value 0
```

### Gọi findLast() trên các đối tượng không phải mảng

Phương thức `findLast()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 7.3,
  2: 4,
  3: 3, // ignored by findLast() since length is 3
};
console.log(
  Array.prototype.findLast.call(arrayLike, (x) => Number.isInteger(x)),
); // 4
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.findLast` in `core-js`](https://github.com/zloirock/core-js#array-find-from-last)
- [es-shims polyfill of `Array.prototype.findLast`](https://www.npmjs.com/package/array.prototype.findlast)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("Array.prototype.findLastIndex()")}}
- {{jsxref("Array.prototype.includes()")}}
- {{jsxref("Array.prototype.filter()")}}
- {{jsxref("Array.prototype.every()")}}
- {{jsxref("Array.prototype.some()")}}
- {{jsxref("TypedArray.prototype.findLast()")}}
