---
title: Multiplication (*)
slug: Web/JavaScript/Reference/Operators/Multiplication
page-type: javascript-operator
browser-compat: javascript.operators.multiplication
sidebar: jssidebar
---

Operator **nhân (`*`)** tạo ra tích của các toán hạng.

{{InteractiveExample("JavaScript Demo: Multiplication (*) operator")}}

```js interactive-example
console.log(3 * 4);
// Expected output: 12

console.log(-3 * 4);
// Expected output: -12

console.log("3" * 2);
// Expected output: 6

console.log("foo" * 2);
// Expected output: NaN
```

## Cú pháp

```js-nolint
x * y
```

## Mô tả

Operator `*` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc cả hai toán hạng thành các giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện phép nhân BigInt nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó thực hiện phép nhân số. Một {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành số.

## Ví dụ

### Nhân dùng số

```js
2 * 2; // 4
-2 * 2; // -4

Infinity * 0; // NaN
Infinity * Infinity; // Infinity
```

Các giá trị không phải BigInt khác được ép buộc thành số:

```js
"foo" * 2; // NaN
"2" * 2; // 4
```

### Nhân dùng BigInt

```js
2n * 2n; // 4n
-2n * 2n; // -4n
```

Bạn không thể trộn lẫn các toán hạng BigInt và số trong phép nhân.

```js example-bad
2n * 2; // TypeError: Cannot mix BigInt and other types, use explicit conversions
2 * 2n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

Để thực hiện phép nhân với BigInt và một giá trị không phải BigInt, hãy chuyển đổi một trong hai toán hạng:

```js
2n * BigInt(2); // 4n
Number(2n) * 2; // 4
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
- [Subtraction (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
