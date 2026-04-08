---
title: Temporal.Instant.fromEpochMilliseconds()
short-title: fromEpochMilliseconds()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/fromEpochMilliseconds
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Instant.fromEpochMilliseconds
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Instant.fromEpochMilliseconds()`** tạo một đối tượng `Temporal.Instant` mới từ số mili giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC).

Để chuyển đổi đối tượng {{jsxref("Date")}} sang đối tượng `Temporal.Instant`, hãy sử dụng {{jsxref("Date.prototype.toTemporalInstant()")}} thay thế.

## Cú pháp

```js-nolint
Temporal.Instant.fromEpochMilliseconds(epochMilliseconds)
```

### Tham số

- `epochMilliseconds`
  - : Một số biểu diễn số mili giây kể từ epoch Unix. Trong nội bộ, nó được chuyển đổi thành BigInt và nhân với `1e6` để lấy số nano giây.

### Giá trị trả về

Một đối tượng `Temporal.Instant` mới biểu diễn thời điểm được chỉ định bởi `epochMilliseconds`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - `epochMilliseconds` không thể chuyển đổi thành BigInt (ví dụ: không phải số nguyên).
    - `epochMilliseconds` không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, từ epoch Unix.

## Ví dụ

### Sử dụng Temporal.Instant.fromEpochMilliseconds()

```js
const instant = Temporal.Instant.fromEpochMilliseconds(0);
console.log(instant.toString()); // 1970-01-01T00:00:00Z
const vostok1Liftoff = Temporal.Instant.fromEpochMilliseconds(-275248380000);
console.log(vostok1Liftoff.toString()); // 1961-04-12T06:07:00Z
const sts1Liftoff = Temporal.Instant.fromEpochMilliseconds(355924804000);
console.log(sts1Liftoff.toString()); // 1981-04-12T12:00:04Z
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/epochMilliseconds", "Temporal.Instant.prototype.epochMilliseconds")}}
- {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}
- {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}}
- {{jsxref("Date.prototype.toTemporalInstant()")}}
