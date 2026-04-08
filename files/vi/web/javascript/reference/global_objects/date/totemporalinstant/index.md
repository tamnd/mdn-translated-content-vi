---
title: Date.prototype.toTemporalInstant()
short-title: toTemporalInstant()
slug: Web/JavaScript/Reference/Global_Objects/Date/toTemporalInstant
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.toTemporalInstant
sidebar: jsref
---

Phương thức **`toTemporalInstant()`** của các instance {{jsxref("Date")}} trả về một đối tượng {{jsxref("Temporal.Instant")}} mới với giá trị {{jsxref("Temporal/Instant/epochMilliseconds", "epochMilliseconds")}} giống với [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) của ngày này.

Sử dụng phương thức này để chuyển đổi các giá trị `Date` cũ sang API `Temporal`, sau đó tiếp tục chuyển đổi sang các lớp {{jsxref("Temporal")}} khác nếu cần.

## Cú pháp

```js-nolint
toTemporalInstant()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Instant")}} mới với giá trị {{jsxref("Temporal/Instant/epochMilliseconds", "epochMilliseconds")}} giống với timestamp của ngày này. Các thành phần microsecond và nanosecond của nó luôn là `0`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu ngày là [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) (nó có timestamp là `NaN`).

## Ví dụ

### Sử dụng toTemporalInstant()

```js
const legacyDate = new Date("2021-07-01T12:34:56.789Z");
const instant = legacyDate.toTemporalInstant();

// Further convert it to other objects
const zdt = instant.toZonedDateTimeISO("UTC");
const date = zdt.toPlainDate();
console.log(date.toString()); // 2021-07-01
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}}
