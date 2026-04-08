---
title: Date.prototype.getFullYear()
short-title: getFullYear()
slug: Web/JavaScript/Reference/Global_Objects/Date/getFullYear
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getFullYear
sidebar: jsref
---

Phương thức **`getFullYear()`** của các đối tượng {{jsxref("Date")}} trả về năm của ngày này theo giờ địa phương.

Hãy sử dụng phương thức này thay vì phương thức {{jsxref("Date/getYear", "getYear()")}}.

{{InteractiveExample("JavaScript Demo: Date.prototype.getFullYear()", "shorter")}}

```js interactive-example
const moonLanding = new Date("July 20, 69 00:20:18");

console.log(moonLanding.getFullYear());
// Expected output: 1969
```

## Cú pháp

```js-nolint
getFullYear()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên đại diện cho năm của ngày đã cho theo giờ địa phương. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Không giống như {{jsxref("Date/getYear", "getYear()")}}, giá trị được trả về bởi `getFullYear()` là một số tuyệt đối. Đối với các ngày từ năm 1000 đến 9999, `getFullYear()` trả về một số bốn chữ số, ví dụ, 1995. Hãy sử dụng hàm này để đảm bảo một năm tuân thủ với các năm sau năm 2000.

## Ví dụ

### Sử dụng getFullYear()

Biến `fullYear` có giá trị `1995`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const fullYear = xmas95.getFullYear();

console.log(fullYear); // 1995
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCFullYear()")}}
- {{jsxref("Date.prototype.setFullYear()")}}
- {{jsxref("Date.prototype.getYear()")}}
