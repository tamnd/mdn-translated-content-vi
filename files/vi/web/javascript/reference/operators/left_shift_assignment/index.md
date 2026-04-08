---
title: Left shift assignment (<<=)
slug: Web/JavaScript/Reference/Operators/Left_shift_assignment
page-type: javascript-operator
browser-compat: javascript.operators.left_shift_assignment
sidebar: jssidebar
---

Toán tử **left shift assignment (`<<=`)** thực hiện phép [dịch trái](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Left shift assignment (<<=) operator", "shorter")}}

```js interactive-example
let a = 5; // 00000000000000000000000000000101

a <<= 2; // 00000000000000000000000000010100

console.log(a);
// Expected output: 20
```

## Cú pháp

```js-nolint
x <<= y
```

## Mô tả

`x <<= y` tương đương với `x = x << y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Sử dụng left shift assignment

```js
let a = 5;
// 00000000000000000000000000000101

a <<= 2; // 20
// 00000000000000000000000000010100

let b = 5n;
b <<= 2n; // 20n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Left shift (`<<`)](/en-US/docs/Web/JavaScript/Reference/Operators/Left_shift)
