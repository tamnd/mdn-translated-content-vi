---
title: Temporal.PlainYearMonth.prototype.calendarId
short-title: calendarId
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/calendarId
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainYearMonth.calendarId
sidebar: jsref
---

Thuộc tính truy cập **`calendarId`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một chuỗi đại diện cho [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars) được dùng để giải thích ngày ISO 8601 nội bộ.

Xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_calendar_types) để biết danh sách các loại lịch thường được hỗ trợ.

Set accessor của `calendarId` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Không có cách rõ ràng để tạo một đối tượng `Temporal.PlainYearMonth` mới với một lịch khác đại diện cho cùng một year-month, vì vậy bạn cần chuyển đổi nó sang đối tượng {{jsxref("Temporal.PlainDate")}} trước tiên bằng {{jsxref("Temporal/PlainYearMonth/toPlainDate", "toPlainDate()")}}, thay đổi lịch, sau đó chuyển đổi lại.

## Ví dụ

### Sử dụng calendarId

```js
const ym = Temporal.PlainYearMonth.from("2021-07");
console.log(ym.calendarId); // "iso8601"; default

const ym2 = Temporal.PlainYearMonth.from("2021-07-01[u-ca=chinese]");
console.log(ym2.calendarId); // "chinese"
```

### Thay đổi calendarId

```js
const ym = Temporal.PlainYearMonth.from("2021-07");
const newYM = ym
  .toPlainDate({ day: 1 })
  .withCalendar("chinese")
  .toPlainYearMonth();
console.log(newYM.year, newYM.monthCode); // 2021 "M05"

const newYM2 = ym
  .toPlainDate({ day: 31 })
  .withCalendar("chinese")
  .toPlainYearMonth();
console.log(newYM2.year, newYM2.monthCode); // 2021 "M06"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
