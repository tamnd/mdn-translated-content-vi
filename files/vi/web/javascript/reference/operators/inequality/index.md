---
title: Inequality (!=)
slug: Web/JavaScript/Reference/Operators/Inequality
page-type: javascript-operator
browser-compat: javascript.operators.inequality
sidebar: jssidebar
---

Operator **không bằng (`!=`)** kiểm tra xem hai toán hạng của nó có không bằng nhau không, trả về kết quả Boolean. Không giống như operator [strict inequality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality), nó cố gắng chuyển đổi và so sánh các toán hạng có kiểu khác nhau.

{{InteractiveExample("JavaScript Demo: Inequality (!=) operator")}}

```js interactive-example
console.log(1 != 1);
// Expected output: false

console.log("hello" != "hello");
// Expected output: false

console.log("1" != 1);
// Expected output: false

console.log(0 != false);
// Expected output: false
```

## Cú pháp

```js-nolint
x != y
```

## Mô tả

Operator không bằng kiểm tra xem các toán hạng của nó có không bằng nhau không. Nó là phủ định của operator [equality](/en-US/docs/Web/JavaScript/Reference/Operators/Equality), vì vậy hai dòng sau sẽ luôn cho cùng kết quả:

```js
x != y;

!(x == y);
```

Để biết chi tiết về thuật toán so sánh, xem trang về operator [equality](/en-US/docs/Web/JavaScript/Reference/Operators/Equality).

Giống như operator equality, operator không bằng sẽ cố gắng chuyển đổi và so sánh các toán hạng có kiểu khác nhau:

```js
3 != "3"; // false
```

Để ngăn chặn điều này và yêu cầu các kiểu khác nhau được coi là khác nhau, hãy dùng operator [strict inequality](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality) thay thế:

```js
3 !== "3"; // true
```

## Ví dụ

### So sánh không có chuyển đổi kiểu

```js
1 != 2; // true
"hello" != "hola"; // true

1 != 1; // false
"hello" != "hello"; // false
```

### So sánh có chuyển đổi kiểu

```js
"1" != 1; // false
1 != "1"; // false
0 != false; // false
0 != null; // true
0 != undefined; // true
0 != !!null; // false, look at Logical NOT operator
0 != !!undefined; // false, look at Logical NOT operator
null != undefined; // false

const number1 = new Number(3);
const number2 = new Number(3);
number1 != 3; // false
number1 != number2; // true
```

### So sánh các object

```js
const object1 = {
  key: "value",
};

const object2 = {
  key: "value",
};

console.log(object1 != object2); // true
console.log(object1 != object1); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Equality (`==`)](/en-US/docs/Web/JavaScript/Reference/Operators/Equality)
- [Strict equality (`===`)](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality)
- [Strict inequality (`!==`)](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality)
