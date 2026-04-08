---
title: Temporal.Duration.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.add
sidebar: jsref
---

Phương thức **`add()`** của các instance {{jsxref("Temporal.Duration")}} trả về một đối tượng `Temporal.Duration` mới với tổng của duration này và một duration đã cho. Kết quả được [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing).

## Cú pháp

```js-nolint
add(other)
```

### Tham số

- `other`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.Duration")}} đại diện cho duration cần thêm vào duration này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng thuật toán giống như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới đại diện cho tổng của duration này và `other`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `this` hoặc `other` là [duration lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (có `years`, `months` hoặc `weeks` khác không), vì duration lịch là mơ hồ mà không có lịch và tham chiếu thời gian.
    - Tổng của `this` và `other` vượt quá hoặc dưới mức duration tối đa hoặc tối thiểu có thể biểu diễn, là ±2<sup>53</sup> giây.

## Mô tả

Duration không lịch biểu diễn một lượng thời gian cố định rõ ràng. Về mặt nội bộ, `this` và `other` đều được chuyển đổi thành nano giây (giả sử ngày 24 giờ) và cộng lại. Kết quả sau đó được chuyển đổi trở lại thành đối tượng `Temporal.Duration`, vì vậy kết quả luôn được [cân bằng hoặc nặng đầu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing) với đơn vị lớn nhất có thể là `days`.

Nếu bạn muốn thực hiện phép cộng hoặc trừ với duration lịch, bạn có thể thêm cả hai duration vào điểm bắt đầu và sau đó tính sự khác biệt giữa hai thời điểm kết quả; tức là, `dur1 + dur2` tương đương với `(start + dur1 + dur2) - start`.

Để thêm duration vào ngày hoặc giờ, hãy sử dụng phương thức `add()` của đối tượng ngày hoặc giờ thay thế.

## Ví dụ

### Sử dụng add()

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from({ hours: -1, minutes: -20 });

const d3 = d1.add(d2);
console.log(d3.toString()); // "PT10M"
```

### Cộng duration lịch

```js
const d1 = Temporal.Duration.from({ days: 1 });
const d2 = Temporal.Duration.from({ months: 1 });

d1.add(d2); // RangeError: for calendar duration arithmetic, use date arithmetic relative to a starting point

const start = Temporal.PlainDateTime.from("2022-01-01T00:00"); // ISO 8601 calendar
const result = start.add(d1).add(d2).since(start);
console.log(result.toString()); // "P32D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/subtract", "Temporal.Duration.prototype.subtract()")}}
