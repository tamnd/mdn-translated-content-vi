---
title: Addition assignment (+=)
slug: Web/JavaScript/Reference/Operators/Addition_assignment
page-type: javascript-operator
browser-compat: javascript.operators.addition_assignment
sidebar: jssidebar
---

Toán tử **addition assignment (`+=`)** thực hiện phép [cộng](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) (là phép cộng số học hoặc nối chuỗi) trên hai toán hạng và gán kết quả cho toán hạng bên trái.

{{InteractiveExample("JavaScript Demo: Addition assignment (+=) operator")}}

```js interactive-example
let a = 2;
let b = "hello";

console.log((a += 3)); // Addition
// Expected output: 5

console.log((b += " world")); // Concatenation
// Expected output: "hello world"
```

## Cú pháp

```js-nolint
x += y
```

## Mô tả

`x += y` tương đương với `x = x + y`, ngoại trừ biểu thức `x` chỉ được tính một lần.

## Ví dụ

### Addition assignment với số

```js
let bar = 5;
bar += 2; // 7
```

Các giá trị không phải chuỗi, không phải BigInt sẽ được ép kiểu thành số:

```js
let baz = true;
baz += 1; // 2
baz += false; // 2
```

### Addition assignment với BigInt

```js
let x = 1n;
x += 2n; // 3n

x += 1; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

### Addition assignment với chuỗi

```js
let foo = "foo";
foo += false; // "foofalse"
foo += "bar"; // "foofalsebar"

let bar = 5;
bar += "foo"; // "5foo"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Toán tử gán trong hướng dẫn JS](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
