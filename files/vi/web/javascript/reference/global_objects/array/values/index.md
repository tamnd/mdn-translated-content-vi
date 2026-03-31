---
title: Array.prototype.values()
short-title: values()
slug: Web/JavaScript/Reference/Global_Objects/Array/values
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.values
sidebar: jsref
---

Phương thức **`values()`** của các đối tượng {{jsxref("Array")}} trả về một đối tượng _[iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới lặp qua giá trị của từng phần tử trong mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.values()")}}

```js interactive-example
const array = ["a", "b", "c"];
const iterator = array.values();

for (const value of iterator) {
  console.log(value);
}

// Expected output: "a"
// Expected output: "b"
// Expected output: "c"
```

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [đối tượng iterator iterable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Mô tả

`Array.prototype.values()` là cài đặt mặc định của [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator).

```js
Array.prototype.values === Array.prototype[Symbol.iterator]; // true
```

Khi được dùng trên [mảng thưa](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `values()` lặp qua các vị trí trống như thể chúng có giá trị `undefined`.

Phương thức `values()` là [phương thức tổng quát](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Ví dụ

### Lặp qua vòng lặp for...of

Vì `values()` trả về một iterator iterable, bạn có thể dùng vòng lặp [`for...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for...of) để lặp qua nó.

```js
const arr = ["a", "b", "c", "d", "e"];
const iterator = arr.values();

for (const letter of iterator) {
  console.log(letter);
} // "a" "b" "c" "d" "e"
```

### Lặp qua next()

Vì giá trị trả về cũng là một iterator, bạn có thể gọi trực tiếp phương thức `next()` của nó.

```js
const arr = ["a", "b", "c", "d", "e"];
const iterator = arr.values();
iterator.next(); // { value: "a", done: false }
iterator.next(); // { value: "b", done: false }
iterator.next(); // { value: "c", done: false }
iterator.next(); // { value: "d", done: false }
iterator.next(); // { value: "e", done: false }
iterator.next(); // { value: undefined, done: true }
console.log(iterator.next().value); // undefined
```

### Tái sử dụng iterable

> [!WARNING]
> Đối tượng iterator mảng nên là đối tượng sử dụng một lần. Không nên tái sử dụng nó.

Iterable được trả về từ `values()` không thể tái sử dụng. Khi `next().done = true` hoặc `currentIndex > length`, [vòng lặp `for...of` kết thúc](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#interactions_between_the_language_and_iteration_protocols), và việc tiếp tục lặp qua nó không có tác dụng.

```js
const arr = ["a", "b", "c", "d", "e"];
const values = arr.values();
for (const letter of values) {
  console.log(letter);
}
// "a" "b" "c" "d" "e"
for (const letter of values) {
  console.log(letter);
}
// undefined
```

Nếu bạn dùng câu lệnh [`break`](/en-US/docs/Web/JavaScript/Reference/Statements/break) để kết thúc lặp sớm, iterator có thể tiếp tục từ vị trí hiện tại khi tiếp tục lặp.

```js
const arr = ["a", "b", "c", "d", "e"];
const values = arr.values();
for (const letter of values) {
  console.log(letter);
  if (letter === "b") {
    break;
  }
}
// "a" "b"

for (const letter of values) {
  console.log(letter);
}
// "c" "d" "e"
```

### Thay đổi trong quá trình lặp

Không có giá trị nào được lưu trong đối tượng iterator mảng được trả về từ `values()`; thay vào đó, nó lưu địa chỉ của mảng được dùng trong quá trình tạo, và đọc chỉ mục hiện đang được ghé thăm trong mỗi lần lặp. Do đó, đầu ra lặp phụ thuộc vào giá trị được lưu tại chỉ mục đó tại thời điểm bước đó. Nếu các giá trị trong mảng thay đổi, các giá trị của đối tượng iterator mảng cũng thay đổi theo.

```js
const arr = ["a", "b", "c", "d", "e"];
const iterator = arr.values();
console.log(iterator); // Array Iterator { }
console.log(iterator.next().value); // "a"
arr[1] = "n";
console.log(iterator.next().value); // "n"
```

Không giống như [phương thức lặp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods), đối tượng iterator mảng không lưu độ dài của mảng tại thời điểm tạo, mà đọc nó một lần trong mỗi lần lặp. Do đó, nếu mảng phát triển trong quá trình lặp, iterator sẽ ghé thăm cả các phần tử mới. Điều này có thể dẫn đến vòng lặp vô hạn.

```js
const arr = [1, 2, 3];
for (const e of arr) {
  arr.push(e * 10);
}
// RangeError: invalid array length
```

### Lặp qua mảng thưa

`values()` sẽ ghé thăm các vị trí trống như thể chúng là `undefined`.

```js
for (const element of [, "a"].values()) {
  console.log(element);
}
// undefined
// 'a'
```

### Gọi values() trên đối tượng không phải mảng

Phương thức `values()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: "d", // ignored by values() since length is 3
};
for (const entry of Array.prototype.values.call(arrayLike)) {
  console.log(entry);
}
// a
// b
// c
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype.values` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill của `Array.prototype.values`](https://www.npmjs.com/package/array.prototype.values)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.entries()")}}
- {{jsxref("Array.prototype.keys()")}}
- [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)
- {{jsxref("TypedArray.prototype.values()")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
