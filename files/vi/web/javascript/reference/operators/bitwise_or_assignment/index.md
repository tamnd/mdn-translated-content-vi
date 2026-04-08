---
title: Bitwise OR assignment (|=)
slug: Web/JavaScript/Reference/Operators/Bitwise_OR_assignment
page-type: javascript-operator
browser-compat: javascript.operators.bitwise_or_assignment
sidebar: jssidebar
---

Toán tử **bitwise OR assignment (`|=`)** thực hiện phép [bitwise OR](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_OR) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Bitwise OR assignment (|=) operator", "shorter")}}

```js interactive-example
let a = 5; // 00000000000000000000000000000101
a |= 3; // 00000000000000000000000000000011

console.log(a); // 00000000000000000000000000000111
// Expected output: 7
```

## Cú pháp

```js-nolint
x |= y
```

## Mô tả

`x |= y` tương đương với `x = x | y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Sử dụng bitwise OR assignment

```js
let a = 5;
a |= 2; // 7
// 5: 00000000000000000000000000000101
// 2: 00000000000000000000000000000010
// -----------------------------------
// 7: 00000000000000000000000000000111

let b = 5n;
b |= 2n; // 7n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Bitwise OR (`|`)](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_OR)
- [Logical OR assignment (`||=`)](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_OR_assignment)
