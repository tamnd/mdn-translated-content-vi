---
title: Date.prototype.getDay()
short-title: getDay()
slug: Web/JavaScript/Reference/Global_Objects/Date/getDay
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getDay
sidebar: jsref
---

Phương thức **`getDay()`** của các đối tượng {{jsxref("Date")}} trả về thứ trong tuần của ngày này theo giờ địa phương, trong đó 0 đại diện cho Chủ Nhật. Để lấy ngày trong tháng, xem {{jsxref("Date.prototype.getDate()")}}.

{{InteractiveExample("JavaScript Demo: Date.prototype.getDay()", "shorter")}}

```js interactive-example
const birthday = new Date("August 19, 1975 23:15:30");
const day1 = birthday.getDay();
// Sunday - Saturday : 0 - 6

console.log(day1);
// Expected output: 2
```

## Cú pháp

```js-nolint
getDay()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 6, đại diện cho thứ trong tuần của ngày đã cho theo giờ địa phương: 0 cho Chủ Nhật, 1 cho Thứ Hai, 2 cho Thứ Ba, v.v. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Giá trị trả về của `getDay()` được đánh chỉ số từ 0, điều này hữu ích khi lập chỉ mục vào mảng tên các ngày, ví dụ:

```js
const valentines = new Date("1995-02-14");
const day = valentines.getDay();
const dayNames = ["Sunday", "Monday", "Tuesday" /* , … */];

console.log(dayNames[day]); // "Monday"
```

Tuy nhiên, với mục đích quốc tế hóa, bạn nên ưu tiên sử dụng {{jsxref("Intl.DateTimeFormat")}} với tham số `options` thay thế.

```js
const options = { weekday: "long" };
console.log(new Intl.DateTimeFormat("en-US", options).format(valentines));
// "Monday"
console.log(new Intl.DateTimeFormat("de-DE", options).format(valentines));
// "Montag"
```

## Ví dụ

### Sử dụng getDay()

Biến `weekday` có giá trị `1`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`, vì ngày 25 tháng 12 năm 1995 là Thứ Hai.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const weekday = xmas95.getDay();

console.log(weekday); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCDate()")}}
- {{jsxref("Date.prototype.getUTCDay()")}}
- {{jsxref("Date.prototype.setDate()")}}
