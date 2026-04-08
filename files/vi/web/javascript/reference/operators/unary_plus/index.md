---
title: Unary plus (+)
slug: Web/JavaScript/Reference/Operators/Unary_plus
page-type: javascript-operator
browser-compat: javascript.operators.unary_plus
sidebar: jssidebar
---

Toán tử **unary plus (`+`)** đứng trước toán hạng của nó và đánh giá thành toán hạng đó nhưng cố gắng [chuyển đổi nó thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), nếu chưa phải là số.

{{InteractiveExample("JavaScript Demo: Unary plus (+) operator", "taller")}}

```js interactive-example
const x = 1;
const y = -1;

console.log(+x);
// Expected output: 1

console.log(+y);
// Expected output: -1

console.log(+"");
// Expected output: 0

console.log(+true);
// Expected output: 1

console.log(+false);
// Expected output: 0

console.log(+"hello");
// Expected output: NaN
```

## Cú pháp

```js-nolint
+x
```

## Mô tả

Mặc dù unary negation (`-`) cũng có thể chuyển đổi giá trị không phải số, unary plus là cách nhanh nhất và được ưu tiên để chuyển đổi thứ gì đó thành số, vì nó không thực hiện bất kỳ phép toán nào khác trên số đó.

Unary plus thực hiện chính xác các bước giống như [number coercion](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thông thường được sử dụng bởi hầu hết các phương thức tích hợp sẵn mong đợi số. Nó có thể chuyển đổi các biểu diễn string của số nguyên và số thực, cũng như các giá trị không phải string `true`, `false` và `null`. Số nguyên ở cả định dạng thập phân và thập lục phân (có tiền tố `0x`) đều được hỗ trợ. Số âm được hỗ trợ (mặc dù không dành cho hex). Nếu không thể phân tích cú pháp một giá trị cụ thể, nó sẽ đánh giá thành {{jsxref("NaN")}}. Không giống như các toán tử số học khác, hoạt động với cả number và [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt), việc sử dụng toán tử `+` trên các giá trị BigInt sẽ ném ra {{jsxref("TypeError")}}.

## Ví dụ

### Sử dụng với số

```js
const x = 1;
const y = -1;

console.log(+x);
// 1
console.log(+y);
// -1
```

### Sử dụng với giá trị không phải số

```js-nolint
+true  // 1
+false // 0
+null  // 0
+[]    // 0
+function (val) { return val; } // NaN
+1n    // throws TypeError: Cannot convert BigInt value to number
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
- [Unary negation (`-`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unary_negation)
