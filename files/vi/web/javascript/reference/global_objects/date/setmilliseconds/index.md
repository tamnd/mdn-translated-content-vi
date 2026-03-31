---
title: Date.prototype.setMilliseconds()
short-title: setMilliseconds()
slug: Web/JavaScript/Reference/Global_Objects/Date/setMilliseconds
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setMilliseconds
sidebar: jsref
---

Phương thức **`setMilliseconds()`** của các instance {{jsxref("Date")}} thay đổi mili giây cho ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.setMilliseconds()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");

console.log(event.getMilliseconds());
// Expected output: 0

event.setMilliseconds(456);

console.log(event.getMilliseconds());
// Expected output: 456
```

## Cú pháp

```js-nolint
setMilliseconds(millisecondsValue)
```

### Tham số

- `millisecondsValue`
  - : Một số nguyên từ 0 đến 999 đại diện cho mili giây.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu `millisecondsValue` là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn chỉ định một số ngoài phạm vi dự kiến, thông tin ngày trong đối tượng {{jsxref("Date")}} sẽ được cập nhật tương ứng. Ví dụ, nếu bạn chỉ định 1005, số giây sẽ tăng thêm 1 và 5 sẽ được dùng cho mili giây.

Vì `setMilliseconds()` hoạt động theo giờ địa phương, việc vượt qua ranh giới Giờ tiết kiệm ánh sáng ban ngày (DST) có thể dẫn đến thời gian trôi qua khác với dự kiến. Ví dụ, nếu việc đặt mili giây vượt qua chuyển tiếp mùa xuân (mất một giờ), sự chênh lệch timestamp giữa ngày mới và ngày cũ sẽ ít hơn một giờ so với chênh lệch thời gian danh nghĩa. Ngược lại, việc vượt qua chuyển tiếp mùa thu (tăng một giờ) sẽ dẫn đến thêm một giờ. Nếu bạn cần điều chỉnh ngày theo một lượng thời gian cố định, hãy cân nhắc sử dụng {{jsxref("Date/setUTCMilliseconds", "setUTCMilliseconds()")}} hoặc {{jsxref("Date/setTime", "setTime()")}}.

Nếu thời gian địa phương mới nằm trong một chuyển tiếp offset, thời gian chính xác được suy ra bằng cách sử dụng hành vi tương tự như tùy chọn [`disambiguation: "compatible"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) của `Temporal`. Nghĩa là, nếu thời gian địa phương tương ứng với hai thời điểm, thời điểm trước được chọn; nếu thời gian địa phương không tồn tại (có khoảng trống), chúng ta tiến về phía trước bằng khoảng thời gian của khoảng trống.

## Ví dụ

### Sử dụng setMilliseconds()

```js
const theBigDay = new Date();
theBigDay.setMilliseconds(100);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getMilliseconds()")}}
- {{jsxref("Date.prototype.setUTCMilliseconds()")}}
