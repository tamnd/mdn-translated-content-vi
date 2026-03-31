---
title: Temporal.ZonedDateTime.prototype.startOfDay()
short-title: startOfDay()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/startOfDay
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.startOfDay
sidebar: jsref
---

Phương thức **`startOfDay()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng {{jsxref("Temporal.ZonedDateTime")}} biểu thị thời điểm đầu tiên của ngày này trong múi giờ. Thông thường nó có giờ là `00:00:00`, nhưng có thể khác nếu nửa đêm không tồn tại do thay đổi offset, trong trường hợp đó, thời điểm đầu tiên tồn tại được trả về.

Nó tương đương với việc gọi {{jsxref("Temporal/ZonedDateTime/withPlainTime", "withPlainTime()")}} không có đối số.

## Cú pháp

```js-nolint
startOfDay()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} với thời điểm `t`, sao cho:

- Ngày tại `t` khác với ngày một nanosecond trước `t`.
- Ngày tại `t` giống với ngày của `this`.

## Ví dụ

### Sử dụng startOfDay()

```js
// In the US, DST transitions happen at 2am, so the midnight exists
const dt = Temporal.ZonedDateTime.from(
  "2024-03-10T12:00:00-04:00[America/New_York]",
);
console.log(dt.startOfDay().toString()); // "2024-03-10T00:00:00-05:00[America/New_York]"

// In Brazil, DST transitions happened at midnight, so the midnight didn't exist
const dt2 = Temporal.ZonedDateTime.from(
  "2015-10-18T12:00-02:00[America/Sao_Paulo]",
);
console.log(dt2.startOfDay().toString()); // "2015-10-18T01:00:00-02:00[America/Sao_Paulo]"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/hour", "Temporal.ZonedDateTime.prototype.hour")}}
- {{jsxref("Temporal/ZonedDateTime/hoursInDay", "Temporal.ZonedDateTime.prototype.hoursInDay")}}
- {{jsxref("Temporal/ZonedDateTime/timeZoneId", "Temporal.ZonedDateTime.prototype.timeZoneId")}}
- {{jsxref("Temporal/ZonedDateTime/getTimeZoneTransition", "Temporal.ZonedDateTime.prototype.getTimeZoneTransition()")}}
