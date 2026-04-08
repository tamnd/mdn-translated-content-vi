---
title: Remainder assignment (%=)
slug: Web/JavaScript/Reference/Operators/Remainder_assignment
page-type: javascript-operator
browser-compat: javascript.operators.remainder_assignment
sidebar: jssidebar
---

Toán tử **remainder assignment (`%=`)** thực hiện phép [lấy phần dư](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Remainder assignment (%=) operator")}}

```js interactive-example
let a = 3;

console.log((a %= 2));
// Expected output: 1

console.log((a %= 0));
// Expected output: NaN

console.log((a %= "hello"));
// Expected output: NaN
```

## Cú pháp

```js-nolint
x %= y
```

## Mô tả

`x %= y` tương đương với `x = x % y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Sử dụng remainder assignment

```js
let bar = 5;

bar %= 2; // 1
bar %= "foo"; // NaN
bar %= 0; // NaN

let foo = 3n;
foo %= 2n; // 1n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
