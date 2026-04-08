---
title: "RangeError: BigInt negative exponent"
slug: Web/JavaScript/Reference/Errors/BigInt_negative_exponent
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "BigInt negative exponent" xảy ra khi một {{jsxref("BigInt")}} được nâng lên lũy thừa của một giá trị BigInt âm.

## Thông báo

```plain
RangeError: Exponent must be positive (V8-based)
RangeError: BigInt negative exponent (Firefox)
RangeError: Negative exponent is not allowed (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}.

## Nguyên nhân?

Số mũ của phép tính [lũy thừa](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation) phải là dương. Vì số mũ âm sẽ lấy nghịch đảo của cơ số, kết quả sẽ nằm trong khoảng -1 và 1 trong hầu hết các trường hợp, làm tròn xuống `0n`. Để phát hiện các sai lầm, số mũ âm không được phép. Hãy kiểm tra xem số mũ có không âm không trước khi thực hiện lũy thừa.

## Ví dụ

### Sử dụng BigInt âm làm số mũ

```js example-bad
const a = 1n;
const b = -1n;
const c = a ** b;
// RangeError: BigInt negative exponent
```

Thay vào đó, hãy kiểm tra xem số mũ có âm không trước, và hoặc phát ra lỗi với thông báo tốt hơn, hoặc quay về một giá trị khác, chẳng hạn `0n` hoặc `undefined`.

```js example-good
const a = 1n;
const b = -1n;
const quotient = b >= 0n ? a ** b : 0n;
```

## Xem thêm

- [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
- [Exponentiation (`**`)](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation)
