---
title: Temporal.PlainDateTime.prototype.dayOfYear
short-title: dayOfYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/dayOfYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.dayOfYear
sidebar: jsref
---

Thuộc tính accessor **`dayOfYear`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên dương đại diện cho chỉ số ngày theo cơ số 1 trong năm của ngày này. Ngày đầu tiên của năm là `1`, và ngày cuối cùng là {{jsxref("Temporal/PlainDateTime/daysInYear", "daysInYear")}}. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `dayOfYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị `dayOfYear` mong muốn, sử dụng phương thức {{jsxref("Temporal/PlainDateTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainDateTime/subtract", "subtract()")}} với số `days` thích hợp.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}.

## Ví dụ

### Sử dụng dayOfYear

```js
const dt = Temporal.PlainDateTime.from("2021-07-01");
console.log(dt.dayOfYear); // 182
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
- {{jsxref("Temporal/PlainDateTime/dayOfWeek", "Temporal.PlainDateTime.prototype.dayOfWeek")}}
- {{jsxref("Temporal/PlainDateTime/daysInYear", "Temporal.PlainDateTime.prototype.daysInYear")}}
- {{jsxref("Temporal/PlainDate/dayOfYear", "Temporal.PlainDate.prototype.dayOfYear")}}
