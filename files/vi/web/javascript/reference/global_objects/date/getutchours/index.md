---
title: Date.prototype.getUTCHours()
short-title: getUTCHours()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCHours
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCHours
sidebar: jsref
---

Phương thức **`getUTCHours()`** của các đối tượng {{jsxref("Date")}} trả về số giờ của ngày này theo giờ quốc tế (UTC).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCHours()")}}

```js interactive-example
const date1 = new Date("December 31, 1975, 23:15:30 GMT+11:00");
const date2 = new Date("December 31, 1975, 23:15:30 GMT-11:00");

console.log(date1.getUTCHours());
// Expected output: 12

console.log(date2.getUTCHours());
// Expected output: 10
```

## Cú pháp

```js-nolint
getUTCHours()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 23, đại diện cho số giờ của ngày đã cho theo giờ quốc tế (UTC). Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getUTCHours()

Ví dụ sau đây gán phần giờ của thời gian hiện tại cho biến `hours`.

```js
const today = new Date();
const hours = today.getUTCHours();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getHours()")}}
- {{jsxref("Date.prototype.setUTCHours()")}}
