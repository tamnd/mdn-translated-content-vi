---
title: Temporal.ZonedDateTime.prototype.nanosecond
short-title: nanosecond
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/nanosecond
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.nanosecond
sidebar: jsref
---

Thuộc tính truy cập **`nanosecond`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên từ 0 đến 999 biểu thị thành phần nanosecond (10<sup>-9</sup> giây) của thời điểm này.

Set accessor của `nanosecond` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, xem {{jsxref("Temporal/PlainTime/nanosecond", "Temporal.PlainTime.prototype.nanosecond")}}.

## Ví dụ

### Sử dụng nanosecond

```js
const dt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.123456789-04:00[America/New_York]",
);
console.log(dt.nanosecond); // 789
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
- {{jsxref("Temporal/ZonedDateTime/second", "Temporal.ZonedDateTime.prototype.second")}}
- {{jsxref("Temporal/ZonedDateTime/millisecond", "Temporal.ZonedDateTime.prototype.millisecond")}}
- {{jsxref("Temporal/ZonedDateTime/microsecond", "Temporal.ZonedDateTime.prototype.microsecond")}}
- {{jsxref("Temporal/PlainTime/nanosecond", "Temporal.PlainTime.prototype.nanosecond")}}
