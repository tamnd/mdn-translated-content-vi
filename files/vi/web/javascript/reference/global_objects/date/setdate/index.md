---
title: Date.prototype.setDate()
short-title: setDate()
slug: Web/JavaScript/Reference/Global_Objects/Date/setDate
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setDate
sidebar: jsref
---

Phương thức **`setDate()`** của các đối tượng {{jsxref("Date")}} thay đổi ngày trong tháng của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.setDate()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");

event.setDate(24);

console.log(event.getDate());
// Expected output: 24

event.setDate(32);
// Only 31 days in August!

console.log(event.getDate());
// Expected output: 1
```

## Cú pháp

```js-nolint
setDate(dateValue)
```

### Tham số

- `dateValue`
  - : Một số nguyên đại diện cho ngày trong tháng.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu `dateValue` là `NaN` (hoặc các giá trị khác bị [ép buộc](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày được đặt thành [Ngày không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn chỉ định một số ngoài phạm vi dự kiến, thông tin ngày trong đối tượng {{jsxref("Date")}} sẽ được cập nhật tương ứng. Ví dụ, nếu đối tượng `Date` giữ ngày 1 tháng 6, một `dateValue` là 40 sẽ thay đổi ngày thành 10 tháng 7, trong khi `dateValue` là 0 sẽ thay đổi ngày thành ngày cuối tháng trước, tức 31 tháng 5.

Vì `setDate()` hoạt động theo giờ địa phương, việc vượt qua ranh giới Giờ tiết kiệm ánh sáng ban ngày (DST) có thể dẫn đến thời gian đã trôi qua khác với mong đợi. Ví dụ, nếu việc đặt ngày vượt qua một chuyển tiếp spring-forward (mất một giờ), sự chênh lệch timestamp giữa ngày mới và ngày cũ sẽ ít hơn một giờ so với chênh lệch ngày danh nghĩa nhân với 24 giờ. Ngược lại, việc vượt qua chuyển tiếp fall-back (thêm một giờ) sẽ dẫn đến thêm một giờ. Nếu bạn cần điều chỉnh ngày theo một lượng thời gian cố định, hãy cân nhắc sử dụng {{jsxref("Date/setUTCDate", "setUTCDate()")}} hoặc {{jsxref("Date/setTime", "setTime()")}}.

Nếu giờ địa phương mới nằm trong một chuyển tiếp offset, thời gian chính xác được suy ra bằng cách sử dụng hành vi giống như tùy chọn [`disambiguation: "compatible"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) của `Temporal`. Tức là, nếu giờ địa phương tương ứng với hai thời điểm, thời điểm trước đó sẽ được chọn; nếu giờ địa phương không tồn tại (có một khoảng trống), chúng ta tiến về phía trước theo khoảng thời gian của khoảng trống.

## Ví dụ

### Sử dụng setDate()

```js
const theBigDay = new Date(1962, 6, 7, 12); // buổi trưa của 1962-07-07 (ngày 7 tháng 7 năm 1962, tháng được đánh chỉ số từ 0)
const theBigDay2 = new Date(theBigDay).setDate(24); // 1962-07-24 (ngày 24 tháng 7 năm 1962)
const theBigDay3 = new Date(theBigDay).setDate(32); // 1962-08-01 (ngày 1 tháng 8 năm 1962)
const theBigDay4 = new Date(theBigDay).setDate(22); // 1962-07-22 (ngày 22 tháng 7 năm 1962)
const theBigDay5 = new Date(theBigDay).setDate(0); // 1962-06-30 (ngày 30 tháng 6 năm 1962)
const theBigDay6 = new Date(theBigDay).setDate(98); // 1962-10-06 (ngày 6 tháng 10 năm 1962)
const theBigDay7 = new Date(theBigDay).setDate(-50); // 1962-05-11 (ngày 11 tháng 5 năm 1962)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date/Date", "Date()")}}
- {{jsxref("Date.prototype.getDate()")}}
- {{jsxref("Date.prototype.setUTCDate()")}}
