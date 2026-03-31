---
title: Date.prototype.getUTCMonth()
short-title: getUTCMonth()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCMonth
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCMonth
sidebar: jsref
---

Phương thức **`getUTCMonth()`** của các đối tượng {{jsxref("Date")}} trả về tháng của ngày này theo giờ quốc tế (UTC), dưới dạng giá trị đánh chỉ số từ 0 (trong đó 0 chỉ tháng đầu tiên trong năm).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCMonth()")}}

```js interactive-example
const date1 = new Date("December 31, 1975, 23:15:30 GMT+11:00");
const date2 = new Date("December 31, 1975, 23:15:30 GMT-11:00");

// December
console.log(date1.getUTCMonth());
// Expected output: 11

// January
console.log(date2.getUTCMonth());
// Expected output: 0
```

## Cú pháp

```js-nolint
getUTCMonth()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 11, đại diện cho tháng của ngày đã cho theo giờ quốc tế (UTC): 0 cho tháng Giêng, 1 cho tháng Hai, v.v. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getUTCMonth()

Ví dụ sau đây gán phần tháng của ngày hiện tại cho biến `month`.

```js
const today = new Date();
const month = today.getUTCMonth();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getMonth()")}}
- {{jsxref("Date.prototype.setUTCMonth()")}}
