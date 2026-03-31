---
title: Date.prototype.setUTCSeconds()
short-title: setUTCSeconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCSeconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCSeconds
sidebar: jsref
---

Phương thức **`setUTCSeconds()`** của các instance {{jsxref("Date")}} thay đổi giây và/hoặc mili giây cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCSeconds()")}}

```js interactive-example
const date = new Date("December 31, 1975, 23:15:30 GMT+11:00");

console.log(date.getUTCSeconds());
// Expected output: 30

date.setUTCSeconds(39);

console.log(date.getUTCSeconds());
// Expected output: 39
```

## Cú pháp

```js-nolint
setUTCSeconds(secondsValue)
setUTCSeconds(secondsValue, msValue)
```

### Tham số

- `secondsValue`
  - : Một số nguyên từ 0 đến 59 đại diện cho giây.
- `msValue` {{optional_inline}}
  - : Một số nguyên từ 0 đến 999 đại diện cho mili giây.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định tham số `msValue`, giá trị được trả về từ phương thức {{jsxref("Date/getUTCMilliseconds", "getUTCMilliseconds()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, `setUTCSeconds()` cố gắng cập nhật thông tin ngày trong đối tượng {{jsxref("Date")}} tương ứng. Ví dụ, nếu bạn dùng 100 cho `secondsValue`, phút được lưu trong đối tượng {{jsxref("Date")}} sẽ tăng thêm 1, và 40 sẽ được dùng cho giây.

## Ví dụ

### Sử dụng setUTCSeconds()

```js
const theBigDay = new Date();
theBigDay.setUTCSeconds(20);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCSeconds()")}}
- {{jsxref("Date.prototype.setSeconds()")}}
