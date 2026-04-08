---
title: Date.prototype.getUTCFullYear()
short-title: getUTCFullYear()
slug: Web/JavaScript/Reference/Global_Objects/Date/getUTCFullYear
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getUTCFullYear
sidebar: jsref
---

Phương thức **`getUTCFullYear()`** của các đối tượng {{jsxref("Date")}} trả về năm của ngày này theo giờ quốc tế (UTC).

{{InteractiveExample("JavaScript Demo: Date.prototype.getUTCFullYear()")}}

```js interactive-example
const date1 = new Date("December 31, 1975, 23:15:30 GMT+11:00");
const date2 = new Date("December 31, 1975, 23:15:30 GMT-11:00");

console.log(date1.getUTCFullYear());
// Expected output: 1975

console.log(date2.getUTCFullYear());
// Expected output: 1976
```

## Cú pháp

```js-nolint
getUTCFullYear()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên đại diện cho năm của ngày đã cho theo giờ quốc tế (UTC). Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Không giống như {{jsxref("Date/getYear", "getYear()")}}, giá trị được trả về bởi `getUTCFullYear()` là một số tuyệt đối. Đối với các ngày từ năm 1000 đến 9999, `getFullYear()` trả về một số bốn chữ số, ví dụ, 1995. Hãy sử dụng hàm này để đảm bảo một năm tuân thủ với các năm sau năm 2000.

## Ví dụ

### Sử dụng getUTCFullYear()

Ví dụ sau đây gán giá trị bốn chữ số của năm hiện tại cho biến `year`.

```js
const today = new Date();
const year = today.getUTCFullYear();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getFullYear()")}}
- {{jsxref("Date.prototype.setFullYear()")}}
