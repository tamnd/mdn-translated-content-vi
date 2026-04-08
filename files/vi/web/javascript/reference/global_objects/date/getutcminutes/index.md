---
title: Date.prototype.getUTCMinutes()
short-title: getUTCMinutes()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCMinutes
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCMinutes
sidebar: jsref
---

Phương thức **`getUTCMinutes()`** của các đối tượng {{jsxref("Date")}} trả về số phút của ngày này theo giờ quốc tế (UTC).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCMinutes()")}}

```js interactive-example
const date1 = new Date("1 January 2000 03:15:30 GMT+07:00");
const date2 = new Date("1 January 2000 03:15:30 GMT+03:30");

console.log(date1.getUTCMinutes()); // 31 Dec 1999 20:15:30 GMT
// Expected output: 15

console.log(date2.getUTCMinutes()); // 31 Dec 1999 23:45:30 GMT
// Expected output: 45
```

## Cú pháp

```js-nolint
getUTCMinutes()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 59, đại diện cho số phút của ngày đã cho theo giờ quốc tế (UTC). Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getUTCMinutes()

Ví dụ sau đây gán phần phút của thời gian hiện tại cho biến `minutes`.

```js
const today = new Date();
const minutes = today.getUTCMinutes();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getMinutes()")}}
- {{jsxref("Date.prototype.setUTCMinutes()")}}
