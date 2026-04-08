---
title: Temporal.Duration.prototype.weeks
short-title: weeks
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/weeks
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Duration.weeks
sidebar: jsref
---

Thuộc tính accessor **`weeks`** của các instance {{jsxref("Temporal.Duration")}} trả về một số nguyên biểu diễn số tuần trong duration.

Trừ khi duration được [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing), bạn không thể giả định phạm vi của giá trị này, nhưng bạn có thể biết dấu của nó bằng cách kiểm tra thuộc tính [`sign`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/sign) của duration. Nếu nó được cân bằng đến đơn vị lớn hơn tuần, phạm vi giá trị tuyệt đối của `weeks` phụ thuộc vào lịch (số tuần trong một tháng hoặc năm).

Set accessor của `weeks` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/Duration/with", "with()")}} để tạo một đối tượng `Temporal.Duration` mới với giá trị mới mong muốn.

## Ví dụ

### Sử dụng weeks

```js
const d1 = Temporal.Duration.from({ weeks: 1, days: 1 });
const d2 = Temporal.Duration.from({ weeks: -1, days: -1 });
const d3 = Temporal.Duration.from({ weeks: 1 });
const d4 = Temporal.Duration.from({ days: 7 });

console.log(d1.weeks); // 1
console.log(d2.weeks); // -1
console.log(d3.weeks); // 1
console.log(d4.weeks); // 0

// Cân bằng d4
const d4Balanced = d4.round({
  largestUnit: "weeks",
  relativeTo: Temporal.PlainDate.from("2021-01-01"), // ISO 8601 calendar
});
console.log(d4Balanced.weeks); // 1
console.log(d4Balanced.days); // 0
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/years", "Temporal.Duration.prototype.years")}}
- {{jsxref("Temporal/Duration/months", "Temporal.Duration.prototype.months")}}
- {{jsxref("Temporal/Duration/days", "Temporal.Duration.prototype.days")}}
- {{jsxref("Temporal/Duration/hours", "Temporal.Duration.prototype.hours")}}
- {{jsxref("Temporal/Duration/minutes", "Temporal.Duration.prototype.minutes")}}
- {{jsxref("Temporal/Duration/seconds", "Temporal.Duration.prototype.seconds")}}
- {{jsxref("Temporal/Duration/milliseconds", "Temporal.Duration.prototype.milliseconds")}}
- {{jsxref("Temporal/Duration/microseconds", "Temporal.Duration.prototype.microseconds")}}
- {{jsxref("Temporal/Duration/nanoseconds", "Temporal.Duration.prototype.nanoseconds")}}
