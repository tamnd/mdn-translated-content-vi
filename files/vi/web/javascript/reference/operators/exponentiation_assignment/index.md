---
title: Exponentiation assignment (**=)
slug: Web/JavaScript/Reference/Operators/Exponentiation_assignment
page-type: javascript-operator
browser-compat: javascript.operators.exponentiation_assignment
sidebar: jssidebar
---

Toán tử **exponentiation assignment (`**=`)\*\* thực hiện phép [lũy thừa](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Exponentiation assignment (**=) operator")}}

```js interactive-example
let a = 3;

console.log((a **= 2));
// Expected output: 9

console.log((a **= 0));
// Expected output: 1

console.log((a **= "hello"));
// Expected output: NaN
```

## Cú pháp

```js-nolint
x **= y
```

## Mô tả

`x **= y` tương đương với `x = x ** y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Exponentiation assignment với số

```js
let bar = 5;
bar **= 2; // 25
```

Các giá trị không phải BigInt sẽ được ép kiểu thành số:

```js
let baz = 5;
baz **= "foo"; // NaN
```

### Exponentiation assignment với BigInt

```js
let foo = 3n;
foo **= 2n; // 9n
foo **= 1; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
