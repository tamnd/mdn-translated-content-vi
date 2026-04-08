---
title: Temporal.ZonedDateTime.prototype.since()
short-title: since()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/since
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.since
sidebar: jsref
---

Phương thức **`since()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu thị khoảng thời gian từ một ngày-giờ khác (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}) đến ngày-giờ này. Khoảng thời gian là dương nếu ngày-giờ kia trước ngày-giờ này, và âm nếu sau.

Phương thức này thực hiện `this - other`. Để thực hiện `other - this`, hãy sử dụng phương thức {{jsxref("Temporal/ZonedDateTime/until", "until()")}}.

## Cú pháp

```js-nolint
since(other)
since(other, options)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.ZonedDateTime")}} biểu thị ngày-giờ cần trừ khỏi ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.ZonedDateTime` bằng cùng thuật toán như {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}. Nó phải có cùng lịch với `this`.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}, bao gồm `largestUnit`, `roundingIncrement`, `roundingMode` và `smallestUnit`. `largestUnit` và `smallestUnit` chấp nhận tất cả các đơn vị có thể. Đối với `largestUnit`, giá trị mặc định `"auto"` có nghĩa là `"hours"` hoặc `smallestUnit`, tùy cái nào lớn hơn. Đối với `smallestUnit`, giá trị mặc định là `"nanoseconds"`. Ngày hiện tại được sử dụng làm tùy chọn `relativeTo`. Lưu ý rằng sử dụng [các đơn vị lớn hơn `"hours"`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) có thể làm cho khoảng thời gian không thể chuyển đổi sang các lịch, ngày hoặc múi giờ khác.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới biểu thị khoảng thời gian _kể từ_ `other` đến ngày-giờ này. Khoảng thời gian là dương nếu `other` trước ngày-giờ này, và âm nếu sau.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `other` có lịch khác với `this`.
    - Bất kỳ tùy chọn nào không hợp lệ.
    - `other` có múi giờ khác với `this`, và `largestUnit` là `"days"` hoặc lớn hơn.

## Mô tả

Khoảng thời gian trả về là khoảng thời gian "hybrid". Điều này có nghĩa là phần ngày của khoảng thời gian biểu thị các ngày lịch đầy đủ như {{jsxref("Temporal/PlainDateTime/since", "Temporal.PlainDateTime.prototype.since()")}} sẽ trả về, trong khi phần giờ của nó biểu thị thời gian thực đã trôi qua như {{jsxref("Temporal/Instant/since", "Temporal.Instant.prototype.since()")}} sẽ trả về. Cách tiếp cận "hybrid duration" này tự động điều chỉnh theo DST và phù hợp với các tiêu chuẩn ngành được áp dụng rộng rãi như [RFC 5545 (iCalendar)](https://datatracker.ietf.org/doc/html/rfc5545). Xem bên dưới để biết các ví dụ.

## Ví dụ

### Chuyển đổi offset

Khi xảy ra chuyển đổi, một ngày có thể không có đúng 24 giờ.

```js
const start = Temporal.ZonedDateTime.from(
  "2024-11-03T01:00:00-04:00[America/New_York]",
);
const end = Temporal.ZonedDateTime.from(
  "2024-11-04T01:00:00-05:00[America/New_York]",
);
console.log(end.since(start).toString()); // PT25H
console.log(end.since(start, { largestUnit: "days" }).toString()); // PT1D

const start2 = Temporal.ZonedDateTime.from(
  "2024-03-10T01:00:00-05:00[America/New_York]",
);
const end2 = Temporal.ZonedDateTime.from(
  "2024-03-11T01:00:00-04:00[America/New_York]",
);
console.log(end2.since(start2).toString()); // PT23H
console.log(end2.since(start2, { largestUnit: "days" }).toString()); // PT1D
```

Vì lý do này, khoảng thời gian trả về mặc định hoàn toàn dựa trên thời gian mà không có phần ngày, để tránh nhầm lẫn.

### Múi giờ khác nhau

Phần giờ của khoảng thời gian trả về hoàn toàn dựa trên các thời điểm và không bị ảnh hưởng bởi múi giờ. Tuy nhiên, nếu bạn muốn bao gồm bất kỳ đơn vị ngày nào như `day`, thì điểm bắt đầu và kết thúc phải ở cùng múi giờ.

```js
const start = Temporal.ZonedDateTime.from(
  "2024-11-03T01:00:00-04:00[America/New_York]",
);
// Peru does not use DST so its offset remains -05:00 year-round
const end = Temporal.ZonedDateTime.from(
  "2024-11-04T01:00:00-05:00[America/Lima]",
);

end.since(start); // PT25H
end.since(start, { largestUnit: "days" }); // RangeError: time zones "America/Lima" and "America/New_York" aren't compatible

end.withTimeZone("America/New_York").since(start, { largestUnit: "days" }); // P1D
end.since(start.withTimeZone("America/Lima"), { largestUnit: "days" }); // P1D1H
```

Để biết thêm ví dụ về cách sử dụng `since()`, đặc biệt với làm tròn, xem {{jsxref("Temporal/PlainDate/since", "Temporal.PlainDate.prototype.since()")}} và {{jsxref("Temporal/PlainTime/since", "Temporal.PlainTime.prototype.since()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/subtract", "Temporal.ZonedDateTime.prototype.subtract()")}}
- {{jsxref("Temporal/ZonedDateTime/until", "Temporal.ZonedDateTime.prototype.until()")}}
