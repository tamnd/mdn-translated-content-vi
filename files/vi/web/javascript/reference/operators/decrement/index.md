---
title: Decrement (--)
slug: Web/JavaScript/Reference/Operators/Decrement
page-type: javascript-operator
browser-compat: javascript.operators.decrement
sidebar: jssidebar
---

Operator **giảm (`--`)** giảm (trừ một từ) toán hạng của nó và trả về giá trị trước hoặc sau khi giảm, tùy thuộc vào vị trí đặt operator.

{{InteractiveExample("JavaScript Demo: Decrement (--) operator")}}

```js interactive-example
let x = 3;
const y = x--;

console.log(`x:${x}, y:${y}`);
// Expected output: "x:2, y:3"

let a = 3;
const b = --a;

console.log(`a:${a}, b:${b}`);
// Expected output: "a:2, b:2"
```

## Cú pháp

```js-nolint
x--
--x
```

## Mô tả

Operator `--` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc toán hạng thành giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của nó. Nó thực hiện giảm BigInt nếu toán hạng trở thành BigInt; nếu không, nó thực hiện giảm số.

Nếu dùng postfix, với operator sau toán hạng (ví dụ, `x--`), operator giảm sẽ giảm và trả về giá trị trước khi giảm.

Nếu dùng prefix, với operator trước toán hạng (ví dụ, `--x`), operator giảm sẽ giảm và trả về giá trị sau khi giảm.

Operator giảm chỉ có thể được áp dụng trên các toán hạng là tham chiếu (biến và thuộc tính của object; tức là, [assignment target](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment) hợp lệ). `--x` bản thân được ước lượng thành một giá trị, không phải tham chiếu, vì vậy bạn không thể nối chuỗi nhiều operator giảm với nhau.

```js-nolint example-bad
--(--x); // SyntaxError: Invalid left-hand side expression in prefix operation
```

## Ví dụ

### Giảm postfix

```js
let x = 3;
const y = x--;
// x is 2; y is 3

let x2 = 3n;
const y2 = x2--;
// x2 is 2n; y2 is 3n
```

### Giảm prefix

```js
let x = 3;
const y = --x;
// x is 2; y = 2

let x2 = 3n;
const y2 = --x2;
// x2 is 2n; y2 is 2n
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
- [Subtraction (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
- [Multiplication (`*`)](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
