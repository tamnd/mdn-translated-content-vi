---
title: Temporal.Instant.prototype.round()
short-title: round()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/round
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.round
sidebar: jsref
---

Phương thức **`round()`** của các thực thể {{jsxref("Temporal.Instant")}} trả về một đối tượng `Temporal.Instant` mới biểu diễn instant này được làm tròn đến đơn vị đã cho.

## Cú pháp

```js-nolint
round(smallestUnit)
round(options)
```

### Tham số

- `smallestUnit`
  - : Một chuỗi biểu diễn tùy chọn [`smallestUnit`](#smallestunit_2). Đây là cú pháp tắt, vì vậy `round(smallestUnit)` tương đương với `round({ smallestUnit })`, trong đó `smallestUnit` là một chuỗi.
- `options`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `roundingIncrement` {{optional_inline}}
      - : Một số (được cắt bỏ thành số nguyên) biểu diễn mức tăng làm tròn theo `smallestUnit` đã cho. Mặc định là `1`. Mức tăng và `smallestUnit` phải chia đều 24 giờ; ví dụ: 45 giây là ước số của 86400 giây, và 100 phút là ước số của 3600 phút. Điều này ít nghiêm ngặt hơn một chút so với phương thức `round()` của các lớp khác, tất cả đều yêu cầu mức tăng là ước số của giá trị tối đa của đơn vị.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn phần phân số của `smallestUnit`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"halfExpand"`.
    - `smallestUnit`
      - : Một chuỗi biểu diễn đơn vị nhỏ nhất cần đưa vào đầu ra. Giá trị phải là một trong các giá trị sau: `"hour"`, `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, `"nanosecond"`, hoặc dạng số nhiều của chúng. Đối với các đơn vị lớn hơn `"nanosecond"`, các phần phân số của `smallestUnit` sẽ được làm tròn theo cài đặt `roundingIncrement` và `roundingMode`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Instant")}} mới biểu diễn instant này được làm tròn đến đơn vị đã cho, trong đó tất cả các đơn vị nhỏ hơn `smallestUnit` đều bị đặt về không.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Làm tròn các đơn vị nhỏ

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1000);
const roundedInstant = instant.round("second");
console.log(roundedInstant.epochMilliseconds); // 1000

const instant2 = instant.round("minute");
console.log(instant2.epochMilliseconds); // 0
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
