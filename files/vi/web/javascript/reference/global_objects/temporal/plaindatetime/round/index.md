---
title: Temporal.PlainDateTime.prototype.round()
short-title: round()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/round
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.round
sidebar: jsref
---

Phương thức **`round()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này được làm tròn đến đơn vị đã cho.

## Cú pháp

```js-nolint
round(smallestUnit)
round(options)
```

### Tham số

- `smallestUnit`
  - : Một chuỗi đại diện cho tùy chọn [`smallestUnit`](#smallestunit_2). Đây là dạng viết tắt tiện lợi, vì vậy `round(smallestUnit)` tương đương với `round({ smallestUnit })`, trong đó `smallestUnit` là một chuỗi.
- `options`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `roundingIncrement` {{optional_inline}}
      - : Một số (được cắt bớt thành số nguyên) đại diện cho mức tăng làm tròn trong `smallestUnit` đã cho. Mặc định là `1`. Đối với tất cả các giá trị của `smallestUnit` ngoại trừ `"day"`, mức tăng phải là ước số của giá trị tối đa của đơn vị; ví dụ: nếu đơn vị là giờ, mức tăng phải là ước số của 24 và không được là 24, có nghĩa là nó có thể là 1, 2, 3, 4, 6, 8, hoặc 12. Đối với `"day"`, mức tăng phải là 1.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn phần thập phân của `smallestUnit`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"halfExpand"`.
    - `smallestUnit`
      - : Một chuỗi đại diện cho đơn vị nhỏ nhất để đưa vào đầu ra. Giá trị phải là một trong các giá trị sau: `"day"`, `"hour"`, `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, `"nanosecond"`, hoặc dạng số nhiều của chúng. Đối với các đơn vị lớn hơn `"nanosecond"`, các phần thập phân của `smallestUnit` sẽ được làm tròn theo cài đặt `roundingIncrement` và `roundingMode`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.PlainDateTime")}} mới đại diện cho ngày-giờ này được làm tròn đến đơn vị đã cho, trong đó tất cả các đơn vị nhỏ hơn `smallestUnit` được đặt về 0.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Làm tròn các đơn vị nhỏ

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56.123456789");
const nearestMillisecond = dt.round("millisecond");
console.log(nearestMillisecond.toString()); // 2021-07-01T12:34:56.123

const nearestHalfHour = dt.round({
  smallestUnit: "minute",
  roundingIncrement: 30,
});
console.log(nearestHalfHour.toString()); // 2021-07-01T12:30:00

const nextDay = dt.round({ smallestUnit: "day", roundingMode: "ceil" });
console.log(nextDay.toString()); // 2021-07-02T00:00:00
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
