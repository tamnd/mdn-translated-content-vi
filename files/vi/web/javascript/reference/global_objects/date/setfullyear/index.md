---
title: Date.prototype.setFullYear()
short-title: setFullYear()
slug: Web/JavaScript/Reference/Global_Objects/Date/setFullYear
page-type: javascript-instance-method
browser-compat: javascript.builtins.Date.setFullYear
sidebar: jsref
---

Phương thức **`setFullYear()`** của các đối tượng {{jsxref("Date")}} thay đổi năm, tháng và/hoặc ngày trong tháng của ngày này theo giờ địa phương.

{{InteractiveExample("JavaScript Demo: Date.prototype.setFullYear()")}}

```js interactive-example
const event = new Date("August 19, 1975 23:15:30");

event.setFullYear(1969);

console.log(event.getFullYear());
// Expected output: 1969

event.setFullYear(0);

console.log(event.getFullYear());
// Expected output: 0
```

## Cú pháp

```js-nolint
setFullYear(yearValue)
setFullYear(yearValue, monthValue)
setFullYear(yearValue, monthValue, dateValue)
```

### Tham số

- `yearValue`
  - : Một số nguyên đại diện cho năm. Ví dụ, 1995.
- `monthValue` {{optional_inline}}
  - : Một số nguyên đại diện cho tháng: 0 cho tháng Giêng, 1 cho tháng Hai, v.v.
- `dateValue` {{optional_inline}}
  - : Một số nguyên từ 1 đến 31 đại diện cho ngày trong tháng. Nếu bạn chỉ định `dateValue`, bạn cũng phải chỉ định `monthValue`.

### Giá trị trả về

Thay đổi đối tượng {{jsxref("Date")}} tại chỗ và trả về [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) mới của nó. Nếu một tham số là `NaN` (hoặc các giá trị khác bị [ép buộc](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) thành `NaN`, chẳng hạn như `undefined`), ngày được đặt thành [Ngày không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date) và `NaN` được trả về.

## Mô tả

Nếu bạn không chỉ định các tham số `monthValue` và `dateValue`, các giá trị giống như những gì được trả về bởi {{jsxref("Date/getMonth", "getMonth()")}} và {{jsxref("Date/getDate", "getDate()")}} sẽ được sử dụng.

Nếu một tham số bạn chỉ định nằm ngoài phạm vi dự kiến, các tham số khác và thông tin ngày trong đối tượng {{jsxref("Date")}} sẽ được cập nhật tương ứng. Ví dụ, nếu bạn chỉ định 15 cho `monthValue`, năm sẽ được tăng thêm 1 (`yearValue + 1`), và 3 được sử dụng cho tháng.

Vì `setFullYear()` hoạt động theo giờ địa phương, việc vượt qua ranh giới Giờ tiết kiệm ánh sáng ban ngày (DST) có thể dẫn đến thời gian đã trôi qua khác với mong đợi. Ví dụ, nếu việc đặt ngày vượt qua một chuyển tiếp spring-forward (mất một giờ), sự chênh lệch timestamp giữa ngày mới và ngày cũ sẽ ít hơn một giờ so với chênh lệch ngày danh nghĩa nhân với 24 giờ. Ngược lại, việc vượt qua chuyển tiếp fall-back (thêm một giờ) sẽ dẫn đến thêm một giờ. Nếu bạn cần điều chỉnh ngày theo một lượng thời gian cố định, hãy cân nhắc sử dụng {{jsxref("Date/setUTCFullYear", "setUTCFullYear()")}} hoặc {{jsxref("Date/setTime", "setTime()")}}.

Nếu giờ địa phương mới nằm trong một chuyển tiếp offset, thời gian chính xác được suy ra bằng cách sử dụng hành vi giống như tùy chọn [`disambiguation: "compatible"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) của `Temporal`. Tức là, nếu giờ địa phương tương ứng với hai thời điểm, thời điểm trước đó sẽ được chọn; nếu giờ địa phương không tồn tại (có một khoảng trống), chúng ta tiến về phía trước theo khoảng thời gian của khoảng trống.

## Ví dụ

### Sử dụng setFullYear()

```js
const theBigDay = new Date();
theBigDay.setFullYear(1997);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Date.prototype.getUTCFullYear()")}}
- {{jsxref("Date.prototype.setUTCFullYear()")}}
- {{jsxref("Date.prototype.setYear()")}}
