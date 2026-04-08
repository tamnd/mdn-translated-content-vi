---
title: Temporal.ZonedDateTime.prototype.toPlainDate()
short-title: toPlainDate()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/toPlainDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.toPlainDate
sidebar: jsref
---

Phương thức **`toPlainDate()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng {{jsxref("Temporal.PlainDate")}} mới biểu thị phần ngày của ngày-giờ này.

## Cú pháp

```js-nolint
toPlainDate()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.PlainDate")}} mới biểu thị phần ngày của ngày-giờ này.

## Ví dụ

### Sử dụng toPlainDate()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.987654321-04:00[America/New_York]",
);
const plainDate = zdt.toPlainDate();
console.log(plainDate.toString()); // 2021-07-01
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainTime", "Temporal.ZonedDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainDateTime", "Temporal.ZonedDateTime.prototype.toPlainDateTime()")}}
- {{jsxref("Temporal/ZonedDateTime/toInstant", "Temporal.ZonedDateTime.prototype.toInstant()")}}
- {{jsxref("Temporal/PlainDate/toZonedDateTime", "Temporal.PlainDate.prototype.toZonedDateTime()")}}
