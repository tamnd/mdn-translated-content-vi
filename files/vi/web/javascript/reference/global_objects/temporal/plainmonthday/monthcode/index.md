---
title: Temporal.PlainMonthDay.prototype.monthCode
short-title: monthCode
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/monthCode
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainMonthDay.monthCode
sidebar: jsref
---

Thuộc tính accessor **`monthCode`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một chuỗi đặc trưng cho lịch đại diện cho tháng của ngày này. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Thường là `M` cộng với số tháng hai chữ số. Đối với tháng nhuận, đó là mã của tháng trước theo sau là `L` (ngay cả khi về mặt khái niệm nó là một dẫn xuất của tháng tiếp theo; ví dụ, trong lịch Hebrew, Adar I có mã `M05L` nhưng Adar II có mã `M06`). Nếu tháng nhuận là tháng đầu tiên của năm, mã là `M00L`.

Vì {{jsxref("Temporal/PlainDate/month", "month")}} là một chỉ số trong một năm, nhưng `PlainMonthDay` không có năm, nên không có thuộc tính `month` cho `PlainMonthDay`. Do đó, `monthCode` được dùng để đại diện cho tháng theo cách độc lập với năm.

Set accessor của `monthCode` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainMonthDay/with", "with()")}} để tạo một đối tượng `Temporal.PlainMonthDay` mới với giá trị mong muốn.

Để biết thêm thông tin chung và ví dụ, xem {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}}.

## Ví dụ

### Sử dụng monthCode

```js
const md = Temporal.PlainMonthDay.from("07-01"); // ISO 8601 calendar
console.log(md.monthCode); // "M07"

const md2 = Temporal.PlainMonthDay.from("2021-05-01[u-ca=chinese]");
console.log(md2.monthCode); // "M03"

const md3 = Temporal.PlainMonthDay.from("2023-04-01[u-ca=chinese]");
console.log(md3.monthCode); // "M02L"
```

### Thay đổi monthCode

```js
const md = Temporal.PlainMonthDay.from("07-01");
const newMD = md.with({ monthCode: "M03" });
console.log(newMD.toString()); // 03-01
```

Đối với các lịch khác, miễn là tồn tại một năm mà tháng-ngày đó hợp lệ, thì tháng-ngày đó được coi là hợp lệ, và năm tham chiếu bên dưới có thể thay đổi tương ứng. Ví dụ:

```js
const md = Temporal.PlainMonthDay.from({
  monthCode: "M02",
  day: 30,
  calendar: "hebrew",
});
console.log(md.toString()); // 1971-11-18[u-ca=hebrew]
console.log(md.toLocaleString("en-US", { calendar: "hebrew" })); // 30 Heshvan
// 30 Heshvan only exists in 1971, but this year is not a leap year
const newMD = md.with({ monthCode: "M05L" });
console.log(newMD.toString()); // 1970-03-08[u-ca=hebrew]
console.log(newMD.toLocaleString("en-US", { calendar: "hebrew" })); // 30 Adar I
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/with", "Temporal.PlainMonthDay.prototype.with()")}}
- {{jsxref("Temporal/PlainMonthDay/day", "Temporal.PlainMonthDay.prototype.day")}}
