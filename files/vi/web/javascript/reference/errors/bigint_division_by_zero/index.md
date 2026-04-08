---
title: "RangeError: BigInt division by zero"
slug: Web/JavaScript/Reference/Errors/BigInt_division_by_zero
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "BigInt division by zero" xảy ra khi một {{jsxref("BigInt")}} được chia cho `0n`.

## Thông báo

```plain
RangeError: Division by zero (V8-based)
RangeError: BigInt division by zero (Firefox)
RangeError: 0 is an invalid divisor value. (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}.

## Nguyên nhân?

Số chia của phép tính [chia](/en-US/docs/Web/JavaScript/Reference/Operators/Division) hoặc [chia lấy dư](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder) là `0n`. Trong phép tính số {{jsxref("Number")}}, điều này tạo ra [`Infinity`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Infinity), nhưng không có "giá trị vô cùng" trong BigInts, vì vậy một lỗi được phát sinh. Hãy kiểm tra xem số chia có phải là `0n` không trước khi thực hiện phép chia.

## Ví dụ

### Chia cho 0n

```js example-bad
const a = 1n;
const b = 0n;
const quotient = a / b;
// RangeError: BigInt division by zero
```

Thay vào đó, hãy kiểm tra xem số chia có phải là `0n` không trước, và hoặc phát ra lỗi với thông báo tốt hơn, hoặc quay về một giá trị khác, chẳng hạn `Infinity` hoặc `undefined`.

```js example-good
const a = 1n;
const b = 0n;
const quotient = b === 0n ? undefined : a / b;
```

## Xem thêm

- [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
- [Division (`/`)](/en-US/docs/Web/JavaScript/Reference/Operators/Division)
- [Remainder (`%`)](/en-US/docs/Web/JavaScript/Reference/Operators/Remainder)
