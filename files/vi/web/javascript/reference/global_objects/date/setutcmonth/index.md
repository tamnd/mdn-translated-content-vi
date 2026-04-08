---
title: Date.prototype.setUTCMonth()
short-title: setUTCMonth()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCMonth
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCMonth
sidebar: jsref
---

Phương thức **`setUTCMonth()`** của các instance {{jsxref("Date")}} thay đổi tháng và/hoặc ngày trong tháng cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCMonth()")}}

```js interactive-example
const event = new Date("December 31, 1975 23:15:30 GMT-3:00");

console.log(event.toUTCString());
// Expected output: "Thu, 01 Jan 1976 02:15:30 GMT"

console.log(event.getUTCMonth());
// Expected output: 0

event.setUTCMonth(11);

console.log(event.toUTCString());
// Expected output: "Wed, 01 Dec 1976 02:15:30 GMT"
```

## Cú pháp

```js-nolint
setUTCMonth(monthValue)
setUTCMonth(monthValue, dateValue)
```

### Tham số

- `monthValue`
  - : Một số nguyên đại diện cho tháng: 0 cho tháng Một, 1 cho tháng Hai, và cứ tiếp tục như vậy.
- `dateValue` {{optional_inline}}
  - : Một số nguyên từ 1 đến 31 đại diện cho ngày trong tháng.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định tham số `dateValue`, giá trị được trả về từ phương thức {{jsxref("Date/getUTCDate", "getUTCDate()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, `setUTCMonth()` cố gắng cập nhật thông tin ngày trong đối tượng {{jsxref("Date")}} tương ứng. Ví dụ, nếu bạn dùng 15 cho `monthValue`, năm sẽ tăng thêm 1, và 3 sẽ được dùng cho tháng.

## Ví dụ

### Sử dụng setUTCMonth()

```js
const theBigDay = new Date();
theBigDay.setUTCMonth(11);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCMonth()")}}
- {{jsxref("Date.prototype.setMonth()")}}
