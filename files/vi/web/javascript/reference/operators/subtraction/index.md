---
title: Subtraction (-)
slug: Web/JavaScript/Reference/Operators/Subtraction
page-type: javascript-operator
browser-compat: javascript.operators.subtraction
sidebar: jssidebar
---

Operator **trừ (`-`)** trừ hai toán hạng, tạo ra hiệu của chúng.

{{InteractiveExample("JavaScript Demo: Subtraction (-) operator")}}

```js interactive-example
console.log(5 - 3);
// Expected output: 2

console.log(3.5 - 5);
// Expected output: -1.5

console.log(5 - "hello");
// Expected output: NaN

console.log(5 - true);
// Expected output: 4
```

## Cú pháp

```js-nolint
x - y
```

## Mô tả

Operator `-` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc cả hai toán hạng thành các giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện phép trừ BigInt nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó thực hiện phép trừ số. Một {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành số.

## Ví dụ

### Trừ dùng số

```js
5 - 3; // 2
3 - 5; // -2
```

Các giá trị không phải BigInt khác được ép buộc thành số:

```js
"foo" - 3; // NaN; "foo" được chuyển đổi thành số NaN
5 - "3"; // 2; "3" được chuyển đổi thành số 3
```

### Trừ dùng BigInt

```js
2n - 1n; // 1n
```

Bạn không thể trộn lẫn các toán hạng BigInt và số trong phép trừ.

```js example-bad
2n - 1; // TypeError: Cannot mix BigInt and other types, use explicit conversions
2 - 1n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

Để thực hiện phép trừ với BigInt và một giá trị không phải BigInt, hãy chuyển đổi một trong hai toán hạng:

```js
2n - BigInt(1); // 1n
Number(2n) - 1; // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
- [Multiplication (`*`)](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
