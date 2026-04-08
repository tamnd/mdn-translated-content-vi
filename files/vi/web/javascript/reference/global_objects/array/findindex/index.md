---
title: Array.prototype.findIndex()
short-title: findIndex()
slug: Web/JavaScript/Reference/Global_Objects/Array/findIndex
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.findIndex
sidebar: jsref
---

Phương thức **`findIndex()`** của các instance {{jsxref("Array")}} trả về chỉ số của phần tử đầu tiên trong mảng thỏa mãn hàm kiểm tra được cung cấp.
Nếu không có phần tử nào thỏa mãn hàm kiểm tra, -1 được trả về.

Xem thêm phương thức {{jsxref("Array/find", "find()")}}, phương thức này trả về phần tử đầu tiên thỏa mãn hàm kiểm tra (thay vì chỉ số của nó).

{{InteractiveExample("JavaScript Demo: Array.prototype.findIndex()", "shorter")}}

```js interactive-example
const array = [5, 12, 8, 130, 44];

const isLargeNumber = (element) => element > 13;

console.log(array.findIndex(isLargeNumber));
// Expected output: 3
```

## Syntax

```js-nolint
findIndex(callbackFn)
findIndex(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ rằng đã tìm thấy phần tử phù hợp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `findIndex()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Chỉ số của phần tử đầu tiên trong mảng vượt qua bài kiểm tra. Ngược lại, `-1`.

## Description

Phương thức `findIndex()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng theo thứ tự chỉ số tăng dần, cho đến khi `callbackFn` trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy). Khi đó `findIndex()` trả về chỉ số của phần tử đó và dừng lặp qua mảng. Nếu `callbackFn` không bao giờ trả về giá trị truthy, `findIndex()` trả về `-1`. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` được gọi cho _mỗi_ chỉ số của mảng, không chỉ những chỉ số đã được gán giá trị. Các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) được xử lý giống như `undefined`.

Phương thức `findIndex()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Tìm chỉ số của số nguyên tố đầu tiên trong mảng

Ví dụ sau trả về chỉ số của phần tử đầu tiên trong mảng là số nguyên tố, hoặc `-1` nếu không có số nguyên tố nào.

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

console.log([4, 6, 8, 9, 12].findIndex(isPrime)); // -1, not found
console.log([4, 6, 7, 9, 12].findIndex(isPrime)); // 2 (array[2] is 7)
```

> [!NOTE]
> Cài đặt `isPrime()` này chỉ dùng cho mục đích minh họa. Với ứng dụng thực tế, bạn nên dùng một thuật toán được ghi nhớ (memoized) nhiều như [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `findIndex()` để tìm phần tử đầu tiên nhỏ hơn các láng giềng của nó.

```js
const numbers = [3, -1, 1, 4, 1, 5, 9, 2, 6];
const firstTrough = numbers
  .filter((num) => num > 0)
  .findIndex((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx > 0 && num >= arr[idx - 1]) return false;
    if (idx < arr.length - 1 && num >= arr[idx + 1]) return false;
    return true;
  });
console.log(firstTrough); // 1
```

### Dùng findIndex() trên mảng thưa

Bạn có thể tìm kiếm `undefined` trong mảng thưa và lấy chỉ số của một slot rỗng.

```js
console.log([1, , 3].findIndex((x) => x === undefined)); // 1
```

### Gọi findIndex() trên các đối tượng không phải mảng

Phương thức `findIndex()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  "-1": 0.1, // ignored by findIndex() since -1 < 0
  0: 2,
  1: 7.3,
  2: 4,
};
console.log(
  Array.prototype.findIndex.call(arrayLike, (x) => !Number.isInteger(x)),
); // 1
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.findIndex` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.findIndex`](https://www.npmjs.com/package/array.prototype.findindex)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("Array.prototype.findLast()")}}
- {{jsxref("Array.prototype.findLastIndex()")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("Array.prototype.lastIndexOf()")}}
- {{jsxref("TypedArray.prototype.findIndex()")}}
