---
title: Temporal.ZonedDateTime.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.add
sidebar: jsref
---

Phương thức **`add()`** của các instance {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu diễn ngày-giờ này được tiến lên một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

## Cú pháp

```js-nolint
add(duration)
add(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.Duration")}} biểu diễn khoảng thời gian cần cộng vào ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [cắt bớt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) về phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới biểu diễn ngày-giờ được xác định bởi `ZonedDateTime` gốc, cộng thêm khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), tức là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, tính từ Unix epoch.

## Mô tả

Để biết cách các [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) được cộng, hãy xem {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}.

Phép cộng và trừ được thực hiện theo các quy tắc được định nghĩa trong [RFC 5545 (iCalendar)](https://datatracker.ietf.org/doc/html/rfc5545):

- Cộng/trừ phần ngày của duration bằng phép toán lịch; nói cách khác, cộng phần ngày vào `PlainDateTime` của nó bằng {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}, rồi diễn giải kết quả trong cùng múi giờ. Kết quả sẽ tự động điều chỉnh theo giờ mùa hè (DST) bằng các quy tắc của trường `timeZone` của instance này. Ví dụ, `2024-11-03T01:00:00-04:00[America/New_York]` cộng thêm một ngày là `2024-11-04T01:00:00-05:00[America/New_York]`, như thể ngày đó có 25 giờ.
  - Nếu ngày-giờ [mơ hồ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) hoặc không hợp lệ do chuyển đổi offset múi giờ, nó được giải quyết bằng hành vi `disambiguation: "compatible"`: instant muộn hơn trong hai instant có thể sẽ được dùng cho các chuyển đổi bỏ qua thời gian và instant sớm hơn trong hai instant có thể sẽ được dùng cho các chuyển đổi lặp lại thời gian. Ví dụ, `2024-03-09T02:05:00-05:00[America/New_York]` cộng thêm một ngày được cho là `2024-03-10T02:05:00-05:00[America/New_York]`, nhưng thời điểm này không tồn tại, vì vậy giờ đồng hồ treo tường một giờ sau đó, `2024-03-10T03:05:00-04:00[America/New_York]`, được trả về.
  - Nếu [offset mơ hồ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#offset_ambiguity), nó được giải quyết bằng hành vi `offset: "prefer"`: offset được sử dụng nếu nó hợp lệ cho múi giờ và giờ địa phương, và được tính lại nếu không. Ví dụ, `2024-11-02T01:00:00-04:00[America/New_York]` cộng thêm một ngày là `2024-11-03T01:00:00-04:00[America/New_York]`, trong khi `2024-11-04T01:00:00-05:00[America/New_York]` trừ một ngày là `2024-11-03T01:00:00-05:00[America/New_York]`.
  - Nếu các thành phần ngày-giờ kết quả vượt quới giới hạn, chúng được giải quyết bằng tùy chọn `overflow`. Ví dụ, `2024-08-31` cộng thêm một tháng là `2024-09-31` không tồn tại, vì vậy nó được cắt bớt thành `2024-09-30` theo mặc định.
- Cộng/trừ phần thời gian của duration bằng thời gian thực tế; nói cách khác, cộng phần thời gian vào `Instant` của nó bằng {{jsxref("Temporal/Instant/add", "Temporal.Instant.prototype.add()")}}, rồi diễn giải kết quả trong cùng múi giờ. Ví dụ, `2024-11-03T01:00:00-04:00[America/New_York]` cộng thêm một giờ là `2024-11-03T01:00:00-05:00[America/New_York]`.

Các quy tắc này làm cho phép toán với `Temporal.ZonedDateTime` "an toàn DST", nghĩa là kết quả phù hợp nhất với kỳ vọng của cả người dùng thực tế và những người triển khai các ứng dụng lịch tuân thủ tiêu chuẩn khác. Những kỳ vọng này bao gồm:

- Cộng hoặc trừ ngày nên giữ nhất quán giờ đồng hồ qua các chuyển đổi DST. Ví dụ, nếu bạn có một cuộc hẹn vào thứ Bảy lúc 1:00 chiều và bạn muốn dời lịch sang 1 ngày sau, bạn kỳ vọng cuộc hẹn được dời vẫn là lúc 1:00 chiều, ngay cả khi có chuyển đổi DST qua đêm.
- Cộng hoặc trừ phần thời gian của duration nên bỏ qua các chuyển đổi DST. Ví dụ, một người bạn bạn đã nhờ gặp trong 2 giờ nữa sẽ bực bội nếu bạn đến 1 giờ hoặc 3 giờ sau. Nên có một thứ tự hoạt động nhất quán và tương đối dễ đoán.
- Nếu kết quả ở gần hoặc tại một chuyển đổi DST, các trường hợp mơ hồ nên được xử lý tự động (không bị crash) và mang tính xác định.

Cộng một duration tương đương với [trừ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/subtract) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó.

## Ví dụ

### Cộng một duration

```js
const start = Temporal.ZonedDateTime.from(
  "2021-11-01T12:34:56-04:00[America/New_York]",
);
const end = start.add({
  years: 1,
  months: 2,
  weeks: 3,
  days: 4,
  hours: 5,
  minutes: 6,
  seconds: 7,
  milliseconds: 8,
});
console.log(end.toString()); // 2023-01-26T17:41:03.008-05:00[America/New_York]
```

Để xem thêm ví dụ, đặc biệt là cách các calendar khác nhau và tùy chọn `overflow` tương tác với calendar duration, hãy xem {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
