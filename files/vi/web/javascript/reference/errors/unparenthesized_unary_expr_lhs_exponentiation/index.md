---
title: "SyntaxError: unparenthesized unary expression can't appear on the left-hand side of '**'"
slug: Web/JavaScript/Reference/Errors/Unparenthesized_unary_expr_lhs_exponentiation
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "unparenthesized unary expression can't appear on the left-hand side of '\*\*'" xảy ra khi một toán tử một ngôi (một trong số `typeof`, `void`, `delete`, `await`, `!`, `~`, `+`, `-`) được sử dụng trên toán hạng bên trái của [toán tử lũy thừa](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation) mà không có dấu ngoặc đơn.

## Thông báo

```plain
SyntaxError: Unary operator used immediately before exponentiation expression. Parenthesis must be used to disambiguate operator precedence (V8-based)
SyntaxError: unparenthesized unary expression can't appear on the left-hand side of '**' (Firefox)
SyntaxError: Unexpected token '**'. Ambiguous unary expression in the left hand side of the exponentiation expression; parentheses must be used to disambiguate the expression. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Bạn có thể đã viết cái gì đó như thế này:

```js-nolint example-bad
-a ** b
```

Liệu nó có nên được đánh giá là `(-a) ** b` hay `-(a ** b)` là không rõ ràng. Trong toán học, -x<sup>2</sup> có nghĩa là `-(x ** 2)` — và đó là cách nhiều ngôn ngữ, bao gồm Python, Haskell và PHP, xử lý nó. Nhưng việc ưu tiên toán tử trừ một ngôi hơn `**` phá vỡ tính đối xứng với `a ** -b`, vốn không mơ hồ là `a ** (-b)`. Do đó, ngôn ngữ cấm cú pháp này và yêu cầu bạn đặt dấu ngoặc đơn xung quanh một trong hai phía để giải quyết sự mơ hồ.

```js-nolint example-good
(-a) ** b
-(a ** b)
```

Các toán tử một ngôi khác cũng không thể là phía bên trái của lũy thừa.

```js-nolint example-bad
await a ** b
!a ** b
+a ** b
~a ** b
```

## Ví dụ

Khi viết các biểu thức toán học phức tạp liên quan đến lũy thừa, bạn có thể viết cái gì đó như thế này:

```js-nolint example-bad
function taylorSin(x) {
  return (n) => (-1 ** n * x ** (2 * n + 1)) / factorial(2 * n + 1);
  // SyntaxError: unparenthesized unary expression can't appear on the left-hand side of '**'
}
```

Tuy nhiên, phần `-1 ** n` là bất hợp lệ trong JavaScript. Thay vào đó, hãy đặt dấu ngoặc đơn cho toán hạng bên trái:

```js example-good
function taylorSin(x) {
  return (n) => ((-1) ** n * x ** (2 * n + 1)) / factorial(2 * n + 1);
}
```

Điều này cũng làm cho ý định của code rõ ràng hơn nhiều cho các người đọc khác.

## Xem thêm

- [Lũy thừa (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)
- [Thảo luận gốc về ưu tiên toán tử lũy thừa](https://esdiscuss.org/topic/exponentiation-operator-precedence) trên esdiscuss.org
