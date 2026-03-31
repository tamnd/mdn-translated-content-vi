---
title: Subtraction assignment (-=)
slug: Web/JavaScript/Reference/Operators/Subtraction_assignment
page-type: javascript-operator
browser-compat: javascript.operators.subtraction_assignment
sidebar: jssidebar
---

Toán tử **subtraction assignment (`-=`)** thực hiện phép [trừ](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Subtraction assignment (-=) operator")}}

```js interactive-example
let a = 2;

console.log((a -= 3));
// Expected output: -1

console.log((a -= "Hello"));
// Expected output: NaN
```

## Cú pháp

```js-nolint
x -= y
```

## Mô tả

`x -= y` tương đương với `x = x - y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Subtraction assignment với số

```js
let bar = 5;

bar -= 2; // 3
```

Các giá trị không phải BigInt sẽ được ép kiểu thành số:

```js
bar -= "foo"; // NaN
```

### Subtraction assignment với BigInt

```js
let foo = 3n;
foo -= 2n; // 1n
foo -= 1; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Subtraction (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction)
