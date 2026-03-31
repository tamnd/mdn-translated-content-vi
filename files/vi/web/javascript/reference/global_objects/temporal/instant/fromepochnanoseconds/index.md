---
title: Temporal.Instant.fromEpochNanoseconds()
short-title: fromEpochNanoseconds()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/fromEpochNanoseconds
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Instant.fromEpochNanoseconds
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Instant.fromEpochNanoseconds()`** tạo một đối tượng `Temporal.Instant` mới từ số nano giây kể từ epoch Unix (nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC).

Để chuyển đổi đối tượng {{jsxref("Date")}} sang đối tượng `Temporal.Instant`, hãy sử dụng {{jsxref("Date.prototype.toTemporalInstant()")}} thay thế.

## Cú pháp

```js-nolint
Temporal.Instant.fromEpochNanoseconds(epochNanoseconds)
```

### Tham số

- `epochNanoseconds`
  - : Một [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) biểu diễn số nano giây kể từ epoch Unix.

### Giá trị trả về

Một đối tượng `Temporal.Instant` mới biểu diễn thời điểm được chỉ định bởi `epochNanoseconds`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `epochNanoseconds` không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, từ epoch Unix.

## Ví dụ

### Sử dụng Temporal.Instant.fromEpochNanoseconds()

```js
const instant = Temporal.Instant.fromEpochNanoseconds(0n);
console.log(instant.toString()); // 1970-01-01T00:00:00Z
const vostok1Liftoff =
  Temporal.Instant.fromEpochNanoseconds(-275248380000000000n);
console.log(vostok1Liftoff.toString()); // 1961-04-12T06:07:00Z
const sts1Liftoff = Temporal.Instant.fromEpochNanoseconds(355924804000000000n);
console.log(sts1Liftoff.toString()); // 1981-04-12T12:00:04Z
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/epochNanoseconds", "Temporal.Instant.prototype.epochNanoseconds")}}
- {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}
- {{jsxref("Temporal/Instant/fromEpochMilliseconds", "Temporal.Instant.fromEpochMilliseconds()")}}
- {{jsxref("Date.prototype.toTemporalInstant()")}}
