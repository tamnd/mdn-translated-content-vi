---
title: Temporal.PlainDate.prototype.toPlainMonthDay()
short-title: toPlainMonthDay()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toPlainMonthDay
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toPlainMonthDay
sidebar: jsref
---

Phương thức **`toPlainMonthDay()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng {{jsxref("Temporal.PlainMonthDay")}} mới đại diện cho {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} và {{jsxref("Temporal/PlainDate/day", "day")}} của ngày này trong cùng hệ thống lịch.

Lưu ý rằng các đối tượng `PlainMonthDay` không có thành phần `month`, vì các tháng có cùng tên có thể có chỉ số `month` khác nhau trong các năm khác nhau do tháng nhuận.

## Cú pháp

```js-nolint
toPlainMonthDay()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Temporal.PlainMonthDay` mới đại diện cho {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} và {{jsxref("Temporal/PlainDate/day", "day")}} của ngày này trong cùng hệ thống lịch.

## Ví dụ

### Sử dụng toPlainMonthDay()

```js
const date = Temporal.PlainDate.from("2021-07-01");
const monthDay = date.toPlainMonthDay();
console.log(monthDay.toString()); // 07-01
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainDate/toPlainDateTime", "Temporal.PlainDate.prototype.toPlainDateTime()")}}
- {{jsxref("Temporal/PlainDate/toPlainYearMonth", "Temporal.PlainDate.prototype.toPlainYearMonth()")}}
- {{jsxref("Temporal/PlainDate/toZonedDateTime", "Temporal.PlainDate.prototype.toZonedDateTime()")}}
- {{jsxref("Temporal/PlainMonthDay/toPlainDate", "Temporal.PlainMonthDay.prototype.toPlainDate()")}}
