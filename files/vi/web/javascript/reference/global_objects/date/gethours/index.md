---
title: Date.prototype.getHours()
short-title: getHours()
slug: Web/JavaScript/Reference/Global_Objects/Date/getHours
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getHours
sidebar: jsref
---

Phương thức **`getHours()`** của các đối tượng {{jsxref("Date")}} trả về số giờ của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.getHours()", "shorter")}}

```js interactive-example
const birthday = new Date("March 13, 08 04:20");

console.log(birthday.getHours());
// Expected output: 4
```

## Cú pháp

```js-nolint
getHours()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 23, đại diện cho số giờ của ngày đã cho theo giờ địa phương. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getHours()

Biến `hours` có giá trị `23`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const hours = xmas95.getHours();

console.log(hours); // 23
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCHours()")}}
- {{jsxref("Date.prototype.setHours()")}}
