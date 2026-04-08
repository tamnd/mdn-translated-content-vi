---
title: Temporal.PlainDateTime.prototype.month
short-title: month
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/month
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.month
sidebar: jsref
---

Thuộc tính accessor **`month`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên dương đại diện cho chỉ số tháng theo cơ số 1 trong năm của ngày này. Tháng đầu tiên của năm là `1`, và tháng cuối cùng là {{jsxref("Temporal/PlainDateTime/monthsInYear", "monthsInYear")}}. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `month` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDateTime/with", "with()")}} để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị mới mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}.

## Ví dụ

### Sử dụng month

```js
const dt = Temporal.PlainDateTime.from("2021-07-01"); // ISO 8601 calendar
console.log(dt.monthCode); // "M07"
console.log(dt.month); // 7
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
- {{jsxref("Temporal/PlainDateTime/day", "Temporal.PlainDateTime.prototype.day")}}
- {{jsxref("Temporal/PlainDateTime/monthCode", "Temporal.PlainDateTime.prototype.monthCode")}}
- {{jsxref("Temporal/PlainDateTime/daysInMonth", "Temporal.PlainDateTime.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainDateTime/monthsInYear", "Temporal.PlainDateTime.prototype.monthsInYear")}}
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
