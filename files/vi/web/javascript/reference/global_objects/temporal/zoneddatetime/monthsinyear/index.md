---
title: Temporal.ZonedDateTime.prototype.monthsInYear
short-title: monthsInYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/monthsInYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.monthsInYear
sidebar: jsref
---

Thuộc tính accessor **`monthsInYear`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên dương biểu thị số tháng trong năm của ngày này. Thuộc tính này phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `monthsInYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

Để biết thêm thông tin chung và các ví dụ khác, hãy xem {{jsxref("Temporal/PlainDate/monthsInYear", "Temporal.PlainDate.prototype.monthsInYear")}}.

## Ví dụ

### Sử dụng monthsInYear

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]");
console.log(dt.monthsInYear); // 12
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/year", "Temporal.ZonedDateTime.prototype.year")}}
- {{jsxref("Temporal/ZonedDateTime/month", "Temporal.ZonedDateTime.prototype.month")}}
- {{jsxref("Temporal/ZonedDateTime/monthCode", "Temporal.ZonedDateTime.prototype.monthCode")}}
- {{jsxref("Temporal/ZonedDateTime/daysInMonth", "Temporal.ZonedDateTime.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainDate/monthsInYear", "Temporal.PlainDate.prototype.monthsInYear")}}
