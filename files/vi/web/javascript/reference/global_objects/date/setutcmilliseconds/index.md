---
title: Date.prototype.setUTCMilliseconds()
short-title: setUTCMilliseconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCMilliseconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCMilliseconds
sidebar: jsref
---

Phương thức **`setUTCMilliseconds()`** của các instance {{jsxref("Date")}} thay đổi mili giây cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCMilliseconds()")}}

```js interactive-example
const date = new Date("2018-01-24T12:38:29.069Z");

console.log(date.getUTCMilliseconds());
// Expected output: 69

date.setUTCMilliseconds(420);

console.log(date.getUTCMilliseconds());
// Expected output: 420
```

## Cú pháp

```js-nolint
setUTCMilliseconds(millisecondsValue)
```

### Tham số

- `millisecondsValue`
  - : Một số nguyên từ 0 đến 999 đại diện cho mili giây.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu `millisecondsValue` là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, `setUTCMilliseconds()` cố gắng cập nhật thông tin ngày trong đối tượng {{jsxref("Date")}} tương ứng. Ví dụ, nếu bạn dùng 1100 cho `millisecondsValue`, giây được lưu trong đối tượng {{jsxref("Date")}} sẽ tăng thêm 1, và 100 sẽ được dùng cho mili giây.

## Ví dụ

### Sử dụng setUTCMilliseconds()

```js
const theBigDay = new Date();
theBigDay.setUTCMilliseconds(500);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCMilliseconds()")}}
- {{jsxref("Date.prototype.setMilliseconds()")}}
