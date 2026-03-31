---
title: Temporal.ZonedDateTime.prototype.offset
short-title: offset
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/offset
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.offset
sidebar: jsref
---

Thuộc tính truy cập **`offset`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi biểu thị [offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) được sử dụng để diễn giải thời điểm nội bộ, dưới dạng `±HH:mm` (hoặc `±HH:mm:ss.sssssssss` với độ chính xác dưới phút cần thiết). Offset này được đảm bảo là hợp lệ cho thời điểm và múi giờ đã cho tại thời điểm khởi tạo.

Set accessor của `offset` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn (thường cũng thay đổi ngày/giờ), hoặc sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/withTimeZone", "withTimeZone()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới trong múi giờ khác.

## Ví dụ

### Sử dụng offset

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:00:00-07:00[America/Los_Angeles]",
);
console.log(dt.offset); // "-07:00"

const dt2 = Temporal.ZonedDateTime.from("2021-07-01T12:00:00-07[-07]");
console.log(dt2.offset); // "-07:00"

const dt3 = Temporal.ZonedDateTime.from(
  "1900-01-01T00:00:00+00:09:21[Europe/Paris]",
);
console.log(dt3.offset); // "+00:09:21"

const dt4 = Temporal.ZonedDateTime.from("2021-07-01T12:00:00Z[Asia/Shanghai]");
console.log(dt4.offset); // "+08:00"
```

### Thay đổi offset

Nếu giờ địa phương có hai offset hợp lệ, chẳng hạn trong quá trình chuyển đổi DST, bạn có thể thay đổi offset mà không thay đổi bất cứ điều gì khác:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2024-11-03T01:05:00-04:00[America/New_York]",
);
const newZDT = zdt.with({ offset: "-05:00" });
console.log(newZDT.toString()); // "2024-11-03T01:05:00-05:00[America/New_York]"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/withTimeZone", "Temporal.ZonedDateTime.prototype.withTimeZone()")}}
- {{jsxref("Temporal/ZonedDateTime/timeZoneId", "Temporal.ZonedDateTime.prototype.timeZoneId")}}
- {{jsxref("Temporal/ZonedDateTime/offsetNanoseconds", "Temporal.ZonedDateTime.prototype.offsetNanoseconds")}}
