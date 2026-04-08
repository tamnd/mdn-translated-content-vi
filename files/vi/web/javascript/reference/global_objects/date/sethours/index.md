---
title: Date.prototype.setHours()
short-title: setHours()
slug: Web/JavaScript/Reference/Global_Objects/Date/setHours
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setHours
sidebar: jsref
---

Phương thức **`setHours()`** của các instance {{jsxref("Date")}} thay đổi giờ, phút, giây và/hoặc mili giây cho ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.setHours()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");
event.setHours(20);

console.log(event);
// Expected output: "Tue Aug 19 1975 20:15:30 GMT+0200 (CEST)"
// Note: your timezone may vary

event.setHours(20, 21, 22);

console.log(event);
// Expected output: "Tue Aug 19 1975 20:21:22 GMT+0200 (CEST)"
```

## Cú pháp

```js-nolint
setHours(hoursValue)
setHours(hoursValue, minutesValue)
setHours(hoursValue, minutesValue, secondsValue)
setHours(hoursValue, minutesValue, secondsValue, msValue)
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

Nếu bạn không chỉ định các tham số `minutesValue`, `secondsValue` và `msValue`, các giá trị tương tự như những gì được trả về bởi {{jsxref("Date/getMinutes", "getMinutes()")}}, {{jsxref("Date/getSeconds", "getSeconds()")}} và {{jsxref("Date/getMilliseconds", "getMilliseconds()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, các tham số khác và thông tin ngày trong đối tượng {{jsxref("Date")}} sẽ được cập nhật tương ứng. Ví dụ, nếu bạn chỉ định 100 cho `secondsValue`, phút sẽ tăng thêm 1 (`minutesValue + 1`), và 40 sẽ được dùng cho giây.

Vì `setHours()` hoạt động theo giờ địa phương, việc vượt qua ranh giới Giờ tiết kiệm ánh sáng ban ngày (DST) có thể dẫn đến thời gian trôi qua khác với dự kiến. Ví dụ, nếu việc đặt giờ vượt qua chuyển tiếp mùa xuân (mất một giờ), sự chênh lệch timestamp giữa ngày mới và ngày cũ sẽ ít hơn một giờ so với chênh lệch giờ danh nghĩa. Ngược lại, việc vượt qua chuyển tiếp mùa thu (tăng một giờ) sẽ dẫn đến thêm một giờ. Nếu bạn cần điều chỉnh ngày theo một lượng thời gian cố định, hãy cân nhắc sử dụng {{jsxref("Date/setUTCHours", "setUTCHours()")}} hoặc {{jsxref("Date/setTime", "setTime()")}}.

Nếu thời gian địa phương mới nằm trong một chuyển tiếp offset, thời gian chính xác được suy ra bằng cách sử dụng hành vi tương tự như tùy chọn [`disambiguation: "compatible"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) của `Temporal`. Nghĩa là, nếu thời gian địa phương tương ứng với hai thời điểm, thời điểm trước được chọn; nếu thời gian địa phương không tồn tại (có khoảng trống), chúng ta tiến về phía trước bằng khoảng thời gian của khoảng trống.

## Ví dụ

### Sử dụng setHours()

```js
const theBigDay = new Date();
theBigDay.setHours(7);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getHours()")}}
- {{jsxref("Date.prototype.setUTCHours()")}}
