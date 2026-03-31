---
title: Array.prototype.reduceRight()
short-title: reduceRight()
slug: Web/JavaScript/Reference/Global_Objects/Array/reduceRight
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.reduceRight
sidebar: jsref
---

Phương thức **`reduceRight()`** của các đối tượng {{jsxref("Array")}} áp dụng một hàm lên một accumulator và từng giá trị của mảng (từ phải sang trái) để rút gọn nó thành một giá trị duy nhất.

Xem thêm {{jsxref("Array.prototype.reduce()")}} cho thứ tự từ trái sang phải.

{{InteractiveExample("JavaScript Demo: Array.prototype.reduceRight()")}}

```js interactive-example
const array = [
  [0, 1],
  [2, 3],
  [4, 5],
];

const result = array.reduceRight((accumulator, currentValue) =>
  accumulator.concat(currentValue),
);

console.log(result);
// Expected output: Array [4, 5, 2, 3, 0, 1]
```

## Cú pháp

```js-nolint
reduceRight(callbackFn)
reduceRight(callbackFn, initialValue)
```

### Tham số

- `callbackFn`
  - : Một hàm để thực thi cho mỗi phần tử trong mảng. Giá trị trả về của nó trở thành giá trị của tham số `accumulator` ở lần gọi tiếp theo của `callbackFn`. Ở lần gọi cuối cùng, giá trị trả về trở thành giá trị trả về của `reduceRight()`. Hàm được gọi với các đối số sau:
    - `accumulator`
      - : Giá trị kết quả từ lần gọi trước của `callbackFn`. Ở lần gọi đầu tiên, giá trị của nó là `initialValue` nếu tham số đó được chỉ định; nếu không thì giá trị của nó là phần tử cuối cùng của mảng.
    - `currentValue`
      - : Giá trị của phần tử hiện tại. Ở lần gọi đầu tiên, giá trị của nó là phần tử cuối cùng nếu `initialValue` được chỉ định; nếu không thì giá trị của nó là phần tử kế cuối.
    - `currentIndex`
      - : Vị trí chỉ mục của `currentValue` trong mảng. Ở lần gọi đầu tiên, giá trị của nó là `array.length - 1` nếu `initialValue` được chỉ định, nếu không thì là `array.length - 2`.
    - `array`
      - : Mảng mà `reduceRight()` được gọi.
- `initialValue` {{optional_inline}}
  - : Giá trị dùng làm accumulator cho lần gọi đầu tiên của `callbackFn`. Nếu không có giá trị khởi đầu nào được cung cấp, phần tử cuối cùng trong mảng sẽ được dùng và bỏ qua. Gọi `reduceRight()` trên mảng rỗng mà không có giá trị khởi đầu tạo ra `TypeError`.

### Giá trị trả về

Giá trị kết quả từ quá trình rút gọn.

## Mô tả

Phương thức `reduceRight()` là một [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Nó chạy hàm callback "reducer" trên tất cả các phần tử trong mảng, theo thứ tự chỉ mục giảm dần, và tích lũy chúng thành một giá trị duy nhất. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

`callbackFn` chỉ được gọi cho các chỉ mục mảng có giá trị được gán. Nó không được gọi cho các ô trống trong [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Không giống các [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) khác, `reduceRight()` không nhận tham số `thisArg`. `callbackFn` luôn được gọi với `undefined` làm `this`, được thay bằng `globalThis` nếu `callbackFn` không nghiêm ngặt.

Phương thức `reduceRight()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

Tất cả các lưu ý về `reduce` được thảo luận trong [khi nào không nên dùng reduce()](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce#when_to_not_use_reduce) cũng áp dụng cho `reduceRight`. Vì JavaScript không có ngữ nghĩa đánh giá lười, không có sự khác biệt về hiệu suất giữa `reduce` và `reduceRight`.

## Ví dụ

### Cách reduceRight() hoạt động không có giá trị khởi đầu

Lời gọi đến `callbackFn` của reduceRight sẽ trông giống như sau:

```js
arr.reduceRight((accumulator, currentValue, index, array) => {
  // …
});
```

Lần đầu tiên hàm được gọi, `accumulator` và `currentValue` có thể là một trong hai giá trị. Nếu `initialValue` được cung cấp trong lời gọi đến `reduceRight`, thì `accumulator` sẽ bằng `initialValue` và `currentValue` sẽ bằng giá trị cuối cùng trong mảng. Nếu không có `initialValue` nào được cung cấp, thì `accumulator` sẽ bằng giá trị cuối cùng trong mảng và `currentValue` sẽ bằng giá trị kế cuối.

Nếu mảng rỗng và không có `initialValue` nào được cung cấp, {{jsxref("TypeError")}} sẽ được ném ra. Nếu mảng chỉ có một phần tử (bất kể vị trí) và không có `initialValue` nào được cung cấp, hoặc nếu `initialValue` được cung cấp nhưng mảng rỗng, giá trị duy nhất sẽ được trả về mà không gọi `callbackFn`.

Một số ví dụ chạy hàm sẽ như thế này:

```js
[0, 1, 2, 3, 4].reduceRight(
  (accumulator, currentValue, index, array) => accumulator + currentValue,
);
```

Callback sẽ được gọi bốn lần, với các đối số và giá trị trả về trong mỗi lần gọi như sau:

|             | `accumulator` | `currentValue` | `index` | Giá trị trả về |
| ----------- | ------------- | -------------- | ------- | -------------- |
| Lần gọi đầu | `4`           | `3`            | `3`     | `7`            |
| Lần gọi hai | `7`           | `2`            | `2`     | `9`            |
| Lần gọi ba  | `9`           | `1`            | `1`     | `10`           |
| Lần gọi bốn | `10`          | `0`            | `0`     | `10`           |

Tham số `array` không bao giờ thay đổi trong quá trình — nó luôn là `[0, 1, 2, 3, 4]`. Giá trị trả về bởi `reduceRight` sẽ là giá trị của lần gọi callback cuối cùng (`10`).

### Cách reduceRight() hoạt động với giá trị khởi đầu

Ở đây chúng ta rút gọn cùng mảng bằng cùng thuật toán, nhưng với `initialValue` là `10` được truyền làm đối số thứ hai cho `reduceRight()`:

```js
[0, 1, 2, 3, 4].reduceRight(
  (accumulator, currentValue, index, array) => accumulator + currentValue,
  10,
);
```

|             | `accumulator` | `currentValue` | `index` | Giá trị trả về |
| ----------- | ------------- | -------------- | ------- | -------------- |
| Lần gọi đầu | `10`          | `4`            | `4`     | `14`           |
| Lần gọi hai | `14`          | `3`            | `3`     | `17`           |
| Lần gọi ba  | `17`          | `2`            | `2`     | `19`           |
| Lần gọi bốn | `19`          | `1`            | `1`     | `20`           |
| Lần gọi năm | `20`          | `0`            | `0`     | `20`           |

Giá trị trả về bởi `reduceRight` lần này sẽ là `20`.

### Tổng tất cả các giá trị trong mảng

```js
const sum = [0, 1, 2, 3].reduceRight((a, b) => a + b);
// sum is 6
```

### Chạy danh sách các hàm bất đồng bộ với callbacks theo trình tự, mỗi hàm truyền kết quả cho hàm tiếp theo

```js
const waterfall =
  (...functions) =>
  (callback, ...args) =>
    functions.reduceRight(
      (composition, fn) =>
        (...results) =>
          fn(composition, ...results),
      callback,
    )(...args);

const randInt = (max) => Math.floor(Math.random() * max);

const add5 = (callback, x) => {
  setTimeout(callback, randInt(1000), x + 5);
};
const mul3 = (callback, x) => {
  setTimeout(callback, randInt(1000), x * 3);
};
const sub2 = (callback, x) => {
  setTimeout(callback, randInt(1000), x - 2);
};
const split = (callback, x) => {
  setTimeout(callback, randInt(1000), x, x);
};
const add = (callback, x, y) => {
  setTimeout(callback, randInt(1000), x + y);
};
const div4 = (callback, x) => {
  setTimeout(callback, randInt(1000), x / 4);
};

const computation = waterfall(add5, mul3, sub2, split, add, div4);
computation(console.log, 5); // Logs 14

// same as:

const computation2 = (input, callback) => {
  const f6 = (x) => div4(callback, x);
  const f5 = (x, y) => add(f6, x, y);
  const f4 = (x) => split(f5, x);
  const f3 = (x) => sub2(f4, x);
  const f2 = (x) => mul3(f3, x);
  add5(f2, input);
};
```

### Sự khác biệt giữa reduce và reduceRight

```js
const a = ["1", "2", "3", "4", "5"];
const left = a.reduce((prev, cur) => prev + cur);
const right = a.reduceRight((prev, cur) => prev + cur);

console.log(left); // "12345"
console.log(right); // "54321"
```

### Định nghĩa các hàm có thể kết hợp

Kết hợp hàm là cơ chế kết hợp các hàm, trong đó đầu ra của mỗi hàm được truyền vào hàm tiếp theo, và đầu ra của hàm cuối cùng là kết quả cuối cùng. Trong ví dụ này chúng ta dùng `reduceRight()` để triển khai kết hợp hàm.

Xem thêm [Function composition](<https://en.wikipedia.org/wiki/Function_composition_(computer_science)>) trên Wikipedia.

```js
const compose =
  (...args) =>
  (value) =>
    args.reduceRight((acc, fn) => fn(acc), value);

// Increment passed number
const inc = (n) => n + 1;

// Doubles the passed value
const double = (n) => n * 2;

// using composition function
console.log(compose(double, inc)(2)); // 6

// using composition function
console.log(compose(inc, double)(2)); // 5
```

### Sử dụng reduceRight() với mảng thưa

`reduceRight()` bỏ qua các phần tử bị thiếu trong mảng thưa, nhưng không bỏ qua các giá trị `undefined`.

```js
console.log([1, 2, , 4].reduceRight((a, b) => a + b)); // 7
console.log([1, 2, undefined, 4].reduceRight((a, b) => a + b)); // NaN
```

### Gọi reduceRight() trên đối tượng không phải mảng

Phương thức `reduceRight()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: 2,
  1: 3,
  2: 4,
  3: 99, // ignored by reduceRight() since length is 3
};
console.log(Array.prototype.reduceRight.call(arrayLike, (x, y) => x - y));
// -1, which is 4 - 3 - 2
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.reduceRight` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.reduceRight`](https://www.npmjs.com/package/array.prototype.reduceright)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Array.prototype.flat()")}}
- {{jsxref("Array.prototype.flatMap()")}}
- {{jsxref("Array.prototype.reduce()")}}
- {{jsxref("TypedArray.prototype.reduceRight()")}}
- {{jsxref("Object.groupBy()")}}
- {{jsxref("Map.groupBy()")}}
