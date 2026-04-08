---
title: Temporal.PlainMonthDay.prototype.calendarId
short-title: calendarId
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/calendarId
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainMonthDay.calendarId
sidebar: jsref
---

Thuộc tính accessor **`calendarId`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được dùng để diễn giải ngày ISO 8601 nội bộ.

Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.

Set accessor của `calendarId` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Không có cách rõ ràng để tạo một đối tượng `Temporal.PlainMonthDay` mới với lịch khác mà vẫn đại diện cho cùng tháng-ngày, vì vậy bạn cần chuyển đổi nó sang đối tượng {{jsxref("Temporal.PlainDate")}} trước bằng {{jsxref("Temporal/PlainMonthDay/toPlainDate", "toPlainDate()")}}, thay đổi lịch, rồi chuyển đổi ngược lại.

## Ví dụ

### Sử dụng calendarId

```js
const md = Temporal.PlainMonthDay.from("07-01");
console.log(md.calendarId); // "iso8601"; default

const md2 = Temporal.PlainMonthDay.from("2021-07-01[u-ca=chinese]");
console.log(md2.calendarId); // "chinese"
```

### Thay đổi calendarId

```js
const md = Temporal.PlainMonthDay.from("07-01");
const newMD = md
  .toPlainDate({ year: 2021 })
  .withCalendar("chinese")
  .toPlainMonthDay();
console.log(newMD.monthCode, newMD.day); // "M05" 22

const newMD2 = md
  .toPlainDate({ year: 2022 })
  .withCalendar("chinese")
  .toPlainMonthDay();
console.log(newMD2.monthCode, newMD2.day); // "M06" 3
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
