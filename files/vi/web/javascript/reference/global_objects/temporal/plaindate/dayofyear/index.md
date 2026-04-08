---
title: Temporal.PlainDate.prototype.dayOfYear
short-title: dayOfYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/dayOfYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.dayOfYear
sidebar: jsref
---

Thuộc tính accessor **`dayOfYear`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương đại diện cho chỉ mục ngày trong năm dựa trên 1 của ngày này. Ngày đầu tiên của năm này là `1`, và ngày cuối cùng là {{jsxref("Temporal/PlainDate/daysInYear", "daysInYear")}}. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `dayOfYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo đối tượng `Temporal.PlainDate` mới với giá trị `dayOfYear` mong muốn, sử dụng phương thức {{jsxref("Temporal/PlainDate/add", "add()")}} hoặc {{jsxref("Temporal/PlainDate/subtract", "subtract()")}} với số `days` phù hợp.

## Ví dụ

### Sử dụng dayOfYear

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(date.dayOfYear); // 182

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=chinese]");
console.log(date2.dayOfYear); // 140

const date3 = Temporal.PlainDate.from("2020-07-01");
console.log(date3.dayOfYear); // 183; 2020 là năm nhuận
```

### Thay đổi dayOfYear

`PlainDate` không hỗ trợ thay đổi `dayOfYear` trực tiếp. Để thay đổi ngày trong năm, bạn cần tính toán sự khác biệt về số ngày so với ngày trong năm mong muốn, sau đó sử dụng `add` hoặc `subtract` để điều chỉnh ngày tháng phù hợp. Ví dụ, để thay đổi sang ngày thứ 100 của năm này (dù trước hay sau):

```js
function getDayInSameYear(date, destDayOfYear) {
  return date.add({ days: destDayOfYear - date.dayOfYear });
}

console.log(
  getDayInSameYear(Temporal.PlainDate.from("2021-07-01"), 100).toString(),
); // 2021-04-10
console.log(
  getDayInSameYear(Temporal.PlainDate.from("2021-01-01"), 100).toString(),
); // 2021-04-10
console.log(
  getDayInSameYear(Temporal.PlainDate.from("2020-01-01"), 100).toString(),
); // 2020-04-09
```

Theo mặc định, `with()` kẹp ngày vào phạm vi các giá trị hợp lệ. Vì vậy bạn luôn có thể sử dụng `{ month: 1, day: 1 }` để đặt ngày về ngày đầu tiên của năm, ngay cả khi ngày đầu tiên không có số `1`. Tương tự, sau đây sẽ đặt ngày về ngày cuối cùng của năm, bất kể tháng cuối cùng hay năm có bao nhiêu ngày:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const lastDay = date.with({ month: Number.MAX_VALUE, day: Number.MAX_VALUE }); // 2021-12-31
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
- {{jsxref("Temporal/PlainDate/dayOfWeek", "Temporal.PlainDate.prototype.dayOfWeek")}}
- {{jsxref("Temporal/PlainDate/daysInYear", "Temporal.PlainDate.prototype.daysInYear")}}
