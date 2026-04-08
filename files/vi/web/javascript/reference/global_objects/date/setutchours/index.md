---
title: Date.prototype.setUTCHours()
short-title: setUTCHours()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCHours
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCHours
sidebar: jsref
---

Phương thức **`setUTCHours()`** của các instance {{jsxref("Date")}} thay đổi giờ, phút, giây và/hoặc mili giây cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCHours()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30 GMT-3:00");

console.log(event.toUTCString());
// Expected output: "Wed, 20 Aug 1975 02:15:30 GMT"

console.log(event.getUTCHours());
// Expected output: 2

event.setUTCHours(23);

console.log(event.toUTCString());
// Expected output: "Wed, 20 Aug 1975 23:15:30 GMT"
```

## Cú pháp

```js-nolint
setUTCHours(hoursValue)
setUTCHours(hoursValue, minutesValue)
setUTCHours(hoursValue, minutesValue, secondsValue)
setUTCHours(hoursValue, minutesValue, secondsValue, msValue)
```

### Tham số

- `hoursValue`
  - : Một số nguyên từ 0 đến 23 đại diện cho giờ.
- `minutesValue` {{optional_inline}}
  - : Một số nguyên từ 0 đến 59 đại diện cho phút.
- `secondsValue` {{optional_inline}}
  - : Một số nguyên từ 0 đến 59 đại diện cho giây. Nếu bạn chỉ định `secondsValue`, bạn cũng phải chỉ định `minutesValue`.
- `msValue` {{optional_inline}}
  - : Một số nguyên từ 0 đến 999 đại diện cho mili giây. Nếu bạn chỉ định `msValue`, bạn cũng phải chỉ định `minutesValue` và `secondsValue`.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định các tham số `minutesValue`, `secondsValue` và `msValue`, các giá trị được trả về từ phương thức {{jsxref("Date/getUTCMinutes", "getUTCMinutes()")}}, {{jsxref("Date/getUTCSeconds", "getUTCSeconds()")}} và {{jsxref("Date/getUTCMilliseconds", "getUTCMilliseconds()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, `setUTCHours()` cố gắng cập nhật thông tin ngày trong đối tượng {{jsxref("Date")}} tương ứng. Ví dụ, nếu bạn dùng 100 cho `secondsValue`, phút sẽ tăng thêm 1 (`minutesValue + 1`), và 40 sẽ được dùng cho giây.

## Ví dụ

### Sử dụng setUTCHours()

```js
const theBigDay = new Date();
theBigDay.setUTCHours(8);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCHours()")}}
- {{jsxref("Date.prototype.setHours()")}}
