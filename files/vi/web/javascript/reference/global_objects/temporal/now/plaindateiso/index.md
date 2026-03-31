---
title: Temporal.Now.plainDateISO()
short-title: plainDateISO()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Now/plainDateISO
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Now.plainDateISO
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Now.plainDateISO()`** trả về ngày hiện tại như là đối tượng {{jsxref("Temporal.PlainDate")}}, theo lịch ISO 8601 và múi giờ được chỉ định.

## Cú pháp

```js-nolint
Temporal.Now.plainDateISO()
Temporal.Now.plainDateISO(timeZone)
```

### Tham số

- `timeZone` {{optional_inline}}
  - : Một chuỗi hoặc một thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu diễn múi giờ để diễn giải thời gian hệ thống. Nếu là thực thể `Temporal.ZonedDateTime`, múi giờ của nó được sử dụng. Nếu là chuỗi, nó có thể là định danh múi giờ có tên, định danh múi giờ theo độ lệch, hoặc chuỗi ngày-giờ chứa định danh múi giờ hoặc độ lệch (xem [múi giờ và độ lệch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).

### Giá trị trả về

Ngày hiện tại theo múi giờ được chỉ định, như là đối tượng {{jsxref("Temporal.PlainDate")}} sử dụng lịch ISO 8601.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu múi giờ không hợp lệ.

## Ví dụ

### Sử dụng Temporal.Now.plainDateISO()

```js
// The current date in the system's time zone
const date = Temporal.Now.plainDateISO();
console.log(date); // e.g.: 2021-10-01

// The current date in the "America/New_York" time zone
const dateInNewYork = Temporal.Now.plainDateISO("America/New_York");
console.log(dateInNewYork); // e.g.: 2021-09-30
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Now")}}
- {{jsxref("Temporal.PlainDate")}}
