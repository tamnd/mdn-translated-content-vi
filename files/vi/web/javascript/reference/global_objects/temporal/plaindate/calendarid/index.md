---
title: Temporal.PlainDate.prototype.calendarId
short-title: calendarId
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/calendarId
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.calendarId
sidebar: jsref
---

Thuộc tính accessor **`calendarId`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được sử dụng để diễn giải ngày ISO 8601 bên trong.

Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.

Set accessor của `calendarId` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/withCalendar", "withCalendar()")}} để tạo đối tượng `Temporal.PlainDate` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng calendarId

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(date.calendarId); // "iso8601"; mặc định

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=chinese]");
console.log(date2.calendarId); // "chinese"

const date3 = date2.withCalendar("hebrew");
console.log(date3.calendarId); // "hebrew"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
