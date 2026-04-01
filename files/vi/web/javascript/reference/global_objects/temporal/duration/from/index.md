---
title: Temporal.Duration.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Duration.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Duration.from()`** tạo một đối tượng `Temporal.Duration` mới từ một đối tượng `Temporal.Duration` khác, một đối tượng có các thuộc tính duration, hoặc một chuỗi ISO 8601.

## Cú pháp

```js-nolint
Temporal.Duration.from(info)
```

### Tham số

- `info`
  - : Một trong các giá trị sau:
    - Một instance {{jsxref("Temporal.Duration")}}, tạo ra bản sao của instance đó.
    - Một chuỗi [ISO 8601](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#iso_8601_duration_format) đại diện cho duration.
    - Một đối tượng chứa ít nhất một trong các thuộc tính sau (theo thứ tự chúng được lấy và xác thực):
      - {{jsxref("Temporal/Duration/days", "days")}}
      - {{jsxref("Temporal/Duration/hours", "hours")}}
      - {{jsxref("Temporal/Duration/microseconds", "microseconds")}}
      - {{jsxref("Temporal/Duration/milliseconds", "milliseconds")}}
      - {{jsxref("Temporal/Duration/minutes", "minutes")}}
      - {{jsxref("Temporal/Duration/months", "months")}}
      - {{jsxref("Temporal/Duration/nanoseconds", "nanoseconds")}}
      - {{jsxref("Temporal/Duration/seconds", "seconds")}}
      - {{jsxref("Temporal/Duration/weeks", "weeks")}}
      - {{jsxref("Temporal/Duration/years", "years")}}

      Mỗi thuộc tính nên chứa một giá trị số nguyên. Duration kết quả không được có [dấu hỗn hợp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_sign), vì vậy tất cả các thuộc tính này phải có cùng dấu (hoặc bằng không). Các thuộc tính còn thiếu được coi là không.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới, có thể [chưa cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing), với các thành phần đã chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Bất kỳ thuộc tính nào được nhận dạng trong đối tượng `info` không phải là số nguyên (bao gồm cả các giá trị không hữu hạn).
    - Một [đơn vị lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (năm, tháng, tuần) có giá trị tuyệt đối ≥ 2<sup>32</sup>.
    - Phần không lịch của duration (ngày và thấp hơn), khi được biểu diễn theo giây, có giá trị tuyệt đối ≥ 2<sup>53</sup>.
- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng hoặc chuỗi.
    - Tất cả các thuộc tính được nhận dạng trong đối tượng `info` đều là `undefined`.

## Ví dụ

### Tạo duration từ đối tượng

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
console.log(d1.toString()); // "PT1H30M"

const d2 = Temporal.Duration.from({ months: 1, days: 2 });
console.log(d2.toString()); // "P1M2D"

// Uncommon because unbalanced, but valid
const unbalanced = Temporal.Duration.from({
  hours: 100,
  minutes: 100,
  seconds: 100,
});
console.log(unbalanced.toString()); // "PT100H100M100S"

const neg = Temporal.Duration.from({ hours: -1, minutes: -30 });
console.log(neg.toString()); // "-PT1H30M"
```

### Tạo duration từ chuỗi

```js
const d = Temporal.Duration.from("P1Y2M3W4DT5H6M7.00800901S");
console.log(d.hours); // 5
```

### Tạo duration từ một duration khác

```js
const d1 = Temporal.Duration.from({ hours: 1, minutes: 30 });
const d2 = Temporal.Duration.from(d1);
console.log(d2.toString()); // "PT1H30M"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/Duration", "Temporal.Duration()")}}
- {{jsxref("Temporal/Duration/with", "Temporal.Duration.prototype.with()")}}
