---
title: Temporal.ZonedDateTime.prototype.eraYear
short-title: eraYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/eraYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.eraYear
sidebar: jsref
---

Thuộc tính accessor **`eraYear`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên không âm biểu thị năm của ngày này trong era, hoặc `undefined` nếu lịch không sử dụng era (ví dụ: ISO 8601). Chỉ số năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một era có thể giảm dần theo thời gian (ví dụ: Gregorian BCE). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Giá trị này phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `eraYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, xem {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}.

## Ví dụ

### Sử dụng eraYear

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]"); // lịch ISO 8601
console.log(dt.eraYear); // undefined

const dt2 = Temporal.ZonedDateTime.from(
  "2021-07-01[America/New_York][u-ca=gregory]",
);
console.log(dt2.eraYear); // 2021

const dt3 = Temporal.ZonedDateTime.from(
  "-002021-07-01[America/New_York][u-ca=gregory]",
);
console.log(dt3.eraYear); // 2022; 0000 được dùng cho năm 1 TCN

const dt4 = Temporal.ZonedDateTime.from(
  "2021-07-01[America/New_York][u-ca=japanese]",
);
console.log(dt4.eraYear); // 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/year", "Temporal.ZonedDateTime.prototype.year")}}
- {{jsxref("Temporal/ZonedDateTime/era", "Temporal.ZonedDateTime.prototype.era")}}
- {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}
