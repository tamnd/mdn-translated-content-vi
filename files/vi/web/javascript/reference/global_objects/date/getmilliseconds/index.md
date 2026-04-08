---
title: Date.prototype.getMilliseconds()
short-title: getMilliseconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/getMilliseconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getMilliseconds
sidebar: jsref
---

Phương thức **`getMilliseconds()`** của các đối tượng {{jsxref("Date")}} trả về số mili giây của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.getMilliseconds()", "shorter")}}

```js interactive-example
const moonLanding = new Date("July 20, 69 00:20:18");
moonLanding.setMilliseconds(123);

console.log(moonLanding.getMilliseconds());
// Expected output: 123
```

## Cú pháp

```js-nolint
getMilliseconds()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 999, đại diện cho số mili giây của ngày đã cho theo giờ địa phương. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getMilliseconds()

Biến `milliseconds` có giá trị `0`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`, vì không chỉ định thành phần mili giây nên mặc định là 0.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const milliseconds = xmas95.getMilliseconds();

console.log(milliseconds); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCMilliseconds()")}}
- {{jsxref("Date.prototype.setMilliseconds()")}}
