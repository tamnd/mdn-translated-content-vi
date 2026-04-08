---
title: Temporal.Instant.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.add
sidebar: jsref
---

Phương thức **`add()`** của các thực thể {{jsxref("Temporal.Instant")}} trả về một đối tượng `Temporal.Instant` mới biểu diễn instant này tiến về phía trước một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

## Cú pháp

```js-nolint
add(duration)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.Duration")}} biểu diễn khoảng thời gian cần thêm vào instant này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Instant")}} mới biểu diễn việc thêm `duration` vào instant này. Nếu `duration` là dương, thì instant được trả về muộn hơn instant này; nếu `duration` là âm, thì instant được trả về sớm hơn instant này.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - `duration` là [khoảng thời gian theo lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (nó có `years`, `months`, hoặc `weeks` khác không), hoặc có `days` khác không, vì khoảng thời gian theo lịch là mơ hồ mà không có lịch và tham chiếu thời gian.
    - Kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, từ epoch Unix.

## Mô tả

Về bản chất, phương thức `add()` trước tiên lấy số nano giây được biểu diễn bởi `duration`, cộng nó vào {{jsxref("Temporal/Instant/epochNanoseconds", "epochNanoseconds")}} của instant này, sau đó tạo một đối tượng `Temporal.Instant` mới từ kết quả. Do đó, khoảng thời gian phải biểu diễn một lượng thời gian cố định một cách rõ ràng.

Nếu bạn muốn thêm một khoảng thời gian theo lịch, việc cộng phải được thực hiện trong ngữ cảnh của lịch và múi giờ để tính đến độ dài thay đổi của các tháng, năm và ngày (do giờ tiết kiệm ánh sáng ban ngày). Trong trường hợp này, hãy chuyển đổi instant thành đối tượng {{jsxref("Temporal.ZonedDateTime")}}, thêm khoảng thời gian, sau đó chuyển đổi kết quả trở lại thành instant.

Thêm một khoảng thời gian tương đương với việc [trừ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant/subtract) [giá trị phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó.

## Ví dụ

### Thêm một Temporal.Duration

```js
const instant = Temporal.Instant.fromEpochMilliseconds(0);
const duration = Temporal.Duration.from("PT1S");
const newInstant = instant.add(duration);
console.log(newInstant.epochMilliseconds); // 1000
```

### Thêm một đối tượng hoặc chuỗi

```js
const instant = Temporal.Instant.fromEpochMilliseconds(0);
const newInstant = instant.add({ seconds: 1 });
console.log(newInstant.epochMilliseconds); // 1000

const newInstant2 = instant.add("PT1S");
console.log(newInstant2.epochMilliseconds); // 1000
```

### Thêm một khoảng thời gian theo lịch

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1730610000000);
const duration = Temporal.Duration.from({ days: 1 });

// This instant is 2024-11-03T01:00:00-04:00[America/New_York],
// which is a DST transition day in the US.
const instant2 = instant
  .toZonedDateTimeISO("America/New_York")
  .add(duration)
  .toInstant();
console.log(instant2.epochMilliseconds); // 1730700000000

// The same instant is not a DST transition day in Paris.
const instant3 = instant
  .toZonedDateTimeISO("Europe/Paris")
  .add(duration)
  .toInstant();
console.log(instant3.epochMilliseconds); // 1730696400000
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Instant/subtract", "Temporal.Instant.prototype.subtract()")}}
