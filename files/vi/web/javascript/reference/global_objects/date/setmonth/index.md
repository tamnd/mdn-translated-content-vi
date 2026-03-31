---
title: Date.prototype.setMonth()
short-title: setMonth()
slug: Web/JavaScript/Reference/Global_Objects/Date/setMonth
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setMonth
sidebar: jsref
---

Phương thức **`setMonth()`** của các instance {{jsxref("Date")}} thay đổi tháng và/hoặc ngày trong tháng cho ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.setMonth()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");

event.setMonth(3);

console.log(event.getMonth());
// Expected output: 3

console.log(event);
// Expected output: "Sat Apr 19 1975 23:15:30 GMT+0100 (CET)"
// Note: your timezone may vary
```

## Cú pháp

```js-nolint
setMonth(monthValue)
setMonth(monthValue, dateValue)
```

### Tham số

- `monthValue`
  - : Một số nguyên đại diện cho tháng: 0 cho tháng Một, 1 cho tháng Hai, và cứ tiếp tục như vậy.
- `dateValue` {{optional_inline}}
  - : Một số nguyên từ 1 đến 31 đại diện cho ngày trong tháng.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép kiểu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày sẽ được đặt thành [Invalid Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định tham số `dateValue`, giá trị tương tự như những gì được trả về bởi {{jsxref("Date/getDate", "getDate()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, các tham số khác và thông tin ngày trong đối tượng {{jsxref("Date")}} sẽ được cập nhật tương ứng. Ví dụ, nếu bạn chỉ định 15 cho `monthValue`, năm sẽ tăng thêm 1 và 3 sẽ được dùng cho tháng.

Ngày hiện tại trong tháng sẽ ảnh hưởng đến hành vi của phương thức này. Về mặt khái niệm, nó sẽ cộng số ngày được cho bởi ngày hiện tại trong tháng vào ngày 1 của tháng mới được chỉ định làm tham số, để trả về ngày mới. Ví dụ, nếu giá trị hiện tại là ngày 31 tháng 1 năm 2016, gọi setMonth với giá trị 1 sẽ trả về ngày 2 tháng 3 năm 2016. Điều này là vì tháng 2 năm 2016 có 29 ngày.

Vì `setMonth()` hoạt động theo giờ địa phương, việc vượt qua ranh giới Giờ tiết kiệm ánh sáng ban ngày (DST) có thể dẫn đến thời gian trôi qua khác với dự kiến. Ví dụ, nếu việc đặt tháng vượt qua chuyển tiếp mùa xuân (mất một giờ), sự chênh lệch timestamp giữa ngày mới và ngày cũ sẽ ít hơn một giờ so với chênh lệch ngày danh nghĩa nhân với 24 giờ. Ngược lại, việc vượt qua chuyển tiếp mùa thu (tăng một giờ) sẽ dẫn đến thêm một giờ. Nếu bạn cần điều chỉnh ngày theo một lượng thời gian cố định, hãy cân nhắc sử dụng {{jsxref("Date/setUTCMonth", "setUTCMonth()")}} hoặc {{jsxref("Date/setTime", "setTime()")}}.

Nếu thời gian địa phương mới nằm trong một chuyển tiếp offset, thời gian chính xác được suy ra bằng cách sử dụng hành vi tương tự như tùy chọn [`disambiguation: "compatible"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) của `Temporal`. Nghĩa là, nếu thời gian địa phương tương ứng với hai thời điểm, thời điểm trước được chọn; nếu thời gian địa phương không tồn tại (có khoảng trống), chúng ta tiến về phía trước bằng khoảng thời gian của khoảng trống.

## Ví dụ

### Sử dụng setMonth()

```js
const theBigDay = new Date();
theBigDay.setMonth(6);

// Watch out for end of month transitions
const endOfMonth = new Date(2016, 7, 31);
endOfMonth.setMonth(1);
console.log(endOfMonth); // Wed Mar 02 2016 00:00:00
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getMonth()")}}
- {{jsxref("Date.prototype.setUTCMonth()")}}
