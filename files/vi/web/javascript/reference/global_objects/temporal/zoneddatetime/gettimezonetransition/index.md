---
title: Temporal.ZonedDateTime.prototype.getTimeZoneTransition()
short-title: getTimeZoneTransition()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/getTimeZoneTransition
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.getTimeZoneTransition
sidebar: jsref
---

Phương thức **`getTimeZoneTransition()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về đối tượng {{jsxref("Temporal.ZonedDateTime")}} biểu thị thời điểm gần nhất sau hoặc trước thời điểm này mà tại đó offset UTC của múi giờ thay đổi (thời điểm trả về là thời điểm đầu tiên sau khi thay đổi), hoặc `null` nếu không có chuyển đổi nào như vậy. Điều này hữu ích để tìm hiểu các quy tắc offset của múi giờ, chẳng hạn như mô hình giờ tiết kiệm ánh sáng ban ngày (DST).

Lưu ý rằng các thời điểm trả về liên quan đến tương lai có thể không đáng tin cậy, ví dụ do thay đổi định nghĩa múi giờ.

## Cú pháp

```js-nolint
getTimeZoneTransition(direction)
getTimeZoneTransition(options)
```

### Tham số

- `direction`
  - : Một chuỗi biểu thị tùy chọn [`direction`](#direction_2). Đây là dạng overload tiện lợi, vì vậy `getTimeZoneTransition(direction)` tương đương với `getTimeZoneTransition({ direction })`, trong đó `direction` là chuỗi.
- `options`
  - : Một đối tượng chứa thuộc tính sau:
    - `direction`
      - : Tìm kiếm trước hay sau thời điểm hiện tại. Phải là `"next"` hoặc `"previous"`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} với thời điểm `t`, sao cho:

- Offset múi giờ tại `t` khác với offset một nano giây trước `t`.
- `t < this.epochNanoseconds` nếu `direction` là `"previous"`, hoặc `t > this.epochNanoseconds` nếu `direction` là `"next"`.
- Với tất cả các thời điểm giữa `this.epochNanoseconds` và `t`, ngoại trừ hai đầu, offset là hằng số.

Nếu không có chuyển đổi nào như vậy, trả về `null`.

## Ví dụ

### Tìm chuyển đổi múi giờ tiếp theo

```js
const dt = Temporal.ZonedDateTime.from("2024-01-01T00-05:00[America/New_York]");
const transition = dt.getTimeZoneTransition("next");
console.log(transition.toString()); // "2024-03-10T03:00:00-04:00[America/New_York]"

const transition2 = transition.getTimeZoneTransition("next");
console.log(transition2.toString()); // "2024-11-03T01:00:00-05:00[America/New_York]"

const transition3 = dt.getTimeZoneTransition("previous");
console.log(transition3.toString()); // "2023-11-05T01:00:00-05:00[America/New_York]"

const dt2 = Temporal.ZonedDateTime.from("2024-01-01T00Z[UTC]");
console.log(dt2.getTimeZoneTransition("next")); // null
```

## Thông số kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/with", "Temporal.ZonedDateTime.prototype.with()")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/timeZoneId", "Temporal.ZonedDateTime.prototype.timeZoneId")}}
- {{jsxref("Temporal/ZonedDateTime/offset", "Temporal.ZonedDateTime.prototype.offset")}}
