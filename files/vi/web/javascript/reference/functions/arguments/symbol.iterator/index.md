---
title: arguments[Symbol.iterator]()
short-title: "[Symbol.iterator]()"
slug: Web/JavaScript/Reference/Functions/arguments/Symbol.iterator
page-type: javascript-instance-method
browser-compat: javascript.functions.arguments.@@iterator
sidebar: jssidebar
---

Phương thức **`[Symbol.iterator]()`** của các đối tượng {{jsxref("Functions/arguments", "arguments")}} triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) và cho phép các đối tượng `arguments` được sử dụng bởi hầu hết các cú pháp mong đợi iterable, như [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) và vòng lặp {{jsxref("Statements/for...of", "for...of")}}. Nó trả về một [đối tượng array iterator](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) yield giá trị của mỗi chỉ số trong đối tượng `arguments`.

Giá trị ban đầu của thuộc tính này là cùng một đối tượng hàm như giá trị ban đầu của thuộc tính {{jsxref("Array.prototype.values")}} (và cũng giống như [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)).

## Cú pháp

```js-nolint
arguments[Symbol.iterator]()
```

### Tham số

Không có.

### Giá trị trả về

Giá trị trả về giống như {{jsxref("Array.prototype.values()")}}: một [đối tượng iterator iterable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới yield giá trị của mỗi chỉ số trong đối tượng `arguments`.

## Ví dụ

### Duyệt qua bằng vòng lặp for...of

Lưu ý rằng bạn hiếm khi cần gọi phương thức này trực tiếp. Sự tồn tại của phương thức `[Symbol.iterator]()` làm cho các đối tượng `arguments` [có thể duyệt qua](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), và các cú pháp duyệt như vòng lặp `for...of` tự động gọi phương thức này để lấy iterator để duyệt.

```js
function f() {
  for (const letter of arguments) {
    console.log(letter);
  }
}
f("w", "y", "k", "o", "p");
```

### Tự điều khiển iterator thủ công

Bạn vẫn có thể gọi thủ công phương thức `next()` của đối tượng iterator được trả về để đạt được quyền kiểm soát tối đa đối với quá trình duyệt.

```js
function f() {
  const argsIter = arguments[Symbol.iterator]();
  console.log(argsIter.next().value); // w
  console.log(argsIter.next().value); // y
  console.log(argsIter.next().value); // k
  console.log(argsIter.next().value); // o
  console.log(argsIter.next().value); // p
}
f("w", "y", "k", "o", "p");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Functions/arguments", "arguments")}}
- {{jsxref("Array.prototype.values()")}}
- {{jsxref("Symbol.iterator")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
