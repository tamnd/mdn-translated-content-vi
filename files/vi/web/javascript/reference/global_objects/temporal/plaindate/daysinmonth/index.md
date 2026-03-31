---
title: Temporal.PlainDate.prototype.daysInMonth
short-title: daysInMonth
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/daysInMonth
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.daysInMonth
sidebar: jsref
---

Thuộc tính accessor **`daysInMonth`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương đại diện cho số ngày trong tháng của ngày này. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Lưu ý rằng số ngày trong tháng không phải lúc nào cũng bằng với {{jsxref("Temporal/PlainDate/day", "day")}} của ngày cuối cùng trong tháng, trong trường hợp hiếm gặp khi một tháng có thể bỏ qua một vài ngày.

Set accessor của `daysInMonth` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng daysInMonth

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(date.daysInMonth); // 31

const date2 = Temporal.PlainDate.from("2021-02-01");
console.log(date2.daysInMonth); // 28; 2021 không phải năm nhuận

const date3 = Temporal.PlainDate.from("2020-02-01");
console.log(date3.daysInMonth); // 29; 2020 là năm nhuận

const date4 = Temporal.PlainDate.from("2021-04-01[u-ca=chinese]");
console.log(date4.month); // 2
console.log(date4.daysInMonth); // 30; tháng 2 của lịch Trung Quốc có 30 ngày
```

### Thay đổi sang ngày áp chót của tháng

Bạn có thể sử dụng `daysInMonth` để thay đổi sang ngày áp chót của tháng:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const secondLastDay = date.with({ day: date.daysInMonth - 1 });
console.log(secondLastDay.toString()); // 2021-07-30
```

Tuy nhiên, đây không hoàn toàn an toàn, vì `daysInMonth` không được đảm bảo có liên quan đến chỉ mục ngày. Đây là cách an toàn hơn để lấy ngày áp chót:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const secondLastDay = date
  .with({ day: Number.MAX_SAFE_INTEGER })
  .subtract({ days: 1 });
console.log(secondLastDay.toString()); // 2021-07-30
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
- {{jsxref("Temporal/PlainDate/month", "Temporal.PlainDate.prototype.month")}}
- {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}
- {{jsxref("Temporal/PlainDate/daysInWeek", "Temporal.PlainDate.prototype.daysInWeek")}}
- {{jsxref("Temporal/PlainDate/daysInYear", "Temporal.PlainDate.prototype.daysInYear")}}
