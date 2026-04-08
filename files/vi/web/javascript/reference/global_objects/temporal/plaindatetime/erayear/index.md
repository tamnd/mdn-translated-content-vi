---
title: Temporal.PlainDateTime.prototype.eraYear
short-title: eraYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/eraYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.eraYear
sidebar: jsref
---

Thuộc tính accessor **`eraYear`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên không âm đại diện cho năm của ngày này trong thời đại, hoặc `undefined` nếu lịch không sử dụng thời đại (ví dụ: ISO 8601). Chỉ số năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một thời đại có thể giảm theo thời gian (ví dụ: Gregorian BCE). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong lịch, theo cách tương tự như `year`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `eraYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}.

## Ví dụ

### Sử dụng eraYear

```js
const dt = Temporal.PlainDateTime.from("2021-07-01"); // ISO 8601 calendar
console.log(dt.eraYear); // undefined

const dt2 = Temporal.PlainDateTime.from("2021-07-01[u-ca=gregory]");
console.log(dt2.eraYear); // 2021

const dt3 = Temporal.PlainDateTime.from("-002021-07-01[u-ca=gregory]");
console.log(dt3.eraYear); // 2022; 0000 is used for the year 1 BC

const dt4 = Temporal.PlainDateTime.from("2021-07-01[u-ca=japanese]");
console.log(dt4.eraYear); // 3
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDateTime/year", "Temporal.PlainDateTime.prototype.year")}}
- {{jsxref("Temporal/PlainDateTime/era", "Temporal.PlainDateTime.prototype.era")}}
- {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}
