---
title: Temporal.ZonedDateTime.prototype.dayOfYear
short-title: dayOfYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/dayOfYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.dayOfYear
sidebar: jsref
---

Thuộc tính accessor **`dayOfYear`** của các instance {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên dương biểu diễn chỉ số ngày dựa trên 1 trong năm của ngày này. Ngày đầu tiên của năm là `1`, và ngày cuối cùng là {{jsxref("Temporal/ZonedDateTime/daysInYear", "daysInYear")}}. Giá trị này phụ thuộc vào [calendar](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `dayOfYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị `dayOfYear` mong muốn, hãy dùng phương thức {{jsxref("Temporal/ZonedDateTime/add", "add()")}} hoặc {{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}} với số lượng `days` phù hợp.

Để biết thêm thông tin chung và ví dụ, hãy xem {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}.

## Ví dụ

### Sử dụng dayOfYear

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]");
console.log(dt.dayOfYear); // 182
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
- {{jsxref("Temporal/ZonedDateTime/day", "Temporal.ZonedDateTime.prototype.day")}}
- {{jsxref("Temporal/ZonedDateTime/dayOfWeek", "Temporal.ZonedDateTime.prototype.dayOfWeek")}}
- {{jsxref("Temporal/ZonedDateTime/daysInYear", "Temporal.ZonedDateTime.prototype.daysInYear")}}
- {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}
