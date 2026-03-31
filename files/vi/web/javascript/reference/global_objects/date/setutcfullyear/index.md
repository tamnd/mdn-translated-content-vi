---
title: Date.prototype.setUTCFullYear()
short-title: setUTCFullYear()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCFullYear
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCFullYear
sidebar: jsref
---

Phương thức **`setUTCFullYear()`** của các instance {{jsxref("Date")}} thay đổi năm cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCFullYear()")}}

```js interactive-example
const event = new Date("December 31, 1975 23:15:30 GMT-3:00");

console.log(event.getUTCFullYear());
// Expected output: 1976

console.log(event.toUTCString());
// Expected output: "Thu, 01 Jan 1976 02:15:30 GMT"

event.setUTCFullYear(1975);

console.log(event.toUTCString());
// Expected output: "Wed, 01 Jan 1975 02:15:30 GMT"
```

## Cú pháp

```js-nolint
setUTCFullYear(yearValue)
setUTCFullYear(yearValue, monthValue)
setUTCFullYear(yearValue, monthValue, dateValue)
```

### Tham số

- `yearValue`
  - : Một số nguyên đại diện cho năm. Ví dụ, 1995.
- `monthValue` {{optional_inline}}
  - : Một số nguyên đại diện cho tháng: 0 cho tháng Một, 1 cho tháng Hai, và cứ tiếp tục như vậy.
- `dateValue` {{optional_inline}}
  - : Một số nguyên từ 1 đến 31 đại diện cho ngày trong tháng. Nếu bạn chỉ định `dateValue`, bạn cũng phải chỉ định `monthValue`.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định các tham số `monthValue` và `dateValue`, các giá trị được trả về từ phương thức {{jsxref("Date/getUTCMonth", "getUTCMonth()")}} và {{jsxref("Date/getUTCDate", "getUTCDate()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, `setUTCFullYear()` cố gắng cập nhật các tham số khác và thông tin ngày trong đối tượng {{jsxref("Date")}} tương ứng. Ví dụ, nếu bạn chỉ định 15 cho `monthValue`, năm sẽ tăng thêm 1 (`yearValue + 1`), và 3 sẽ được dùng cho tháng.

## Ví dụ

### Sử dụng setUTCFullYear()

```js
const theBigDay = new Date();
theBigDay.setUTCFullYear(1997);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCFullYear()")}}
- {{jsxref("Date.prototype.setFullYear()")}}
