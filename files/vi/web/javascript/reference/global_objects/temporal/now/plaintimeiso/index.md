---
title: Temporal.Now.plainTimeISO()
short-title: plainTimeISO()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Now/plainTimeISO
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Now.plainTimeISO
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Now.plainTimeISO()`** trả về giờ hiện tại như là đối tượng {{jsxref("Temporal.PlainTime")}}, theo múi giờ được chỉ định.

Lưu ý rằng mặc dù phương thức có "ISO" trong tên, các đối tượng {{jsxref("Temporal.PlainTime")}} không có lịch liên kết, vì định dạng giờ không phụ thuộc vào lịch.

## Cú pháp

```js-nolint
Temporal.Now.plainTimeISO()
Temporal.Now.plainTimeISO(timeZone)
```

### Tham số

- `timeZone` {{optional_inline}}
  - : Một chuỗi hoặc một thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu diễn múi giờ để diễn giải thời gian hệ thống. Nếu là thực thể `Temporal.ZonedDateTime`, múi giờ của nó được sử dụng. Nếu là chuỗi, nó có thể là định danh múi giờ có tên, định danh múi giờ theo độ lệch, hoặc chuỗi ngày-giờ chứa định danh múi giờ hoặc độ lệch (xem [múi giờ và độ lệch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).

### Giá trị trả về

Giờ hiện tại theo múi giờ được chỉ định, như là đối tượng {{jsxref("Temporal.PlainTime")}}. Có cùng độ chính xác với {{jsxref("Temporal/Now/instant", "Temporal.Now.instant()")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu múi giờ không hợp lệ.

## Ví dụ

### Sử dụng Temporal.Now.plainTimeISO()

```js
// The current time in the system's time zone
const time = Temporal.Now.plainTimeISO();
console.log(time); // e.g.: 06:12:34.567890123

// The current time in the "America/New_York" time zone
const timeInNewYork = Temporal.Now.plainTimeISO("America/New_York");
console.log(timeInNewYork); // e.g.: 23:12:34.567890123
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Now")}}
- {{jsxref("Temporal.PlainTime")}}
