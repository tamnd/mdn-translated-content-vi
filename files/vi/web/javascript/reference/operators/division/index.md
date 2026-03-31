---
title: Division (/)
slug: Web/JavaScript/Reference/Operators/Division
page-type: javascript-operator
browser-compat: javascript.operators.division
sidebar: jssidebar
---

Operator **chia (`/`)** tạo ra thương của các toán hạng trong đó toán hạng bên trái là số bị chia và toán hạng bên phải là số chia.

{{InteractiveExample("JavaScript Demo: Division (/) operator")}}

```js interactive-example
console.log(12 / 2);
// Expected output: 6

console.log(3 / 2);
// Expected output: 1.5

console.log(6 / "3");
// Expected output: 2

console.log(2 / 0);
// Expected output: Infinity
```

## Cú pháp

```js-nolint
x / y
```

## Mô tả

Operator `/` được nạp chồng cho hai kiểu toán hạng: số và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt). Đầu tiên nó [ép buộc cả hai toán hạng thành các giá trị số](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và kiểm tra kiểu của chúng. Nó thực hiện phép chia BigInt nếu cả hai toán hạng đều trở thành BigInt; nếu không, nó thực hiện phép chia số. Một {{jsxref("TypeError")}} được ném ra nếu một toán hạng trở thành BigInt nhưng toán hạng kia trở thành số.

Đối với phép chia BigInt, kết quả là thương của hai toán hạng được làm tròn về phía 0, và phần dư bị bỏ qua. Một {{jsxref("RangeError")}} được ném ra nếu số chia `y` là `0n`. Điều này là do phép chia số cho 0 trả về `Infinity` hoặc `-Infinity`, nhưng BigInt không có khái niệm về vô cực.

## Ví dụ

### Chia dùng số

```js
1 / 2; // 0.5
Math.floor(3 / 2); // 1
1.0 / 2.0; // 0.5

2 / 0; // Infinity
2.0 / 0.0; // Infinity, because 0.0 === 0
2.0 / -0.0; // -Infinity
```

Các giá trị không phải BigInt khác được ép buộc thành số:

```js
5 / "2"; // 2.5
5 / "foo"; // NaN
```

### Chia dùng BigInt

```js
1n / 2n; // 0n
5n / 3n; // 1n
-1n / 3n; // 0n
1n / -3n; // 0n

2n / 0n; // RangeError: BigInt division by zero
```

Bạn không thể trộn lẫn các toán hạng BigInt và số trong phép chia.

```js example-bad
2n / 2; // TypeError: Cannot mix BigInt and other types, use explicit conversions
2 / 2n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

Để thực hiện phép chia với BigInt và một giá trị không phải BigInt, hãy chuyển đổi một trong hai toán hạng:

```js
2n / BigInt(2); // 1n
Number(2n) / 2; // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Addition (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Addition)
- [Subtraction (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Subtraction)
- [Multiplication (`*`)](/en-US/docs/Web/JavaScript/Reference/Operators/Multiplication)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
- [Increment (`++`)](/en-US/docs/Web/JavaScript/Reference/Operators/Increment)
- [Decrement (`--`)](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement)
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
- [Unary plus (`+`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_plus)
