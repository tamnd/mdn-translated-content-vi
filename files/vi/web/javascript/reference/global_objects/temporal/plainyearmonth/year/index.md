---
title: Temporal.PlainYearMonth.prototype.year
short-title: year
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/year
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainYearMonth.year
sidebar: jsref
---

Thuộc tính accessor **`year`** của các instance {{jsxref("Temporal.PlainYearMonth")}} trả về một số nguyên biểu diễn số năm của năm-tháng này tính từ đầu một năm epoch cụ thể theo calendar. Giá trị này phụ thuộc vào [calendar](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `year` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy dùng phương thức {{jsxref("Temporal/PlainYearMonth/with", "with()")}} để tạo một đối tượng `Temporal.PlainYearMonth` mới với giá trị mong muốn.

Để biết thêm thông tin chung và ví dụ, hãy xem {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}.

## Ví dụ

### Sử dụng year

```js
const ym = Temporal.PlainYearMonth.from("2021-07"); // ISO 8601 calendar
console.log(ym.year); // 2021
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/with", "Temporal.PlainYearMonth.prototype.with()")}}
- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
- {{jsxref("Temporal/PlainYearMonth/subtract", "Temporal.PlainYearMonth.prototype.subtract()")}}
- {{jsxref("Temporal/PlainYearMonth/era", "Temporal.PlainYearMonth.prototype.era")}}
- {{jsxref("Temporal/PlainYearMonth/eraYear", "Temporal.PlainYearMonth.prototype.eraYear")}}
- {{jsxref("Temporal/PlainYearMonth/month", "Temporal.PlainYearMonth.prototype.month")}}
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
