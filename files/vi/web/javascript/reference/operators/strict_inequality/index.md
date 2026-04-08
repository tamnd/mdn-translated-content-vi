---
title: Strict inequality (!==)
slug: Web/JavaScript/Reference/Operators/Strict_inequality
page-type: javascript-operator
browser-compat: javascript.operators.strict_inequality
sidebar: jssidebar
---

Operator **strict inequality (`!==`)** kiểm tra xem hai toán hạng của nó có không bằng nhau không, trả về kết quả Boolean. Không giống như operator [inequality](/en-US/docs/Web/JavaScript/Reference/Operators/Inequality), operator strict inequality luôn coi các toán hạng có kiểu khác nhau là khác nhau.

{{InteractiveExample("JavaScript Demo: Strict inequality (!==) operator")}}

```js interactive-example
console.log(1 !== 1);
// Expected output: false

console.log("hello" !== "hello");
// Expected output: false

console.log("1" !== 1);
// Expected output: true

console.log(0 !== false);
// Expected output: true
```

## Cú pháp

```js-nolint
x !== y
```

## Mô tả

Operator strict inequality kiểm tra xem các toán hạng của nó có không bằng nhau không. Nó là phủ định của operator [strict equality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality), vì vậy hai dòng sau sẽ luôn cho cùng kết quả:

```js
x !== y;

!(x === y);
```

Để biết chi tiết về thuật toán so sánh, xem trang về operator [strict equality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).

Giống như operator strict equality, operator strict inequality luôn coi các toán hạng có kiểu khác nhau là khác nhau:

```js
3 !== "3"; // true
```

## Ví dụ

### So sánh các toán hạng cùng kiểu

```js
"hello" !== "hello"; // false
"hello" !== "hola"; // true

3 !== 3; // false
3 !== 4; // true

true !== true; // false
true !== false; // true

null !== null; // false
```

### So sánh các toán hạng khác kiểu

```js
"3" !== 3; // true
true !== 1; // true
null !== undefined; // true
```

### So sánh các object

```js
const object1 = {
  key: "value",
};

const object2 = {
  key: "value",
};

console.log(object1 !== object2); // true
console.log(object1 !== object1); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Equality (`==`)](/en-US/docs/Web/JavaScript/Reference/Operators/Equality)
- [Inequality (`!=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Inequality)
- [Strict equality (`===`)](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality)
