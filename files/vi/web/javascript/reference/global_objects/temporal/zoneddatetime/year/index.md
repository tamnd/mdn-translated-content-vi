---
title: Temporal.ZonedDateTime.prototype.year
short-title: year
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/year
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.year
sidebar: jsref
---

Thuộc tính accessor **`year`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên biểu thị số năm của ngày này so với năm epoch đặc thù theo lịch. Thuộc tính này phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `year` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, hãy xem {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}.

## Ví dụ

### Sử dụng year

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]"); // ISO 8601 calendar
console.log(dt.year); // 2021
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
- {{jsxref("Temporal/ZonedDateTime/era", "Temporal.ZonedDateTime.prototype.era")}}
- {{jsxref("Temporal/ZonedDateTime/eraYear", "Temporal.ZonedDateTime.prototype.eraYear")}}
- {{jsxref("Temporal/ZonedDateTime/yearOfWeek", "Temporal.ZonedDateTime.prototype.yearOfWeek")}}
- {{jsxref("Temporal/ZonedDateTime/month", "Temporal.ZonedDateTime.prototype.month")}}
- {{jsxref("Temporal/ZonedDateTime/day", "Temporal.ZonedDateTime.prototype.day")}}
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
