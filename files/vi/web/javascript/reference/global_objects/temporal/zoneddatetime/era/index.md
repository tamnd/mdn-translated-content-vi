---
title: Temporal.ZonedDateTime.prototype.era
short-title: era
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/era
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.era
sidebar: jsref
---

Thuộc tính accessor **`era`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi chữ thường theo lịch cụ thể biểu thị era của ngày này, hoặc `undefined` nếu lịch không sử dụng era (ví dụ: ISO 8601). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Giá trị này phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `era` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và các ví dụ khác, xem {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}.

## Ví dụ

### Sử dụng era

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]"); // lịch ISO 8601
console.log(dt.era); // undefined

const dt2 = Temporal.ZonedDateTime.from(
  "2021-07-01[America/New_York][u-ca=gregory]",
);
console.log(dt2.era); // ce
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
- {{jsxref("Temporal/ZonedDateTime/eraYear", "Temporal.ZonedDateTime.prototype.eraYear")}}
- {{jsxref("Temporal/PlainDate/era", "Temporal.PlainDate.prototype.era")}}
