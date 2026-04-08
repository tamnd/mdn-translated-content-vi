---
title: Division assignment (/=)
slug: Web/JavaScript/Reference/Operators/Division_assignment
page-type: javascript-operator
browser-compat: javascript.operators.division_assignment
sidebar: jssidebar
---

Toán tử **division assignment (`/=`)** thực hiện phép [chia](/en-US/docs/Web/JavaScript/Reference/Operators/Division) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Division assignment (/=) operator")}}

```js interactive-example
let a = 3;

a /= 2;
console.log(a);
// Expected output: 1.5

a /= 0;
console.log(a);
// Expected output: Infinity

a /= "hello";
console.log(a);
// Expected output: NaN
```

## Cú pháp

```js-nolint
x /= y
```

## Mô tả

`x /= y` tương đương với `x = x / y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Division assignment với số

```js
let bar = 5;

bar /= 2; // 2.5
bar /= 2; // 1.25
bar /= 0; // Infinity
```

Các giá trị không phải BigInt sẽ được ép kiểu thành số:

```js
let bar = 5;
bar /= "2"; // 2.5
bar /= "foo"; // NaN
```

### Division assignment với BigInt

```js
let foo = 3n;
foo /= 2n; // 1n
foo /= 2n; // 0n

foo /= 0n; // RangeError: BigInt division by zero
foo /= 1; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
