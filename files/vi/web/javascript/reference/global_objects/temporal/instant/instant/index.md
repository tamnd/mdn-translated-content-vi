---
title: Temporal.Instant()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/Instant
page-type: javascript-constructor
status:
  - experimental
browser-compat: javascript.builtins.Temporal.Instant.Instant
sidebar: jsref
---

{{SeeCompatTable}}

Constructor **`Temporal.Instant()`** tạo các đối tượng {{jsxref("Temporal.Instant")}}.

Constructor này hoàn toàn tương đương với việc gọi {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}}.

## Cú pháp

```js-nolint
new Temporal.Instant(epochNanoseconds)
```

> [!NOTE]
> `Temporal.Instant()` chỉ có thể được khởi tạo bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó mà không có `new` sẽ ném ra {{jsxref("TypeError")}}.

### Tham số

- `epochNanoseconds`
  - : Một [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) biểu diễn số nano giây kể từ epoch Unix.

### Giá trị trả về

Một đối tượng `Temporal.Instant` mới biểu diễn thời điểm được chỉ định bởi `epochNanoseconds`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu `epochNanoseconds` biểu diễn một instant nằm ngoài phạm vi của các instant có thể biểu diễn, là ±10<sup>8</sup> ngày, hoặc khoảng ±273.972,6 năm, từ epoch Unix.

## Ví dụ

### Sử dụng Temporal.Instant()

```js
const instant = new Temporal.Instant(0n);
console.log(instant.toString()); // 1970-01-01T00:00:00Z
const vostok1Liftoff = new Temporal.Instant(-275248380000000000n);
console.log(vostok1Liftoff.toString()); // 1961-04-12T06:07:00Z
const sts1Liftoff = new Temporal.Instant(355924804000000000n);
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
- {{jsxref("Temporal/Instant/fromEpochNanoseconds", "Temporal.Instant.fromEpochNanoseconds()")}}
