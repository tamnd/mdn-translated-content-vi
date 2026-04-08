---
title: Date.prototype.getSeconds()
short-title: getSeconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/getSeconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getSeconds
sidebar: jsref
---

Phương thức **`getSeconds()`** của các đối tượng {{jsxref("Date")}} trả về số giây của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.getSeconds()", "shorter")}}

```js interactive-example
const moonLanding = new Date("July 20, 69 00:20:18");

console.log(moonLanding.getSeconds());
// Expected output: 18
```

## Cú pháp

```js-nolint
getSeconds()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 59, đại diện cho số giây của ngày đã cho theo giờ địa phương. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getSeconds()

Biến `seconds` có giá trị `30`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const seconds = xmas95.getSeconds();

console.log(seconds); // 30
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCSeconds()")}}
- {{jsxref("Date.prototype.setSeconds()")}}
