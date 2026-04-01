---
title: Temporal.Duration.compare()
short-title: compare()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/compare
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Duration.compare
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Duration.compare()`** trả về một số (-1, 0 hoặc 1) cho biết duration đầu tiên ngắn hơn, bằng hay dài hơn duration thứ hai.

## Cú pháp

```js-nolint
Temporal.Duration.compare(duration1, duration2)
Temporal.Duration.compare(duration1, duration2, options)
```

### Tham số

- `duration1`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.Duration")}} đại diện cho duration đầu tiên cần so sánh. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng thuật toán giống như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `duration2`
  - : Duration thứ hai cần so sánh, được chuyển đổi thành đối tượng `Temporal.Duration` bằng thuật toán giống như `duration1`.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `relativeTo` {{optional_inline}}
      - : Một ngày(giờ) có múi giờ hoặc thuần túy cung cấp thông tin thời gian và lịch để giải quyết [duration lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (xem liên kết để biết cách giải thích chung của tùy chọn này). Bắt buộc nếu `duration1` hoặc `duration2` là duration lịch (trừ khi chúng bằng nhau theo thành phần, trong trường hợp đó `0` được trả về mà không cần tính toán).

### Giá trị trả về

Trả về `-1` nếu `duration1` ngắn hơn `duration2`, `0` nếu chúng bằng nhau, và `1` nếu `duration1` dài hơn `duration2`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `duration1` hoặc `duration2` là [duration lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (có `years`, `months` hoặc `weeks` khác không), và `relativeTo` không được cung cấp.

## Mô tả

Nếu `relativeTo` là một ngày-giờ có múi giờ, và `duration1` hoặc `duration2` là duration lịch, kết quả được tính bằng cách thêm các duration vào điểm bắt đầu, và sau đó so sánh các thời điểm kết quả. Nếu không, so sánh được thực hiện bằng cách chuyển đổi cả hai thành nano giây (giả sử ngày 24 giờ, và sử dụng lịch của `relativeTo` nếu cần) và so sánh kết quả.

## Ví dụ

### Sử dụng Temporal.Duration.compare()

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ minutes: 100 });
console.log(Temporal.Duration.compare(d1, d2)); // -1

const d3 = Temporal.Duration.from({ hours: 2 });
const d4 = Temporal.Duration.from({ minutes: 110 });
console.log(Temporal.Duration.compare(d3, d4)); // 1

const d5 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d6 = Temporal.Duration.from({ seconds: 5400 });
console.log(Temporal.Duration.compare(d5, d6)); // 0
```

### So sánh duration lịch

```js
const d1 = Temporal.Duration.from({ days: 31 });
const d2 = Temporal.Duration.from({ months: 1 });

console.log(
  Temporal.Duration.compare(d1, d2, {
    relativeTo: Temporal.PlainDate.from("2021-01-01"), // ISO 8601 calendar
  }),
); // 0

console.log(
  Temporal.Duration.compare(d1, d2, {
    relativeTo: Temporal.PlainDate.from("2021-02-01"), // ISO 8601 calendar
  }),
); // 1; February has 28 days
```

### Sử dụng relativeTo có múi giờ

Sử dụng `relativeTo` có múi giờ, bạn có thể tính đến cả thay đổi giờ mùa hè. Vào ngày `2024-11-03`, Mỹ chuyển từ giờ mùa hè sang giờ tiêu chuẩn, vì vậy ngày đó có 25 giờ vì đồng hồ được lùi lại 1 giờ.

```js
const d1 = Temporal.Duration.from({ days: 1 });
const d2 = Temporal.Duration.from({ hours: 24 });

console.log(
  Temporal.Duration.compare(d1, d2, {
    relativeTo: Temporal.ZonedDateTime.from(
      "2024-11-03T01:00-04:00[America/New_York]",
    ),
  }),
); // 1
```

### Sắp xếp một mảng duration

Mục đích của hàm `compare()` này là đóng vai trò như một bộ so sánh để truyền vào {{jsxref("Array.prototype.sort()")}} và các hàm liên quan.

```js
const durations = [
  Temporal.Duration.from({ hours: 1 }),
  Temporal.Duration.from({ hours: 2 }),
  Temporal.Duration.from({ hours: 1, minutes: 30 }),
  Temporal.Duration.from({ hours: 1, minutes: 45 }),
];

durations.sort(Temporal.Duration.compare);
console.log(durations.map((d) => d.toString()));
// [ 'PT1H', 'PT1H30M', 'PT1H45M', 'PT2H' ]
```

Truyền tùy chọn như sau:

```js
durations.sort((a, b) =>
  Temporal.Duration.compare(a, b, {
    relativeTo: Temporal.Now.zonedDateTimeISO(),
  }),
);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/subtract", "Temporal.Duration.prototype.subtract()")}}
