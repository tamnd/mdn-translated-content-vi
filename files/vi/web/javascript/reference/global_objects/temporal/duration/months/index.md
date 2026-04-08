---
title: Temporal.Duration.prototype.months
short-title: months
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/months
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Duration.months
sidebar: jsref
---

Thuộc tính accessor **`months`** của các instance {{jsxref("Temporal.Duration")}} trả về một số nguyên đại diện cho số tháng trong duration.

Trừ khi duration được [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing), bạn không thể giả định phạm vi của giá trị này, nhưng bạn có thể biết dấu của nó bằng cách kiểm tra thuộc tính [`sign`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/sign) của duration. Nếu nó được cân bằng thành đơn vị trên tháng, phạm vi giá trị tuyệt đối của `months` phụ thuộc vào lịch (số tháng trong một năm).

Set accessor của `months` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/Duration/with", "with()")}} để tạo một đối tượng `Temporal.Duration` mới với giá trị mới mong muốn.

## Ví dụ

### Sử dụng months

```js
const d1 = Temporal.Duration.from({ years: 1, months: 1 });
const d2 = Temporal.Duration.from({ years: -1, months: -1 });
const d3 = Temporal.Duration.from({ years: 1 });
const d4 = Temporal.Duration.from({ months: 12 });

console.log(d1.months); // 1
console.log(d2.months); // -1
console.log(d3.months); // 0
console.log(d4.months); // 12

// Balance d4
const d4Balanced = d4.round({
  largestUnit: "years",
  relativeTo: Temporal.PlainDate.from("2021-01-01"), // ISO 8601 calendar
});
console.log(d4Balanced.months); // 0
console.log(d4Balanced.years); // 1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/years", "Temporal.Duration.prototype.years")}}
- {{jsxref("Temporal/Duration/weeks", "Temporal.Duration.prototype.weeks")}}
- {{jsxref("Temporal/Duration/days", "Temporal.Duration.prototype.days")}}
- {{jsxref("Temporal/Duration/hours", "Temporal.Duration.prototype.hours")}}
- {{jsxref("Temporal/Duration/minutes", "Temporal.Duration.prototype.minutes")}}
- {{jsxref("Temporal/Duration/seconds", "Temporal.Duration.prototype.seconds")}}
- {{jsxref("Temporal/Duration/milliseconds", "Temporal.Duration.prototype.milliseconds")}}
- {{jsxref("Temporal/Duration/microseconds", "Temporal.Duration.prototype.microseconds")}}
- {{jsxref("Temporal/Duration/nanoseconds", "Temporal.Duration.prototype.nanoseconds")}}
