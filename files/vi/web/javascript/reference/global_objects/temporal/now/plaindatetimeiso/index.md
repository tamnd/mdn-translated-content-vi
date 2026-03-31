---
title: Temporal.Now.plainDateTimeISO()
short-title: plainDateTimeISO()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Now/plainDateTimeISO
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Now.plainDateTimeISO
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Now.plainDateTimeISO()`** trả về ngày và giờ hiện tại như là đối tượng {{jsxref("Temporal.PlainDateTime")}}, theo lịch ISO 8601 và múi giờ được chỉ định.

## Cú pháp

```js-nolint
Temporal.Now.plainDateTimeISO()
Temporal.Now.plainDateTimeISO(timeZone)
```

### Tham số

- `timeZone` {{optional_inline}}
  - : Một chuỗi hoặc một thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu diễn múi giờ để diễn giải thời gian hệ thống. Nếu là thực thể `Temporal.ZonedDateTime`, múi giờ của nó được sử dụng. Nếu là chuỗi, nó có thể là định danh múi giờ có tên, định danh múi giờ theo độ lệch, hoặc chuỗi ngày-giờ chứa định danh múi giờ hoặc độ lệch (xem [múi giờ và độ lệch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).

### Giá trị trả về

Ngày và giờ hiện tại theo múi giờ được chỉ định, như là đối tượng {{jsxref("Temporal.PlainDateTime")}} sử dụng lịch ISO 8601. Có cùng độ chính xác với {{jsxref("Temporal/Now/instant", "Temporal.Now.instant()")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu múi giờ không hợp lệ.

## Ví dụ

### Sử dụng Temporal.Now.plainDateTimeISO()

```js
// The current date and time in the system's time zone
const dateTime = Temporal.Now.plainDateTimeISO();
console.log(dateTime); // e.g.: 2021-10-01T06:12:34.567890123

// The current date and time in the "America/New_York" time zone
const dateTimeInNewYork = Temporal.Now.plainDateTimeISO("America/New_York");
console.log(dateTimeInNewYork); // e.g.: 2021-09-30T23:12:34.567890123
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Now")}}
- {{jsxref("Temporal.PlainDateTime")}}
