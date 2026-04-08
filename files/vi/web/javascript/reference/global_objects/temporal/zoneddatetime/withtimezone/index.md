---
title: Temporal.ZonedDateTime.prototype.withTimeZone()
short-title: withTimeZone()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/withTimeZone
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.withTimeZone
sidebar: jsref
---

Phương thức **`withTimeZone()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị cùng thời điểm như ngày-giờ này nhưng trong múi giờ mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho thuộc tính {{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}} của ngày-giờ.

Để thay thế các thuộc tính thành phần ngày-giờ, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/with", "with()")}}. Để thay thế lịch của nó, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/withCalendar", "withCalendar()")}}.

## Cú pháp

```js-nolint
withTimeZone(timeZone)
```

### Tham số

- `timeZone`
  - : Một chuỗi hoặc một thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu thị múi giờ cần sử dụng. Nếu là thực thể `Temporal.ZonedDateTime`, múi giờ của nó được sử dụng. Nếu là chuỗi, nó có thể là định danh múi giờ được đặt tên, định danh múi giờ offset, hoặc chuỗi ngày-giờ chứa định danh múi giờ hoặc offset (xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới biểu thị cùng thời điểm như ngày-giờ này nhưng trong múi giờ mới.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `timeZone` không phải là chuỗi hoặc thực thể `Temporal.ZonedDateTime`.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu tên múi giờ không hợp lệ.

## Ví dụ

### Sử dụng withTimeZone()

```js
const meetingTime = Temporal.ZonedDateTime.from(
  "2021-08-01T12:00[America/New_York]",
);
const meetingTimeInParis = meetingTime.withTimeZone("Europe/Paris");
console.log(meetingTimeInParis.toString()); // 2021-08-01T18:00:00+02:00[Europe/Paris]
```

### Thay thế múi giờ trong khi giữ nguyên giờ đồng hồ

Trong trường hợp hiếm khi bạn muốn giữ nguyên giờ đồng hồ nhưng thay đổi múi giờ (và kết quả là một thời điểm khác), hãy chuyển đổi sang {{jsxref("Temporal.PlainDateTime")}} trước:

```js
const meetingTime = Temporal.ZonedDateTime.from(
  "2021-08-01T12:00[America/New_York]",
);
const meetingTimeInParis = meetingTime
  .toPlainDateTime()
  .toZonedDateTime("Europe/Paris");
console.log(meetingTimeInParis.toString()); // 2021-08-01T12:00:00+02:00[Europe/Paris]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/withCalendar", "Temporal.ZonedDateTime.prototype.withCalendar()")}}
- {{jsxref("Temporal/ZonedDateTime/withPlainTime", "Temporal.ZonedDateTime.prototype.withPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
- {{jsxref("Temporal/ZonedDateTime/timeZoneId", "Temporal.ZonedDateTime.prototype.timeZoneId")}}
