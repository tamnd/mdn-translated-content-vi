---
title: Temporal.ZonedDateTime.prototype.calendarId
short-title: calendarId
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/calendarId
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.calendarId
sidebar: jsref
---

Thuộc tính accessor **`calendarId`** của các instance {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi biểu diễn [calendar](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được sử dụng để diễn giải ngày ISO 8601 nội bộ.

Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại calendar thường được hỗ trợ.

Set accessor của `calendarId` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy dùng phương thức {{jsxref("Temporal/ZonedDateTime/withCalendar", "withCalendar()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng calendarId

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T08:00:00-04:00[America/New_York]",
);
console.log(dt.calendarId); // "iso8601"; default

const dt2 = Temporal.ZonedDateTime.from(
  "2021-07-01T08:00:00+08:00[Asia/Shanghai][u-ca=chinese]",
);
console.log(dt2.calendarId); // "chinese"

const dt3 = dt2.withCalendar("hebrew");
console.log(dt3.calendarId); // "hebrew"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
