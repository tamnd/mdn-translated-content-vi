---
title: Bitwise XOR assignment (^=)
slug: Web/JavaScript/Reference/Operators/Bitwise_XOR_assignment
page-type: javascript-operator
browser-compat: javascript.operators.bitwise_xor_assignment
sidebar: jssidebar
---

Toán tử **bitwise XOR assignment (`^=`)** thực hiện phép [bitwise XOR](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_XOR) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Bitwise XOR assignment (^=) operator", "shorter")}}

```js interactive-example
let a = 5; // 00000000000000000000000000000101
a ^= 3; // 00000000000000000000000000000011

console.log(a); // 00000000000000000000000000000110
// Expected output: 6
```

## Cú pháp

```js-nolint
x ^= y
```

## Mô tả

`x ^= y` tương đương với `x = x ^ y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Sử dụng bitwise XOR assignment

```js
let a = 5; // (00000000000000000000000000000101)
a ^= 3; // (00000000000000000000000000000011)

console.log(a); // 6 (00000000000000000000000000000110)

let b = 5; // (00000000000000000000000000000101)
b ^= 0; // (00000000000000000000000000000000)

console.log(b); // 5 (00000000000000000000000000000101)

let c = 5n;
c ^= 3n;
console.log(c); // 6n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Bitwise XOR (`^`)](/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_XOR)
