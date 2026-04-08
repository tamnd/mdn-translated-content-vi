---
title: Temporal.PlainDate.prototype.toPlainDateTime()
short-title: toPlainDateTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toPlainDateTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toPlainDateTime
sidebar: jsref
---

Phương thức **`toPlainDateTime()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng {{jsxref("Temporal.PlainDateTime")}} mới đại diện cho ngày này và một thời gian được cung cấp trong cùng hệ thống lịch.

## Cú pháp

```js-nolint
toPlainDateTime()
toPlainDateTime(plainTime)
```

### Tham số

- `plainTime` {{optional_inline}}
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.PlainTime")}} đại diện cho thành phần thời gian của `PlainDateTime` kết quả. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}. Mặc định là `"00:00:00"`.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày và thời gian được xác định bởi ngày này và `plainTime`, được diễn giải trong hệ thống lịch của ngày này.

## Ví dụ

### Sử dụng toPlainDateTime()

```js
const date = Temporal.PlainDate.from("2021-07-01");
const dateTime = date.toPlainDateTime("12:34:56");
console.log(dateTime.toString()); // 2021-07-01T12:34:56

const midnight = date.toPlainDateTime();
console.log(midnight.toString()); // 2021-07-01T00:00:00

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=chinese]");
const dateTime2 = date2.toPlainDateTime("12:34:56");
console.log(dateTime2.toString()); // 2021-07-01T12:34:56[u-ca=chinese]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainDate/toPlainMonthDay", "Temporal.PlainDate.prototype.toPlainMonthDay()")}}
- {{jsxref("Temporal/PlainDate/toPlainYearMonth", "Temporal.PlainDate.prototype.toPlainYearMonth()")}}
- {{jsxref("Temporal/PlainDate/toZonedDateTime", "Temporal.PlainDate.prototype.toZonedDateTime()")}}
- {{jsxref("Temporal/PlainDateTime/toPlainDate", "Temporal.PlainDateTime.prototype.toPlainDate()")}}
