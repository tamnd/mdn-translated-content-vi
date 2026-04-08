---
title: Multiplication assignment (*=)
slug: Web/JavaScript/Reference/Operators/Multiplication_assignment
page-type: javascript-operator
browser-compat: javascript.operators.multiplication_assignment
sidebar: jssidebar
---

Toán tử **multiplication assignment (`*=`)** thực hiện phép [nhân](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Multiplication assignment (*=) operator")}}

```js interactive-example
let a = 2;

console.log((a *= 3));
// Expected output: 6

console.log((a *= "hello"));
// Expected output: NaN
```

## Cú pháp

```js-nolint
x *= y
```

## Mô tả

`x *= y` tương đương với `x = x * y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Multiplication assignment với số

```js
let bar = 5;
bar *= 2; // 10
```

Các giá trị không phải BigInt sẽ được ép kiểu thành số:

```js
let bar = 5;
bar *= "foo"; // NaN
```

### Multiplication assignment với BigInt

```js
let foo = 3n;
foo *= 2n; // 6n
foo *= 1; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Multiplication (`*`)](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication)
