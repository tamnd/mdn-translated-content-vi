---
title: Increment (++)
slug: Web/JavaScript/Reference/Operators/Increment
page-type: javascript-operator
browser-compat: javascript.operators.increment
sidebar: jssidebar
---

Operator **tăng (`++`)** tăng (cộng một vào) toán hạng của nó và trả về giá trị trước hoặc sau khi tăng, tùy thuộc vào vị trí đặt operator.

{{InteractiveExample("JavaScript Demo: Increment (++) operator")}}

```js interactive-example
let x = 3;
const y = x++;

console.log(`x:${x}, y:${y}`);
// Expected output: "x:4, y:3"

let a = 3;
const b = ++a;

console.log(`a:${a}, b:${b}`);
// Expected output: "a:4, b:4"
```

## Cú pháp

```js-nolint
x++
++x
```

## Mô tả

Operator `++` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc toán hạng thành giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của nó. Nó thực hiện tăng BigInt nếu toán hạng trở thành BigInt; nếu không, nó thực hiện tăng số.

Nếu dùng postfix, với operator sau toán hạng (ví dụ, `x++`), operator tăng sẽ tăng và trả về giá trị trước khi tăng.

Nếu dùng prefix, với operator trước toán hạng (ví dụ, `++x`), operator tăng sẽ tăng và trả về giá trị sau khi tăng.

Operator tăng chỉ có thể được áp dụng trên các toán hạng là tham chiếu (biến và thuộc tính của object; tức là, [assignment target](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment) hợp lệ). `++x` bản thân được ước lượng thành một giá trị, không phải tham chiếu, vì vậy bạn không thể nối chuỗi nhiều operator tăng với nhau.

```js-nolint example-bad
++(++x); // SyntaxError: Invalid left-hand side expression in prefix operation
```

## Ví dụ

### Tăng postfix

```js
let x = 3;
const y = x++;
// x is 4; y is 3

let x2 = 3n;
const y2 = x2++;
// x2 is 4n; y2 is 3n
```

### Tăng prefix

```js
let x = 3;
const y = ++x;
// x is 4; y is 4

let x2 = 3n;
const y2 = ++x2;
// x2 is 4n; y2 is 4n
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
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
