---
title: Unary negation (-)
slug: Web/JavaScript/Reference/Operators/Unary_negation
page-type: javascript-operator
browser-compat: javascript.operators.unary_negation
sidebar: jssidebar
---

Toán tử **unary negation (`-`)** đứng trước toán hạng của nó và phủ định nó.

{{InteractiveExample("JavaScript Demo: Unary negation (-) operator")}}

```js interactive-example
const x = 4;
const y = -x;

console.log(y);
// Expected output: -4

const a = "4";
const b = -a;

console.log(b);
// Expected output: -4
```

## Cú pháp

```js-nolint
-x
```

## Mô tả

Toán tử `-` được nạp chồng cho hai kiểu toán hạng: number và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc toán hạng thành giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của nó. Nó thực hiện phép phủ định BigInt nếu toán hạng trở thành BigInt; nếu không, nó thực hiện phép phủ định number.

## Ví dụ

### Phủ định số

```js
const x = 3;
const y = -x;
// y is -3; x is 3
```

### Phủ định giá trị không phải số

Toán tử unary negation có thể chuyển đổi một giá trị không phải số thành số.

```js
const x = "4";
const y = -x;

// y is -4
```

BigInt có thể được phủ định bằng toán tử unary negation.

```js
const x = 4n;
const y = -x;

// y is -4n
```

## Đặc tả

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
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
