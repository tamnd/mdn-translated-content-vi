---
title: Temporal.Instant.prototype.toZonedDateTimeISO()
short-title: toZonedDateTimeISO()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/toZonedDateTimeISO
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.toZonedDateTimeISO
sidebar: jsref
---

Phương thức **`toZonedDateTimeISO()`** của các instance {{jsxref("Temporal.Instant")}} trả về một đối tượng {{jsxref("Temporal.ZonedDateTime")}} mới biểu diễn instant này trong múi giờ được chỉ định sử dụng hệ thống lịch ISO 8601.

## Cú pháp

```js-nolint
toZonedDateTimeISO(timeZone)
```

### Tham số

- `timeZone`
  - : Một chuỗi hoặc instance {{jsxref("Temporal.ZonedDateTime")}} biểu diễn múi giờ cần sử dụng. Nếu là instance `Temporal.ZonedDateTime`, múi giờ của nó sẽ được dùng. Nếu là chuỗi, có thể là định danh múi giờ được đặt tên, định danh múi giờ theo offset, hoặc chuỗi date-time chứa định danh múi giờ hoặc offset (xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} mới biểu diễn instant này trong múi giờ được chỉ định sử dụng hệ thống lịch ISO 8601.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu tên múi giờ không hợp lệ.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `timeZone` không phải là chuỗi hoặc instance `Temporal.ZonedDateTime`.

## Ví dụ

### Sử dụng toZonedDateTimeISO()

```js
const instant = Temporal.Instant.from("2021-08-01T12:34:56.123456789Z");
const zonedDateTime = instant.toZonedDateTimeISO("America/New_York");
console.log(zonedDateTime.toString()); // 2021-08-01T08:34:56.123456789-04:00[America/New_York]

const localDateTime = instant.toZonedDateTimeISO(Temporal.Now.timeZoneId());
console.log(localDateTime.toString()); // Instant này trong múi giờ của bạn
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/toInstant", "Temporal.ZonedDateTime.prototype.toInstant()")}}
