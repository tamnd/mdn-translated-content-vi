---
title: Temporal.PlainDateTime.prototype.weekOfYear
short-title: weekOfYear
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/weekOfYear
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.PlainDateTime.weekOfYear
sidebar: jsref
---

Thuộc tính accessor **`weekOfYear`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một số nguyên dương đại diện cho chỉ số tuần theo cơ số 1 trong {{jsxref("Temporal/PlainDateTime/yearOfWeek", "yearOfWeek")}} của ngày này, hoặc `undefined` nếu lịch không có hệ thống tuần được xác định rõ ràng. Tuần đầu tiên của năm là `1`. Nó phụ thuộc vào [lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `weekOfYear` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Để tạo một đối tượng `Temporal.PlainDateTime` mới với giá trị `weekOfYear` mong muốn, hãy dùng phương thức {{jsxref("Temporal/PlainDateTime/add", "add()")}} hoặc {{jsxref("Temporal/PlainDateTime/subtract", "subtract()")}} với số lượng `weeks` phù hợp.

Để biết thông tin chung và thêm ví dụ, xem {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}.

## Ví dụ

### Sử dụng weekOfYear

```js
const dt = Temporal.PlainDateTime.from("2021-07-01");
console.log(dt.weekOfYear); // 26
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
- {{jsxref("Temporal/PlainDateTime/yearOfWeek", "Temporal.PlainDateTime.prototype.yearOfWeek")}}
- {{jsxref("Temporal/PlainDateTime/dayOfWeek", "Temporal.PlainDateTime.prototype.dayOfWeek")}}
- {{jsxref("Temporal/PlainDateTime/daysInWeek", "Temporal.PlainDateTime.prototype.daysInWeek")}}
- {{jsxref("Temporal/PlainDateTime/daysInYear", "Temporal.PlainDateTime.prototype.daysInYear")}}
- {{jsxref("Temporal/PlainDate/weekOfYear", "Temporal.PlainDate.prototype.weekOfYear")}}
