---
title: Unsigned right shift assignment (>>>=)
slug: Web/JavaScript/Reference/Operators/Unsigned_right_shift_assignment
page-type: javascript-operator
browser-compat: javascript.operators.unsigned_right_shift_assignment
sidebar: jssidebar
---

Toán tử **unsigned right shift assignment (`>>>=`)** thực hiện phép [dịch phải không dấu](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Unsigned right shift assignment (>>>=) operator")}}

```js interactive-example
let a = 5; //  00000000000000000000000000000101

a >>>= 2; //  00000000000000000000000000000001
console.log(a);
// Expected output: 1

let b = -5; // -00000000000000000000000000000101

b >>>= 2; //  00111111111111111111111111111110
console.log(b);
// Expected output: 1073741822
```

## Cú pháp

```js-nolint
x >>>= y
```

## Mô tả

`x >>>= y` tương đương với `x = x >>> y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Sử dụng unsigned right shift assignment

```js
let a = 5; // (00000000000000000000000000000101)
a >>>= 2; // 1 (00000000000000000000000000000001)

let b = -5; // (-00000000000000000000000000000101)
b >>>= 2; // 1073741822 (00111111111111111111111111111110)

let c = 5n;
c >>>= 2n; // 1n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Unsigned right shift (`>>>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift)
