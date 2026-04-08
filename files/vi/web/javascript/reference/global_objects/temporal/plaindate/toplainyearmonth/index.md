---
title: Temporal.PlainDate.prototype.toPlainYearMonth()
short-title: toPlainYearMonth()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toPlainYearMonth
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toPlainYearMonth
sidebar: jsref
---

Phương thức **`toPlainYearMonth()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng {{jsxref("Temporal.PlainYearMonth")}} mới đại diện cho {{jsxref("Temporal/PlainDate/year", "year")}} và {{jsxref("Temporal/PlainDate/month", "month")}} của ngày này trong cùng hệ thống lịch.

## Cú pháp

```js-nolint
toPlainYearMonth()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Temporal.PlainYearMonth` mới đại diện cho {{jsxref("Temporal/PlainDate/year", "year")}} và {{jsxref("Temporal/PlainDate/month", "month")}} của ngày này trong cùng hệ thống lịch.

## Ví dụ

### Sử dụng toPlainYearMonth()

```js
const date = Temporal.PlainDate.from("2021-07-01");
const yearMonth = date.toPlainYearMonth();
console.log(yearMonth.toString()); // 2021-07
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainDate/toPlainDateTime", "Temporal.PlainDate.prototype.toPlainDateTime()")}}
- {{jsxref("Temporal/PlainDate/toPlainMonthDay", "Temporal.PlainDate.prototype.toPlainMonthDay()")}}
- {{jsxref("Temporal/PlainDate/toZonedDateTime", "Temporal.PlainDate.prototype.toZonedDateTime()")}}
- {{jsxref("Temporal/PlainYearMonth/toPlainDate", "Temporal.PlainYearMonth.prototype.toPlainDate()")}}
