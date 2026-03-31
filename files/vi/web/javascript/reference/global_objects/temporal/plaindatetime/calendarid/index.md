---
title: Temporal.PlainDateTime.prototype.calendarId
short-title: calendarId
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/calendarId
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.calendarId
sidebar: jsref
---

Thuộc tính accessor **`calendarId`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được sử dụng để diễn giải ngày ISO 8601 nội bộ.

Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.

Set accessor của `calendarId` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/withCalendar", "withCalendar()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

## Ví dụ

### Sử dụng calendarId

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T08:00:00");
console.log(dt.calendarId); // "iso8601"; default

const dt2 = Temporal.PlainDateTime.from("2021-07-01T08:00:00[u-ca=chinese]");
console.log(dt2.calendarId); // "chinese"

const dt3 = dt2.withCalendar("hebrew");
console.log(dt3.calendarId); // "hebrew"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
