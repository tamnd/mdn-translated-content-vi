---
title: Array.prototype[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.@@iterator
sidebar: jsref
---

Phương thức **`[Symbol.iterator]()`** của các đối tượng {{jsxref("Array")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép mảng được sử dụng bởi hầu hết các cú pháp yêu cầu iterable, chẳng hạn như [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về một [đối tượng iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) trả ra giá trị của từng chỉ mục trong mảng.

Giá trị ban đầu của thuộc tính này là cùng đối tượng hàm với giá trị ban đầu của thuộc tính {{jsxref("Array.prototype.values")}}.

{{InteractiveExample("JavaScript Demo: Array.prototype[Symbol.iterator]()")}}

```js interactive-example
const array = ["a", "b", "c"];
const iterator = array[Symbol.iterator]();

for (const value of iterator) {
  console.log(value);
}

// Expected output: "a"
// Expected output: "b"
// Expected output: "c"
```

## Cú pháp

```js-nolint
array[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị trả về giống với {{jsxref("Array.prototype.values()")}}: một [đối tượng iterator iterable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới trả ra giá trị của từng chỉ mục trong mảng.

## Ví dụ

### Lặp qua vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` khiến mảng [có thể lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp lặp như vòng lặp `for...of` tự động gọi phương thức này để lấy iterator để lặp qua.

#### HTML

```html
<ul id="letterResult"></ul>
```

#### JavaScript

```js
const arr = ["a", "b", "c"];
const letterResult = document.getElementById("letterResult");
for (const letter of arr) {
  const li = document.createElement("li");
  li.textContent = letter;
  letterResult.appendChild(li);
}
```

#### Kết quả

{{EmbedLiveSample("Iteration_using_for...of_loop", "", "")}}

### Tự điều khiển iterator thủ công

Bạn vẫn có thể gọi thủ công phương thức `next()` của đối tượng iterator được trả về để đạt được mức kiểm soát tối đa đối với quá trình lặp.

```js
const arr = ["a", "b", "c", "d", "e"];
const arrIter = arr[Symbol.iterator]();
console.log(arrIter.next().value); // a
console.log(arrIter.next().value); // b
console.log(arrIter.next().value); // c
console.log(arrIter.next().value); // d
console.log(arrIter.next().value); // e
```

### Xử lý chuỗi và mảng chuỗi với cùng một hàm

Vì cả [chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator) và mảng đều triển khai giao thức iterable, một hàm tổng quát có thể được thiết kế để xử lý cả hai đầu vào theo cùng cách. Điều này tốt hơn so với việc gọi {{jsxref("Array.prototype.values()")}} trực tiếp, vì điều đó yêu cầu đầu vào phải là mảng, hoặc ít nhất là đối tượng có phương thức đó.

```js
function logIterable(it) {
  if (typeof it[Symbol.iterator] !== "function") {
    console.log(it, "is not iterable.");
    return;
  }
  for (const letter of it) {
    console.log(letter);
  }
}

// Array
logIterable(["a", "b", "c"]);
// a
// b
// c

// String
logIterable("abc");
// a
// b
// c

// Number
logIterable(123);
// 123 is not iterable.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Array.prototype[Symbol.iterator]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- Hướng dẫn [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.keys()")}}
- {{jsxref("Array.prototype.entries()")}}
- {{jsxref("Array.prototype.values()")}}
- [`TypedArray.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/Symbol.iterator)
- [`String.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator)
- {{jsxref("Symbol.iterator")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
