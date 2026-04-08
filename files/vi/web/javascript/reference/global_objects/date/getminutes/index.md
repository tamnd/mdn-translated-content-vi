---
title: Date.prototype.getMinutes()
short-title: getMinutes()
slug: Web/JavaScript/Reference/Global_Objects/Date/getMinutes
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getMinutes
sidebar: jsref
---

Phương thức **`getMinutes()`** của các đối tượng {{jsxref("Date")}} trả về số phút của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.getMinutes()", "shorter")}}

```js interactive-example
const birthday = new Date("March 13, 08 04:20");

console.log(birthday.getMinutes());
// Expected output: 20
```

## Cú pháp

```js-nolint
getMinutes()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 59, đại diện cho số phút của ngày đã cho theo giờ địa phương. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getMinutes()

Biến `minutes` có giá trị `15`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const minutes = xmas95.getMinutes();

console.log(minutes); // 15
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCMinutes()")}}
- {{jsxref("Date.prototype.setMinutes()")}}
