---
title: Temporal.ZonedDateTime.prototype.weekOfYear
short-title: weekOfYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/weekOfYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.weekOfYear
sidebar: jsref
---

Thuộc tính truy cập **`weekOfYear`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên dương biểu thị chỉ số tuần bắt đầu từ 1 trong {{jsxref("Temporal/ZonedDateTime/yearOfWeek", "yearOfWeek")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Tuần đầu tiên của năm là `1`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `weekOfYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị `weekOfYear` mong muốn, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/add", "add()")}} hoặc {{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}} với số `weeks` phù hợp.

Để biết thêm thông tin chung và các ví dụ khác, xem {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}.

## Ví dụ

### Sử dụng weekOfYear

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]");
console.log(dt.weekOfYear); // 26
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
- {{jsxref("Temporal/ZonedDateTime/yearOfWeek", "Temporal.ZonedDateTime.prototype.yearOfWeek")}}
- {{jsxref("Temporal/ZonedDateTime/dayOfWeek", "Temporal.ZonedDateTime.prototype.dayOfWeek")}}
- {{jsxref("Temporal/ZonedDateTime/daysInWeek", "Temporal.ZonedDateTime.prototype.daysInWeek")}}
- {{jsxref("Temporal/ZonedDateTime/daysInYear", "Temporal.ZonedDateTime.prototype.daysInYear")}}
- {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}
