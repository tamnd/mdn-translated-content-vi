---
title: Date.prototype.getUTCDate()
short-title: getUTCDate()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCDate
sidebar: jsref
---

Phương thức **`getUTCDate()`** của các đối tượng {{jsxref("Date")}} trả về ngày trong tháng của ngày này theo giờ quốc tế (UTC).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCDate()")}}

```js interactive-example
const date1 = new Date("August 19, 1975 23:15:30 GMT+11:00");
const date2 = new Date("August 19, 1975 23:15:30 GMT-11:00");

console.log(date1.getUTCDate());
// Expected output: 19

console.log(date2.getUTCDate());
// Expected output: 20
```

## Cú pháp

```js-nolint
getUTCDate()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 1 đến 31, đại diện cho ngày trong tháng của ngày đã cho theo giờ quốc tế (UTC). Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getUTCDate()

Ví dụ sau đây gán ngày trong tháng của ngày hiện tại cho biến `dayOfMonth`.

```js
const today = new Date();
const dayOfMonth = today.getUTCDate();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCDay()")}}
- {{jsxref("Date.prototype.getDay()")}}
- {{jsxref("Date.prototype.setUTCDate()")}}
