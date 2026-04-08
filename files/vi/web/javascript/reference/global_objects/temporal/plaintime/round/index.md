---
title: Temporal.PlainTime.prototype.round()
short-title: round()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/round
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.round
sidebar: jsref
---

Phương thức **`round()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này được làm tròn đến đơn vị nhất định.

## Cú pháp

```js-nolint
round(smallestUnit)
round(options)
```

### Tham số

- `smallestUnit`
  - : Một chuỗi đại diện cho tùy chọn [`smallestUnit`](#smallestunit_2). Đây là dạng rút gọn tiện lợi, vì vậy `round(smallestUnit)` tương đương với `round({ smallestUnit })`, trong đó `smallestUnit` là một chuỗi.
- `options`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `roundingIncrement` {{optional_inline}}
      - : Một số (cắt thành số nguyên) đại diện cho bước làm tròn trong `smallestUnit` đã cho. Mặc định là `1`. Bước phải là ước số của giá trị tối đa của `smallestUnit`; ví dụ, nếu đơn vị là giờ, bước phải là ước số của 24 và không được là 24 chính nó, nghĩa là có thể là 1, 2, 3, 4, 6, 8 hoặc 12.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn phần thập phân của `smallestUnit`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"halfExpand"`.
    - `smallestUnit`
      - : Một chuỗi đại diện cho đơn vị nhỏ nhất cần đưa vào kết quả. Giá trị phải là một trong những giá trị sau: `"hour"`, `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, `"nanosecond"`, hoặc dạng số nhiều của chúng. Đối với các đơn vị lớn hơn `"nanosecond"`, các phần thập phân của `smallestUnit` sẽ được làm tròn theo các cài đặt `roundingIncrement` và `roundingMode`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.PlainTime")}} mới đại diện cho thời gian này được làm tròn đến đơn vị nhất định, trong đó tất cả các đơn vị nhỏ hơn `smallestUnit` đều được đặt về 0.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Làm tròn các đơn vị nhỏ

```js
const time = Temporal.PlainTime.from("12:34:56.123456789");
const nearestMillisecond = time.round("millisecond");
console.log(nearestMillisecond.toString()); // 12:34:56.123

const nearestHalfHour = time.round({
  smallestUnit: "minute",
  roundingIncrement: 30,
});
console.log(nearestHalfHour.toString()); // 12:30:00

const nextHour = time.round({ smallestUnit: "hour", roundingMode: "ceil" });
console.log(nextHour.toString()); // 13:00:00
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
