---
title: Date.prototype.setTime()
short-title: setTime()
slug: Web/JavaScript/Reference/Global_Objects/Date/setTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setTime
sidebar: jsref
---

Phương thức **`setTime()`** của các instance {{jsxref("Date")}} thay đổi [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) cho ngày này, là số mili giây kể từ [epoch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), được định nghĩa là nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC.

{{InteractiveExample("JavaScript Demo: Date.prototype.setTime()", "taller")}}

```js interactive-example
const launchDate = new Date("July 1, 1999, 12:00:00");
const futureDate = new Date();
futureDate.setTime(launchDate.getTime());

console.log(futureDate);
// Expected output: "Thu Jul 01 1999 12:00:00 GMT+0200 (CEST)"

const fiveMinutesInMs = 5 * 60 * 1000;
futureDate.setTime(futureDate.getTime() + fiveMinutesInMs);

console.log(futureDate);
// Expected output: "Thu Jul 01 1999 12:05:00 GMT+0200 (CEST)"
// Note: your timezone may vary
```

## Cú pháp

```js-nolint
setTime(timeValue)
```

### Tham số

- `timeValue`
  - : Một số nguyên đại diện cho timestamp mới — số mili giây kể từ nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu `timeValue` là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Ví dụ

### Sử dụng setTime()

```js
const theBigDay = new Date("1999-07-01");
const sameAsBigDay = new Date();
sameAsBigDay.setTime(theBigDay.getTime());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getTime()")}}
- {{jsxref("Date.prototype.setUTCHours()")}}
