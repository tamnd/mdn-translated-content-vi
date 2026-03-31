---
title: Temporal.ZonedDateTime.prototype.toInstant()
short-title: toInstant()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/toInstant
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.toInstant
sidebar: jsref
---

Phương thức **`toInstant()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng {{jsxref("Temporal.Instant")}} mới biểu thị thời điểm của ngày-giờ này.

## Cú pháp

```js-nolint
toInstant()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Instant")}} mới biểu thị thời điểm của ngày-giờ này.

## Ví dụ

### Sử dụng toInstant()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.987654321-04:00[America/New_York]",
);
const instant = zdt.toInstant();
console.log(instant.toString()); // 2021-07-01T16:34:56.987654321Z
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainDate", "Temporal.ZonedDateTime.prototype.toPlainDate()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainTime", "Temporal.ZonedDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainDateTime", "Temporal.ZonedDateTime.prototype.toPlainDateTime()")}}
- {{jsxref("Temporal/Instant/toZonedDateTimeISO", "Temporal.Instant.prototype.toZonedDateTimeISO()")}}
