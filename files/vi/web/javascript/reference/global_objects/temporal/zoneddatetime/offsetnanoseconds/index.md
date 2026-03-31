---
title: Temporal.ZonedDateTime.prototype.offsetNanoseconds
short-title: offsetNanoseconds
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/offsetNanoseconds
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.offsetNanoseconds
sidebar: jsref
---

Thuộc tính truy cập **`offsetNanoseconds`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên biểu thị [offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) được sử dụng để diễn giải thời điểm nội bộ, tính bằng số nanosecond (dương hoặc âm). Giá trị này là một số nguyên an toàn vì nó nhỏ hơn một ngày, tức là 8.64e15 nanosecond.

Set accessor của `offsetNanoseconds` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy thay đổi {{jsxref("Temporal/ZonedDateTime/offset", "offset")}} để thay đổi thuộc tính này.

## Ví dụ

### Sử dụng offsetNanoseconds

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-07:00[America/Los_Angeles]",
);
console.log(dt.offsetNanoseconds); // -25200000000000

const dt2 = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00+08:00[Asia/Shanghai]",
);
console.log(dt2.offsetNanoseconds); // 28800000000000

const dt3 = Temporal.ZonedDateTime.from(
  "1900-01-01T00:00:00+00:09:21[Europe/Paris]",
);
console.log(dt3.offsetNanoseconds); // 561000000000
```

Đây là một cách để lấy `ZonedDateTime` biểu thị cùng giờ đồng hồ trong UTC:

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-07:00[America/Los_Angeles]",
);
const dtInUTC = dt.add({ nanoseconds: dt.offsetNanoseconds });
console.log(dtInUTC.withTimeZone("UTC").toString()); // "2021-07-01T12:00:00+00:00[UTC]"
```

Đây là cách tốt hơn để có được kết quả tương tự:

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-07:00[America/Los_Angeles]",
);
const dtInUTC = dt.toPlainDateTime().toZonedDateTime("UTC");
console.log(dtInUTC.toString()); // "2021-07-01T12:00:00+00:00[UTC]"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
- {{jsxref("Temporal/ZonedDateTime/offset", "Temporal.ZonedDateTime.prototype.offset")}}
- {{jsxref("Temporal/ZonedDateTime/timeZoneId", "Temporal.ZonedDateTime.prototype.timeZoneId")}}
