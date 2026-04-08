---
title: Temporal.PlainDate.prototype.toZonedDateTime()
short-title: toZonedDateTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toZonedDateTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toZonedDateTime
sidebar: jsref
---

Phương thức **`toZonedDateTime()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng {{jsxref("Temporal.ZonedDateTime")}} mới đại diện cho ngày này, một thời gian được cung cấp và một múi giờ được cung cấp, trong cùng hệ thống lịch.

## Cú pháp

```js-nolint
toZonedDateTime(timeZone)
toZonedDateTime(info)
```

### Tham số

- `timeZone`
  - : Một chuỗi hoặc instance {{jsxref("Temporal.ZonedDateTime")}} đại diện cho tùy chọn [`timeZone`](#timezone_2). Đây là overload tiện lợi, do đó `toZonedDateTime(timeZone)` tương đương với `toZonedDateTime({ timeZone })`, trong đó `timeZone` là chuỗi hoặc {{jsxref("Temporal.ZonedDateTime")}}. Overload này được chọn khi tham số đầu tiên không phải là đối tượng, hoặc thuộc tính `timeZone` của đối tượng là `undefined` (vì các instance `ZonedDateTime` có thuộc tính {{jsxref("Temporal/ZonedDateTime/timeZoneId", "timeZoneId")}} thay thế).
- `info`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
    - `plainTime` {{optional_inline}}
      - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.PlainTime")}} đại diện cho thành phần thời gian của `ZonedDateTime` kết quả. Nó được chuyển đổi thành đối tượng `Temporal.PlainTime` bằng cùng thuật toán như {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}. Mặc định là thời điểm hợp lệ đầu tiên trong múi giờ này vào ngày lịch này, thường là `"00:00:00"`, nhưng có thể khác nếu, ví dụ, giờ tiết kiệm ánh sáng ban ngày bỏ qua nửa đêm.
    - `timeZone`
      - : Một chuỗi hoặc instance {{jsxref("Temporal.ZonedDateTime")}} đại diện cho múi giờ cần sử dụng. Nếu là instance `Temporal.ZonedDateTime`, múi giờ của nó được sử dụng. Nếu là chuỗi, có thể là định danh múi giờ có tên, định danh múi giờ offset, hoặc chuỗi ngày-giờ chứa định danh múi giờ hoặc offset (xem [múi giờ và offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) để biết thêm thông tin).

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới đại diện cho ngày và thời gian được xác định bởi ngày này, `plainTime` và `timeZone`, được diễn giải trong hệ thống lịch của ngày này.

Trong trường hợp có [sự mơ hồ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time), hành vi `compatible` luôn được sử dụng: nếu thời gian rơi vào khoảng trống, chúng ta tiến về phía trước theo độ dài khoảng trống; nếu thời gian rơi vào sự mơ hồ, chúng ta chọn khả năng sớm hơn trong hai. Điều này có nghĩa là `ZonedDateTime` kết quả có thể có ngày hoặc thời gian khác so với đầu vào.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `timeZone` không phải là chuỗi hoặc instance `Temporal.ZonedDateTime`.
- {{jsxref("RangeError")}}
  - : Ném ra nếu `timeZone` là chuỗi không phải là định danh múi giờ hợp lệ.

## Ví dụ

### Sử dụng toZonedDateTime()

```js
const summer = Temporal.PlainDate.from("2021-07-01");
// Chỉ múi giờ
const summerTime = summer.toZonedDateTime("America/New_York");
console.log(summerTime.toString()); // 2021-07-01T00:00:00-04:00[America/New_York]

const winter = Temporal.PlainDate.from("2021-01-01");
// Múi giờ và thời gian
const winterTime = winter.toZonedDateTime({
  plainTime: "12:34:56",
  timeZone: "America/New_York",
});
console.log(winterTime.toString()); // 2021-01-01T12:34:56-05:00[America/New_York]

const spring = Temporal.PlainDate.from("2021-03-01");
// Múi giờ dạng đối tượng và thời gian dạng đối tượng
const springTime = spring.toZonedDateTime({
  plainTime: summerTime.toPlainTime(),
  timeZone: winterTime,
});
console.log(springTime.toString()); // 2021-03-01T00:00:00-05:00[America/New_York]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainDate/toPlainDateTime", "Temporal.PlainDate.prototype.toPlainDateTime()")}}
- {{jsxref("Temporal/PlainDate/toPlainMonthDay", "Temporal.PlainDate.prototype.toPlainMonthDay()")}}
- {{jsxref("Temporal/PlainDate/toPlainYearMonth", "Temporal.PlainDate.prototype.toPlainYearMonth()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainDate", "Temporal.ZonedDateTime.prototype.toPlainDate()")}}
