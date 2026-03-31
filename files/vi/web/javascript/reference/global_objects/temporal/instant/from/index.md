---
title: Temporal.Instant.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Instant.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Instant.from()`** tạo một đối tượng `Temporal.Instant` mới từ đối tượng `Temporal.Instant` khác, hoặc một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.Instant.from(info)
```

### Tham số

- `info`
  - : Một trong các giá trị sau:
    - Một thực thể {{jsxref("Temporal.Instant")}}, tạo một bản sao của thực thể.
    - Một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant#rfc_9557_format) chứa ngày, giờ và độ lệch múi giờ. Tên múi giờ bị bỏ qua; chỉ độ lệch được sử dụng.

### Giá trị trả về

Một đối tượng `Temporal.Instant` mới biểu diễn thời điểm được chỉ định bởi `info`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu `info` không phải là thực thể `Temporal.Instant` hay chuỗi.
- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Chuỗi không phải là chuỗi RFC 9557 hợp lệ.
    - Thông tin không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, từ epoch Unix.

## Ví dụ

### Tạo một instant từ chuỗi

```js
const instant = Temporal.Instant.from("1970-01-01T00Z");
console.log(instant.toString()); // 1970-01-01T00:00:00Z

const instant2 = Temporal.Instant.from("1970-01-01T00+08:00");
console.log(instant2.toString()); // 1969-12-31T16:00:00Z

// America/New_York is UTC-5 in January 1970, not UTC+8
const instant3 = Temporal.Instant.from("1970-01-01T00+08:00[America/New_York]");
console.log(instant3.toString()); // 1969-12-31T16:00:00Z; the time zone name is ignored
```

### Tạo một instant từ instant khác

```js
const instant = Temporal.Instant.from("1970-01-01T00Z");
const instant2 = Temporal.Instant.from(instant);
console.log(instant2.toString()); // 1970-01-01T00:00:00Z
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}}
- {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}}
