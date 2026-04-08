---
title: Temporal.Instant.prototype.since()
short-title: since()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/since
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.since
sidebar: jsref
---

Phương thức **`since()`** của các instance {{jsxref("Temporal.Instant")}} trả về một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian từ một instant khác (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}) đến instant này. Duration là dương nếu instant kia nằm trước instant này, và âm nếu nằm sau.

Phương thức này thực hiện `this - other`. Để thực hiện `other - this`, hãy sử dụng phương thức {{jsxref("Temporal/Instant/until", "until()")}}.

## Cú pháp

```js-nolint
since(other)
since(other, options)
```

### Tham số

- `other`
  - : Một chuỗi hoặc instance {{jsxref("Temporal.Instant")}} biểu diễn một instant để trừ khỏi instant này. Nó được chuyển đổi thành đối tượng `Temporal.Instant` bằng cùng thuật toán như {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn cho {{jsxref("Temporal/Duration/round", "Temporal.Duration.prototype.round()")}}, bao gồm `largestUnit`, `roundingIncrement`, `roundingMode`, và `smallestUnit`. `largestUnit` và `smallestUnit` chỉ chấp nhận các đơn vị: `"hours"`, `"minutes"`, `"seconds"`, `"milliseconds"`, `"microseconds"`, `"nanoseconds"`, hoặc dạng số ít của chúng. Đối với `largestUnit`, giá trị mặc định `"auto"` có nghĩa là `"seconds"` hoặc `smallestUnit`, tùy cái nào lớn hơn. Đối với `smallestUnit`, giá trị mặc định là `"nanoseconds"`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Duration")}} mới biểu diễn khoảng thời gian _kể từ_ `other` đến instant này. Duration là dương nếu `other` nằm trước instant này, và âm nếu nằm sau.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Sử dụng since()

```js
const lastUpdated = Temporal.Instant.fromEpochMilliseconds(1735235418000);
const now = Temporal.Now.instant();
const duration = now.since(lastUpdated, { smallestUnit: "minute" });
console.log(`Last updated ${duration.toLocaleString("en-US")} ago`);
```

### Cân bằng duration kết quả

Vì một instant không mang thông tin lịch, duration kết quả tránh các [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations), vốn mơ hồ khi không có lịch và tham chiếu thời gian. Do đó, kết quả [không được cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing) vì `hours` có thể lớn hơn `24`. Để cân bằng duration, hãy [làm tròn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/round) duration kết quả lại với `largestUnit` mong muốn, truyền `relativeTo` mang thông tin lịch.

```js
const lastUpdated = Temporal.Instant.fromEpochMilliseconds(1735235418000);
const now = Temporal.Now.instant();
const duration = now.since(lastUpdated, { smallestUnit: "minutes" });
const roundedDuration = duration.round({
  largestUnit: "years",
  // Sử dụng lịch ISO; bạn có thể chuyển đổi sang lịch khác bằng
  // withCalendar()
  relativeTo: now.toZonedDateTimeISO("UTC"),
});
console.log(`Last updated ${roundedDuration.toLocaleString("en-US")} ago`);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Instant/add", "Temporal.Instant.prototype.add()")}}
- {{jsxref("Temporal/Instant/subtract", "Temporal.Instant.prototype.subtract()")}}
- {{jsxref("Temporal/Instant/until", "Temporal.Instant.prototype.until()")}}
