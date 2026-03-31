---
title: Date.prototype.getUTCDay()
short-title: getUTCDay()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCDay
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCDay
sidebar: jsref
---

Phương thức **`getUTCDay()`** của các đối tượng {{jsxref("Date")}} trả về thứ trong tuần của ngày này theo giờ quốc tế (UTC), trong đó 0 đại diện cho Chủ Nhật.

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCDay()")}}

```js interactive-example
const date1 = new Date("August 19, 1975 23:15:30 GMT+11:00");
const date2 = new Date("August 19, 1975 23:15:30 GMT-11:00");

// Tuesday
console.log(date1.getUTCDay());
// Expected output: 2

// Wednesday
console.log(date2.getUTCDay());
// Expected output: 3
```

## Cú pháp

```js-nolint
getUTCDay()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên tương ứng với thứ trong tuần của ngày đã cho theo giờ quốc tế (UTC): 0 cho Chủ Nhật, 1 cho Thứ Hai, 2 cho Thứ Ba, v.v. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getUTCDay()

Ví dụ sau đây gán phần thứ trong tuần của ngày hiện tại cho biến `weekday`.

```js
const today = new Date();
const weekday = today.getUTCDay();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCDate()")}}
- {{jsxref("Date.prototype.getDay()")}}
- {{jsxref("Date.prototype.setUTCDate()")}}
