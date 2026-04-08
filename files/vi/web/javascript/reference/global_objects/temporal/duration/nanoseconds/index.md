---
title: Temporal.Duration.prototype.nanoseconds
short-title: nanoseconds
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/nanoseconds
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Duration.nanoseconds
sidebar: jsref
---

Thuộc tính accessor **`nanoseconds`** của các instance {{jsxref("Temporal.Duration")}} trả về một số nguyên đại diện cho số nanosecond trong duration.

Trừ khi duration được [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing), bạn không thể giả định phạm vi của giá trị này, nhưng bạn có thể biết dấu của nó bằng cách kiểm tra thuộc tính [`sign`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/sign) của duration. Nếu được cân bằng đến một đơn vị lớn hơn nanosecond, giá trị tuyệt đối của `nanoseconds` sẽ nằm trong khoảng từ 0 đến 999, bao gồm cả hai đầu.

Set accessor của `nanoseconds` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/Duration/with", "with()")}} để tạo một đối tượng `Temporal.Duration` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng nanoseconds

```js
const d1 = Temporal.Duration.from({ microseconds: 1, nanoseconds: 500 });
const d2 = Temporal.Duration.from({ microseconds: -1, nanoseconds: -500 });
const d3 = Temporal.Duration.from({ microseconds: 1 });
const d4 = Temporal.Duration.from({ nanoseconds: 1000 });

console.log(d1.nanoseconds); // 500
console.log(d2.nanoseconds); // -500
console.log(d3.nanoseconds); // 0
console.log(d4.nanoseconds); // 1000

// Balance d4
const d4Balanced = d4.round({ largestUnit: "microseconds" });
console.log(d4Balanced.nanoseconds); // 0
console.log(d4Balanced.microseconds); // 1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/years", "Temporal.Duration.prototype.years")}}
- {{jsxref("Temporal/Duration/months", "Temporal.Duration.prototype.months")}}
- {{jsxref("Temporal/Duration/weeks", "Temporal.Duration.prototype.weeks")}}
- {{jsxref("Temporal/Duration/days", "Temporal.Duration.prototype.days")}}
- {{jsxref("Temporal/Duration/hours", "Temporal.Duration.prototype.hours")}}
- {{jsxref("Temporal/Duration/minutes", "Temporal.Duration.prototype.minutes")}}
- {{jsxref("Temporal/Duration/seconds", "Temporal.Duration.prototype.seconds")}}
- {{jsxref("Temporal/Duration/milliseconds", "Temporal.Duration.prototype.milliseconds")}}
- {{jsxref("Temporal/Duration/microseconds", "Temporal.Duration.prototype.microseconds")}}
