---
title: Date.prototype.getDate()
short-title: getDate()
slug: Web/JavaScript/Reference/Global_Objects/Date/getDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getDate
sidebar: jsref
---

Phương thức **`getDate()`** của các đối tượng {{jsxref("Date")}} trả về ngày trong tháng của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.getDate()", "shorter")}}

```js interactive-example
const birthday = new Date("August 19, 1975 23:15:30");
const date = birthday.getDate();

console.log(date);
// Expected output: 19
```

## Cú pháp

```js-nolint
getDate()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 1 đến 31, đại diện cho ngày trong tháng của ngày đã cho theo giờ địa phương. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getDate()

Biến `day` có giá trị `25`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const day = xmas95.getDate();

console.log(day); // 25
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCDate()")}}
- {{jsxref("Date.prototype.getUTCDay()")}}
- {{jsxref("Date.prototype.setDate()")}}
