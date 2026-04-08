---
title: Date.prototype.getMonth()
short-title: getMonth()
slug: Web/JavaScript/Reference/Global_Objects/Date/getMonth
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.getMonth
sidebar: jsref
---

Phương thức **`getMonth()`** của các đối tượng {{jsxref("Date")}} trả về tháng của ngày này theo giờ địa phương, dưới dạng giá trị đánh chỉ số từ 0 (trong đó 0 chỉ tháng đầu tiên trong năm).

{{InteractiveExample("JavaScript Demo: Date.prototype.getMonth()", "shorter")}}

```js interactive-example
const moonLanding = new Date("July 20, 69 00:20:18");

console.log(moonLanding.getMonth()); // (January gives 0)
// Expected output: 6
```

## Cú pháp

```js-nolint
getMonth()
```

### Tham số

Không có.

### Giá trị trả về

Một số nguyên, từ 0 đến 11, đại diện cho tháng của ngày đã cho theo giờ địa phương: 0 cho tháng Giêng, 1 cho tháng Hai, v.v. Trả về `NaN` nếu ngày [không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date).

## Mô tả

Giá trị trả về của `getMonth()` được đánh chỉ số từ 0, điều này hữu ích khi lập chỉ mục vào mảng tên các tháng, ví dụ:

```js
const valentines = new Date("1995-02-14");
const month = valentines.getMonth();
const monthNames = ["January", "February", "March" /* , … */];

console.log(monthNames[month]); // "February"
```

Tuy nhiên, với mục đích quốc tế hóa, bạn nên ưu tiên sử dụng {{jsxref("Intl.DateTimeFormat")}} với tham số `options` thay thế.

```js
const options = { month: "long" };
console.log(new Intl.DateTimeFormat("en-US", options).format(valentines));
// "February"
console.log(new Intl.DateTimeFormat("de-DE", options).format(valentines));
// "Februar"
```

## Ví dụ

### Sử dụng getMonth()

Biến `month` có giá trị `11`, dựa trên giá trị của đối tượng {{jsxref("Date")}} `xmas95`.

```js
const xmas95 = new Date("1995-12-25T23:15:30");
const month = xmas95.getMonth();

console.log(month); // 11
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCMonth()")}}
- {{jsxref("Date.prototype.setMonth()")}}
