---
title: Date.prototype.setUTCMinutes()
short-title: setUTCMinutes()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCMinutes
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCMinutes
sidebar: jsref
---

Phương thức **`setUTCMinutes()`** của các instance {{jsxref("Date")}} thay đổi phút cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCMinutes()")}}

```js interactive-example
const date = new Date("December 31, 1975, 23:15:30 GMT+11:00");

console.log(date.getUTCMinutes());
// Expected output: 15

date.setUTCMinutes(25);

console.log(date.getUTCMinutes());
// Expected output: 25
```

## Cú pháp

```js-nolint
setUTCMinutes(minutesValue)
setUTCMinutes(minutesValue, secondsValue)
setUTCMinutes(minutesValue, secondsValue, msValue)
```

### Tham số

- `minutesValue`
  - : Một số nguyên từ 0 đến 59 đại diện cho phút.
- `secondsValue` {{optional_inline}}
  - : Một số nguyên từ 0 đến 59 đại diện cho giây. Nếu bạn chỉ định `secondsValue`, bạn cũng phải chỉ định `minutesValue`.
- `msValue` {{optional_inline}}
  - : Một số nguyên từ 0 đến 999 đại diện cho mili giây. Nếu bạn chỉ định `msValue`, bạn cũng phải chỉ định `minutesValue` và `secondsValue`.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định các tham số `secondsValue` và `msValue`, các giá trị được trả về từ phương thức {{jsxref("Date/getUTCSeconds", "getUTCSeconds()")}} và {{jsxref("Date/getUTCMilliseconds", "getUTCMilliseconds()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, `setUTCMinutes()` cố gắng cập nhật thông tin ngày trong đối tượng {{jsxref("Date")}} tương ứng. Ví dụ, nếu bạn dùng 100 cho `secondsValue`, phút sẽ tăng thêm 1 (`minutesValue + 1`), và 40 sẽ được dùng cho giây.

## Ví dụ

### Sử dụng setUTCMinutes()

```js
const theBigDay = new Date();
theBigDay.setUTCMinutes(43);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCMinutes()")}}
- {{jsxref("Date.prototype.setMinutes()")}}
