---
title: Temporal.PlainDate.prototype.monthsInYear
short-title: monthsInYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/monthsInYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDate.monthsInYear
sidebar: jsref
---

Thuộc tính accessor **`monthsInYear`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một số nguyên dương biểu diễn số tháng trong năm của ngày này. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Đối với lịch ISO 8601, giá trị này luôn là 12, nhưng trong các hệ thống lịch khác có thể khác nhau. Ví dụ, trong các lịch có tháng nhuận, năm nhuận sẽ có nhiều hơn một tháng so với năm thường.

Set accessor của `monthsInYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng monthsInYear

```js
const date = Temporal.PlainDate.from("2021-07-01");
console.log(date.monthsInYear); // 12

const date2 = Temporal.PlainDate.from("2021-07-01[u-ca=chinese]");
console.log(date2.monthsInYear); // 12

const date3 = Temporal.PlainDate.from("2023-07-01[u-ca=chinese]");
console.log(date3.monthsInYear); // 13; 2023 là năm nhuận theo lịch Trung Quốc
```

### Chuyển sang tháng áp chót của năm

Bạn có thể dùng `monthsInYear` để chuyển sang tháng áp chót của năm:

```js
const date = Temporal.PlainDate.from("2021-07-01");
const secondLastMonth = date.with({ month: date.monthsInYear - 1 });
console.log(secondLastMonth.toString()); // 2021-11-01
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
- {{jsxref("Temporal/PlainDate/monthCode", "Temporal.PlainDate.prototype.monthCode")}}
- {{jsxref("Temporal/PlainDate/daysInMonth", "Temporal.PlainDate.prototype.daysInMonth")}}
