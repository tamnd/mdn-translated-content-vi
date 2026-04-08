---
title: Temporal.PlainYearMonth.prototype.eraYear
short-title: eraYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/eraYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainYearMonth.eraYear
sidebar: jsref
---

Thuộc tính truy cập **`eraYear`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một số nguyên không âm đại diện cho năm của year-month này trong kỷ nguyên, hoặc `undefined` nếu lịch không sử dụng kỷ nguyên (ví dụ: ISO 8601). Chỉ số năm thường bắt đầu từ 1 (phổ biến hơn) hoặc 0, và các năm trong một kỷ nguyên có thể giảm theo thời gian (ví dụ: Gregory TCN). `era` và `eraYear` cùng nhau xác định duy nhất một năm trong một lịch, giống như cách `year` làm. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `eraYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Dùng phương thức {{jsxref("Temporal/PlainYearMonth/with", "with()")}} để tạo một đối tượng `Temporal.PlainYearMonth` mới với giá trị mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}.

## Ví dụ

### Sử dụng eraYear

```js
const ym = Temporal.PlainYearMonth.from("2021-07"); // ISO 8601 calendar
console.log(ym.eraYear); // undefined

const ym2 = Temporal.PlainYearMonth.from("2021-07-01[u-ca=gregory]");
console.log(ym2.eraYear); // 2021

const ym3 = Temporal.PlainYearMonth.from("-002021-07-01[u-ca=gregory]");
console.log(ym3.eraYear); // 2022; 0000 is used for the year 1 BC

const ym4 = Temporal.PlainYearMonth.from("2021-07-01[u-ca=japanese]");
console.log(ym4.eraYear); // 3
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/with", "Temporal.PlainYearMonth.prototype.with()")}}
- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
- {{jsxref("Temporal/PlainYearMonth/year", "Temporal.PlainYearMonth.prototype.year")}}
- {{jsxref("Temporal/PlainYearMonth/era", "Temporal.PlainYearMonth.prototype.era")}}
- {{jsxref("Temporal/PlainDate/eraYear", "Temporal.PlainDate.prototype.eraYear")}}
