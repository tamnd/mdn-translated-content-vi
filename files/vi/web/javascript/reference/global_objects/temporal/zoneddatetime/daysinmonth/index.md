---
title: Temporal.ZonedDateTime.prototype.daysInMonth
short-title: daysInMonth
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/daysInMonth
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.daysInMonth
sidebar: jsref
---

Thuộc tính accessor **`daysInMonth`** của các instance {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên dương biểu diễn số ngày trong tháng của ngày này. Giá trị này phụ thuộc vào [calendar](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `daysInMonth` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

Để biết thêm thông tin chung và ví dụ, hãy xem {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}.

## Ví dụ

### Sử dụng daysInMonth

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]");
console.log(dt.daysInMonth); // 31
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/year", "Temporal.ZonedDateTime.prototype.year")}}
- {{jsxref("Temporal/ZonedDateTime/month", "Temporal.ZonedDateTime.prototype.month")}}
- {{jsxref("Temporal/ZonedDateTime/day", "Temporal.ZonedDateTime.prototype.day")}}
- {{jsxref("Temporal/ZonedDateTime/daysInWeek", "Temporal.ZonedDateTime.prototype.daysInWeek")}}
- {{jsxref("Temporal/ZonedDateTime/daysInYear", "Temporal.ZonedDateTime.prototype.daysInYear")}}
- {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}
