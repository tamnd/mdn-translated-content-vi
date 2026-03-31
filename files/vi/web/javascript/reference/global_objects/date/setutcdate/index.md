---
title: Date.prototype.setUTCDate()
short-title: setUTCDate()
slug: Web/JavaScript/Reference/Global_Objects/Date/setUTCDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setUTCDate
sidebar: jsref
---

Phương thức **`setUTCDate()`** của các instance {{jsxref("Date")}} thay đổi ngày trong tháng cho ngày này theo giờ quốc tế.

{{InteractiveExample("JavaScript Demo: Date.prototype.setUTCDate()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30 GMT-3:00");

console.log(event.getUTCDate());
// Expected output: 20

event.setUTCDate(19);

console.log(event.getUTCDate());
// Expected output: 19
```

## Cú pháp

```js-nolint
setUTCDate(dateValue)
```

### Tham số

- `dateValue`
  - : Một số nguyên từ 1 đến 31 đại diện cho ngày trong tháng.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu `dateValue` là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu `dateValue` nằm ngoài phạm vi giá trị ngày trong tháng, `setDate()` sẽ cập nhật đối tượng {{jsxref("Date")}} tương ứng.

Ví dụ, nếu 0 được cung cấp cho `dateValue`, ngày sẽ được đặt thành ngày cuối cùng của tháng trước. Nếu bạn dùng 40 cho `dateValue`, và tháng được lưu trong đối tượng {{jsxref("Date")}} là tháng Sáu, ngày sẽ được thay đổi thành 10 và tháng sẽ tăng lên thành tháng Bảy.

Nếu một số âm được cung cấp cho `dateValue`, ngày sẽ được đặt tính ngược từ ngày cuối cùng của tháng trước. -1 sẽ dẫn đến ngày được đặt thành 1 ngày trước ngày cuối cùng của tháng trước.

## Ví dụ

### Sử dụng setUTCDate()

```js
const theBigDay = new Date();
theBigDay.setUTCDate(20);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCDate()")}}
- {{jsxref("Date.prototype.setDate()")}}
