---
title: Bitwise AND assignment (&=)
slug: Web/JavaScript/Reference/Operators/Bitwise_AND_assignment
page-type: javascript-operator
browser-compat: javascript.operators.bitwise_and_assignment
sidebar: jssidebar
---

Toán tử **bitwise AND assignment (`&=`)** thực hiện phép [bitwise AND](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Bitwise AND assignment (&=) operator", "shorter")}}

```js interactive-example
let a = 5; // 00000000000000000000000000000101
a &= 3; // 00000000000000000000000000000011

console.log(a); // 00000000000000000000000000000001
// Expected output: 1
```

## Cú pháp

```js-nolint
x &= y
```

## Mô tả

`x &= y` tương đương với `x = x & y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Sử dụng bitwise AND assignment

```js
let a = 5;
// 5:     00000000000000000000000000000101
// 2:     00000000000000000000000000000010
a &= 2; // 0

let b = 5n;
b &= 2n; // 0n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Bitwise AND (`&`)](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_AND)
