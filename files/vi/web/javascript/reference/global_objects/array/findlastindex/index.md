---
title: Array.prototype.findLastIndex()
short-title: findLastIndex()
slug: Web/JavaScript/Reference/Global_Objects/Array/findLastIndex
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.findLastIndex
sidebar: jsref
---

Phương thức **`findLastIndex()`** của các instance {{jsxref("Array")}} lặp qua mảng theo thứ tự ngược lại và trả về chỉ số của phần tử đầu tiên thỏa mãn hàm kiểm tra được cung cấp.
Nếu không có phần tử nào thỏa mãn hàm kiểm tra, -1 được trả về.

Xem thêm phương thức {{jsxref("Array/findLast", "findLast()")}}, phương thức này trả về giá trị của phần tử cuối cùng thỏa mãn hàm kiểm tra (thay vì chỉ số của nó).

{{InteractiveExample("JavaScript Demo: Array.prototype.findLastIndex()", "shorter")}}

```js interactive-example
const array = [5, 12, 50, 130, 44];

const isLargeNumber = (element) => element > 45;

console.log(array.findLastIndex(isLargeNumber));
// Expected output: 3
// Index of element with value: 130
```

## Syntax

```js-nolint
findLastIndex(callbackFn)
findLastIndex(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy) để chỉ rằng đã tìm thấy phần tử phù hợp, và một giá trị [falsy](/en-US/docs/Glossary/Falsy) trong trường hợp ngược lại. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `findLastIndex()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Chỉ số của phần tử cuối cùng (chỉ số cao nhất) trong mảng vượt qua bài kiểm tra.
Ngược lại `-1` nếu không tìm thấy phần tử phù hợp.

## Description

Phương thức `findLastIndex()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó gọi hàm `callbackFn` được cung cấp một lần cho mỗi phần tử trong mảng theo thứ tự chỉ số giảm dần, cho đến khi `callbackFn` trả về một giá trị [truthy](/en-US/docs/Glossary/Truthy). Khi đó `findLastIndex()` trả về chỉ số của phần tử đó và dừng lặp qua mảng. Nếu `callbackFn` không bao giờ trả về giá trị truthy, `findLastIndex()` trả về `-1`. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` được gọi cho _mỗi_ chỉ số của mảng, không chỉ những chỉ số đã được gán giá trị. Các slot rỗng trong [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) được xử lý giống như `undefined`.

Phương thức `findLastIndex()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Tìm chỉ số của số nguyên tố cuối cùng trong mảng

Ví dụ sau trả về chỉ số của phần tử cuối cùng trong mảng là số nguyên tố, hoặc `-1` nếu không có số nguyên tố nào.

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

console.log([4, 6, 8, 12].findLastIndex(isPrime)); // -1, not found
console.log([4, 5, 7, 8, 9, 11, 12].findLastIndex(isPrime)); // 5
```

> [!NOTE]
> Cài đặt `isPrime()` này chỉ dùng cho mục đích minh họa. Với ứng dụng thực tế, bạn nên dùng một thuật toán được ghi nhớ (memoized) nhiều như [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes) để tránh tính toán lặp lại.

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các giá trị dương và sau đó dùng `findLastIndex()` để tìm phần tử cuối cùng nhỏ hơn các láng giềng của nó.

```js
const numbers = [3, -1, 1, 4, 1, 5, 9, 2, 6];
const lastTrough = numbers
  .filter((num) => num > 0)
  .findLastIndex((num, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx > 0 && num >= arr[idx - 1]) return false;
    if (idx < arr.length - 1 && num >= arr[idx + 1]) return false;
    return true;
  });
console.log(lastTrough); // 6
```

### Dùng findLastIndex() trên mảng thưa

Bạn có thể tìm kiếm `undefined` trong mảng thưa và lấy chỉ số của một slot rỗng.

```js
console.log([1, , 3].findLastIndex((x) => x === undefined)); // 1
```

### Gọi findLastIndex() trên các đối tượng không phải mảng

Phương thức `findLastIndex()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 7.3,
  2: 4,
  3: 3, // ignored by findLastIndex() since length is 3
};
console.log(
  Array.prototype.findLastIndex.call(arrayLike, (x) => Number.isInteger(x)),
); // 2
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.findLastIndex` in `core-js`](https://github.com/zloirock/core-js#array-find-from-last)
- [es-shims polyfill of `Array.prototype.findLastIndex`](https://www.npmjs.com/package/array.prototype.findlastindex)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.find()")}}
- {{jsxref("Array.prototype.findIndex()")}}
- {{jsxref("Array.prototype.findLast()")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("Array.prototype.lastIndexOf()")}}
- {{jsxref("TypedArray.prototype.findLastIndex()")}}
