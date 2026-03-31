---
title: Temporal.PlainYearMonth.prototype.monthCode
short-title: monthCode
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/monthCode
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainYearMonth.monthCode
sidebar: jsref
---

Thuộc tính truy cập **`monthCode`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một chuỗi đặc thù của lịch đại diện cho tháng của year-month này. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Thường là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, đây là mã của tháng trước theo sau là `L` (ngay cả khi về mặt khái niệm nó là dẫn xuất của tháng tiếp theo; ví dụ, trong lịch Hebrew, Adar I có mã `M05L` nhưng Adar II có mã `M06`). Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.

Set accessor của `monthCode` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Dùng phương thức {{jsxref("Temporal/PlainYearMonth/with", "with()")}} để tạo một đối tượng `Temporal.PlainYearMonth` mới với giá trị mong muốn.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}}.

## Ví dụ

### Sử dụng monthCode

```js
const date = Temporal.PlainYearMonth.from("2021-07-01"); // ISO 8601 calendar
console.log(date.monthCode); // "M07"
console.log(date.month); // 7
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
- {{jsxref("Temporal/PlainYearMonth/month", "Temporal.PlainYearMonth.prototype.month")}}
- {{jsxref("Temporal/PlainYearMonth/daysInMonth", "Temporal.PlainYearMonth.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainYearMonth/monthsInYear", "Temporal.PlainYearMonth.prototype.monthsInYear")}}
- {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}}
