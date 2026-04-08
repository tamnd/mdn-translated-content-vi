---
title: Temporal.Duration.prototype.sign
short-title: sign
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/sign
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Duration.sign
sidebar: jsref
---

Thuộc tính accessor **`sign`** của các instance {{jsxref("Temporal.Duration")}} trả về `1` nếu duration này dương, `-1` nếu âm, và `0` nếu bằng không. Vì [một duration không bao giờ có dấu hỗn hợp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_sign), dấu của một duration được xác định bởi dấu của bất kỳ trường khác không nào của nó.

## Ví dụ

### Sử dụng sign

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -30 });
const d3 = Temporal.Duration.from({ hours: 0 });

console.log(d1.sign); // 1
console.log(d2.sign); // -1
console.log(d3.sign); // 0

console.log(d1.abs().sign); // 1
console.log(d2.abs().sign); // 1
console.log(d3.abs().sign); // 0

console.log(d1.negated().sign); // -1
console.log(d2.negated().sign); // 1
console.log(d3.negated().sign); // 0
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/abs", "Temporal.Duration.prototype.abs()")}}
- {{jsxref("Temporal/Duration/negated", "Temporal.Duration.prototype.negated()")}}
- {{jsxref("Temporal/Duration/blank", "Temporal.Duration.prototype.blank")}}
