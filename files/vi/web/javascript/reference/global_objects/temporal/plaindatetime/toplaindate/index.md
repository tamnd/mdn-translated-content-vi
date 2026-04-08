---
title: Temporal.PlainDateTime.prototype.toPlainDate()
short-title: toPlainDate()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/toPlainDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.toPlainDate
sidebar: jsref
---

Phương thức **`toPlainDate()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới đại diện cho phần ngày (năm, tháng, ngày) của ngày-giờ này trong cùng hệ thống lịch.

## Cú pháp

```js-nolint
toPlainDate()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới đại diện cho phần ngày (năm, tháng, ngày) của ngày-giờ này trong cùng hệ thống lịch.

## Ví dụ

### Sử dụng toPlainDate()

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56");
const date = dt.toPlainDate();
console.log(date.toString()); // '2021-07-01'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDateTime/toPlainTime", "Temporal.PlainDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/PlainDateTime/toZonedDateTime", "Temporal.PlainDate.prototype.toZonedDateTime()")}}
- {{jsxref("Temporal/PlainDate/toPlainDateTime", "Temporal.PlainDate.prototype.toPlainDateTime()")}}
