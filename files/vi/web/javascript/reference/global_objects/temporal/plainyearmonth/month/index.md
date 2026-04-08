---
title: Temporal.PlainYearMonth.prototype.month
short-title: month
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/month
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainYearMonth.month
sidebar: jsref
---

Thuộc tính truy cập **`month`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một số nguyên dương đại diện cho chỉ số tháng bắt đầu từ 1 trong năm của year-month này. Tháng đầu tiên của năm này là `1`, và tháng cuối cùng là {{jsxref("Temporal/PlainYearMonth/monthsInYear", "monthsInYear")}}. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `month` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Dùng phương thức {{jsxref("Temporal/PlainYearMonth/with", "with()")}} để tạo một đối tượng `Temporal.PlainYearMonth` mới với giá trị mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}.

## Ví dụ

### Sử dụng month

```js
const ym = Temporal.PlainYearMonth.from("2021-07"); // ISO 8601 calendar
console.log(ym.monthCode); // "M07"
console.log(ym.month); // 7
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
- {{jsxref("Temporal/PlainYearMonth/monthCode", "Temporal.PlainYearMonth.prototype.monthCode")}}
- {{jsxref("Temporal/PlainYearMonth/daysInMonth", "Temporal.PlainYearMonth.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainYearMonth/monthsInYear", "Temporal.PlainYearMonth.prototype.monthsInYear")}}
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
