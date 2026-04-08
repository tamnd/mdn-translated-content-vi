---
title: Date.prototype.getUTCSeconds()
short-title: getUTCSeconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCSeconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCSeconds
sidebar: jsref
---

Phương thức **`getUTCSeconds()`** của các đối tượng {{jsxref("Date")}} trả về số giây của ngày đã cho theo giờ quốc tế (UTC).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCSeconds()", "shorter")}}

```js interactive-example
const moonLanding = new Date("July 20, 1969, 20:18:04 UTC");

console.log(moonLanding.getUTCSeconds());
// Expected output: 4
```

## Cú pháp

```js-nolint
getUTCSeconds()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 59, đại diện cho số giây của ngày đã cho theo giờ quốc tế (UTC). Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Ví dụ

### Sử dụng getUTCSeconds()

Ví dụ sau đây gán phần giây của thời gian hiện tại cho biến `seconds`.

```js
const today = new Date();
const seconds = today.getUTCSeconds();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getSeconds()")}}
- {{jsxref("Date.prototype.setUTCSeconds()")}}
