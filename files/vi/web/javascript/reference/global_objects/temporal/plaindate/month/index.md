---
title: Temporal.PlainDate.prototype.month
short-title: month
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/month
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.month
sidebar: jsref
---

Thuộc tính accessor **`month`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương đại diện cho chỉ mục tháng dựa trên 1 trong năm của ngày này. Tháng đầu tiên của năm này là `1`, và tháng cuối cùng là {{jsxref("Temporal/PlainDate/monthsInYear", "monthsInYear")}}. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Lưu ý rằng không giống như {{jsxref("Date.prototype.getMonth()")}}, chỉ mục dựa trên 1. Nếu lịch có tháng nhuận, thì tháng có cùng {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} có thể có các chỉ mục `month` khác nhau cho các năm khác nhau.

> [!NOTE]
> Đừng sử dụng thuộc tính này để xác định tháng thực sự, bao gồm tên của nó. Sử dụng {{jsxref("Temporal/PlainDate/monthCode", "monthCode")}} cho mục đích đó. Sử dụng `month` chỉ để xác định các tháng trong ngữ cảnh của một năm, hoặc để tìm ra thứ tự của chúng.

Set accessor của `month` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Sử dụng phương thức {{jsxref("Temporal/PlainDate/with", "with()")}} để tạo đối tượng `Temporal.PlainDate` mới với giá trị mong muốn.

## Ví dụ

### Sử dụng month

```js
const date = Temporal.PlainDate.from("2021-07-01"); // lịch ISO 8601
console.log(date.monthCode); // "M07"
console.log(date.month); // 7

const date2 = Temporal.PlainDate.from("2021-05-01[u-ca=chinese]");
console.log(date2.monthCode); // "M03"
console.log(date2.month); // 3; đây là ngày 20 tháng 3 trong lịch Trung Quốc

const date3 = Temporal.PlainDate.from("2023-05-01[u-ca=chinese]");
console.log(date3.monthCode); // "M03"
console.log(date3.month); // 4, mặc dù đây cũng là tháng 3 (M03)!

const date4 = Temporal.PlainDate.from("2023-04-01[u-ca=chinese]");
console.log(date4.monthCode); // "M02L"
console.log(date4.month); // 3, tháng này là tháng nhuận, tức là tháng 2 trùng lặp
```

### Lặp qua tất cả các tháng trong năm

```js
const year = Temporal.PlainDate.from("2021-07-14"); // Một ngày bất kỳ trong năm
for (
  let month = year.with({ month: 1 });
  month.year === year.year;
  month = month.add({ months: 1 })
) {
  console.log(month.month);
}
```

Ngoài ra, đây cũng là cách an toàn (không giống như [ví dụ day](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/day#looping_through_all_days_in_a_month)):

```js
for (let month = 1; month <= year.monthsInYear; month++) {
  const monthDate = year.with({ month });
}
```

### Thay đổi month

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.with({ month: 2 });
console.log(newDate.toString()); // 2021-02-01
```

Bạn cũng có thể sử dụng {{jsxref("Temporal/PlainDate/add", "add()")}} hoặc {{jsxref("Temporal/PlainDate/subtract", "subtract()")}} để di chuyển một số tháng nhất định từ ngày hiện tại.

```js
const date = Temporal.PlainDate.from("2021-07-01");
const newDate = date.add({ months: 3 });
console.log(newDate.toString()); // 2021-10-01
```

Theo mặc định, `with()` kẹp ngày vào phạm vi các giá trị hợp lệ. Cả hai cách sau đây sẽ đặt tháng về tháng cuối cùng của năm:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const lastMonth = date.with({ month: date.monthsInYear }); // 2021-12-01
const lastMonth2 = date.with({ month: Number.MAX_VALUE }); // 2021-12-01
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/with", "Temporal.PlainDate.prototype.with()")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}
- {{jsxref("Temporal/PlainDate/year", "Temporal.PlainDate.prototype.year")}}
- {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}
- {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}}
- {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}
- {{jsxref("Temporal/PlainDate/monthsInYear", "Temporal.PlainDate.prototype.monthsInYear")}}
