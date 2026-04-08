---
title: Temporal.ZonedDateTime.prototype.day
short-title: day
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/day
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Temporal.ZonedDateTime.day
sidebar: jsref
---

Thuộc tính accessor **`day`** của các instance {{jsxref("Temporal.ZonedDateTime")}} trả về một số nguyên dương biểu diễn chỉ số ngày dựa trên 1 trong tháng của ngày này, đó là số ngày bạn sẽ thấy trên lịch. Giá trị này phụ thuộc vào [calendar](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#calendars).

Set accessor của `day` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp. Hãy dùng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}} để tạo một đối tượng `Temporal.ZonedDateTime` mới với giá trị mong muốn.

Để biết thêm thông tin chung và ví dụ, hãy xem {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}.

Đối với `PlainDate`, `day` chỉ có thể không liên tục nếu calendar bỏ qua các ngày. Đối với `ZonedDateTime`, `day` cũng có thể không liên tục nếu múi giờ thay đổi offset của nó 24 giờ; điều này thực sự đã xảy ra. Xem ví dụ bên dưới.

## Ví dụ

### Sử dụng day

```js
const dt = Temporal.ZonedDateTime.from("2021-07-01[America/New_York]"); // ISO 8601 calendar
console.log(dt.day); // 1
```

### Ngày không liên tục

Để phù hợp hơn với các đối tác thương mại ở châu Á, đất nước Samoa [đã thay đổi múi giờ](https://en.wikipedia.org/wiki/Time_in_Samoa) sang phía bên kia của Đường Đổi Ngày Quốc Tế, dịch chuyển offset của mình từ -10:00 sang +14:00 (giờ mùa hè). Điều này dẫn đến một sự thay đổi đột ngột 24 giờ trong giờ địa phương, do đó bỏ qua hoàn toàn ngày 30 tháng 12 năm 2011. `2011-12-29T23:59:59-10:00[Pacific/Apia]` ngay lập tức được tiếp nối bởi `2011-12-31T00:00:00+14:00[Pacific/Apia]`.

```js
const dt = Temporal.ZonedDateTime.from(
  "2011-12-29T23:59:59-10:00[Pacific/Apia]",
);
console.log(dt.day); // 29
const nextDay = dt.add({ seconds: 1 });
console.log(nextDay.day); // 31
```

Vì lý do này, bạn nên luôn ưu tiên {{jsxref("Temporal/ZonedDateTime/add", "add()")}} và {{jsxref("Temporal/ZonedDateTime/subtract", "subtract()")}} để thao tác ngày và giờ, thay vì thay đổi trực tiếp thuộc tính `day`.

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/year", "Temporal.ZonedDateTime.prototype.year")}}
- {{jsxref("Temporal/ZonedDateTime/month", "Temporal.ZonedDateTime.prototype.month")}}
- {{jsxref("Temporal/ZonedDateTime/daysInMonth", "Temporal.ZonedDateTime.prototype.daysInMonth")}}
- {{jsxref("Temporal/ZonedDateTime/dayOfWeek", "Temporal.ZonedDateTime.prototype.dayOfWeek")}}
- {{jsxref("Temporal/ZonedDateTime/dayOfYear", "Temporal.ZonedDateTime.prototype.dayOfYear")}}
- {{jsxref("Temporal/PlainDate/day", "Temporal.PlainDate.prototype.day")}}
