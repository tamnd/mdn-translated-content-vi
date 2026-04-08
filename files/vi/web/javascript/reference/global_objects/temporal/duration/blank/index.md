---
title: Temporal.Duration.prototype.blank
short-title: blank
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/blank
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Duration.blank
sidebar: jsref
---

Thuộc tính accessor **`blank`** của các instance {{jsxref("Temporal.Duration")}} trả về một boolean là `true` nếu duration này đại diện cho duration bằng không, và `false` nếu không. Tương đương với `duration.sign === 0`.

## Ví dụ

### Sử dụng blank

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -30 });
const d3 = Temporal.Duration.from({ hours: 0 });

console.log(d1.blank); // false
console.log(d2.blank); // false
console.log(d3.blank); // true
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/sign", "Temporal.Duration.prototype.sign")}}
