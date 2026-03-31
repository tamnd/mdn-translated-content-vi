---
title: Temporal.Duration()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/Duration
page-type: javascript-constructor
browser-compat: javascript.builtins.Temporal.Duration.Duration
sidebar: jsref
---

Constructor **`Temporal.Duration()`** tạo các đối tượng {{jsxref("Temporal.Duration")}}.

Constructor này cho phép bạn tạo các instance bằng cách cung cấp trực tiếp dữ liệu cơ bản. Giống như tất cả các lớp `Temporal` khác, bạn thường nên xây dựng các đối tượng `Temporal.Duration` bằng phương thức tĩnh {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}, có thể xử lý nhiều loại đầu vào.

## Cú pháp

```js-nolint
new Temporal.Duration()
new Temporal.Duration(years)
new Temporal.Duration(years, months)
new Temporal.Duration(years, months, weeks)
new Temporal.Duration(years, months, weeks, days)
new Temporal.Duration(years, months, weeks, days, hours)
new Temporal.Duration(years, months, weeks, days, hours, minutes)
new Temporal.Duration(years, months, weeks, days, hours, minutes, seconds)
new Temporal.Duration(years, months, weeks, days, hours, minutes, seconds, milliseconds)
new Temporal.Duration(years, months, weeks, days, hours, minutes, seconds, milliseconds, microseconds)
new Temporal.Duration(years, months, weeks, days, hours, minutes, seconds, milliseconds, microseconds, nanoseconds)
```

> [!NOTE]
> `Temporal.Duration()` chỉ có thể được xây dựng với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `years` {{optional_inline}}
  - : Số năm, hoặc `undefined` (được coi là `0`).
- `months` {{optional_inline}}
  - : Số tháng, hoặc `undefined` (được coi là `0`).
- `weeks` {{optional_inline}}
  - : Số tuần, hoặc `undefined` (được coi là `0`).
- `days` {{optional_inline}}
  - : Số ngày, hoặc `undefined` (được coi là `0`).
- `hours` {{optional_inline}}
  - : Số giờ, hoặc `undefined` (được coi là `0`).
- `minutes` {{optional_inline}}
  - : Số phút, hoặc `undefined` (được coi là `0`).
- `seconds` {{optional_inline}}
  - : Số giây, hoặc `undefined` (được coi là `0`).
- `milliseconds` {{optional_inline}}
  - : Số mili giây, hoặc `undefined` (được coi là `0`).
- `microseconds` {{optional_inline}}
  - : Số micro giây, hoặc `undefined` (được coi là `0`).
- `nanoseconds` {{optional_inline}}
  - : Số nano giây, hoặc `undefined` (được coi là `0`).

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới, có thể [chưa cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing), với các thành phần đã chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Bất kỳ tham số nào không phải là số nguyên (bao gồm cả các giá trị không hữu hạn).
    - Một [đơn vị lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (năm, tháng, tuần) có giá trị tuyệt đối ≥ 2<sup>32</sup>.
    - Phần không lịch của duration (ngày và thấp hơn), khi được biểu diễn theo giây, có giá trị tuyệt đối ≥ 2<sup>53</sup>.

## Ví dụ

### Sử dụng Temporal.Duration()

```js
const d = new Temporal.Duration(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
console.log(d.toString()); // "P1Y2M3W4DT5H6M7.00800901S"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}
