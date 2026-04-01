---
title: Temporal.Duration.prototype.hours
short-title: hours
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/hours
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.Duration.hours
sidebar: jsref
---

Thuộc tính accessor **`hours`** của các instance {{jsxref("Temporal.Duration")}} trả về một số nguyên đại diện cho số giờ trong duration.

Trừ khi duration được [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing), bạn không thể giả định phạm vi của giá trị này, nhưng bạn có thể biết dấu của nó bằng cách kiểm tra thuộc tính [`sign`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/sign) của duration. Nếu nó được cân bằng thành đơn vị trên giờ, giá trị tuyệt đối của `hours` sẽ nằm trong khoảng từ 0 đến 23, bao gồm cả hai đầu.

Set accessor của `hours` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/Duration/with", "with()")}} để tạo một đối tượng `Temporal.Duration` mới với giá trị mới mong muốn.

## Ví dụ

### Sử dụng hours

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -30 });
const d3 = Temporal.Duration.from({ days: 1 });
const d4 = Temporal.Duration.from({ hours: 24 });

console.log(d1.hours); // 1
console.log(d2.hours); // -1
console.log(d3.hours); // 0
console.log(d4.hours); // 24

// Balance d4
const d4Balanced = d4.round({ largestUnit: "days" });
console.log(d4Balanced.hours); // 0
console.log(d4Balanced.days); // 1
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
- {{jsxref("Temporal/Duration/minutes", "Temporal.Duration.prototype.minutes")}}
- {{jsxref("Temporal/Duration/seconds", "Temporal.Duration.prototype.seconds")}}
- {{jsxref("Temporal/Duration/milliseconds", "Temporal.Duration.prototype.milliseconds")}}
- {{jsxref("Temporal/Duration/microseconds", "Temporal.Duration.prototype.microseconds")}}
- {{jsxref("Temporal/Duration/nanoseconds", "Temporal.Duration.prototype.nanoseconds")}}
