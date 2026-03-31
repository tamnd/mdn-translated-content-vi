---
title: Temporal.ZonedDateTime.prototype.round()
short-title: round()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/round
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.round
sidebar: jsref
---

Phương thức **`round()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được làm tròn đến đơn vị đã cho.

## Cú pháp

```js-nolint
round(smallestUnit)
round(options)
```

### Tham số

- `smallestUnit`
  - : Một chuỗi biểu thị tùy chọn [`smallestUnit`](#smallestunit_2). Đây là một overload tiện lợi, vì vậy `round(smallestUnit)` tương đương với `round({ smallestUnit })`, trong đó `smallestUnit` là một chuỗi.
- `options`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `roundingIncrement` {{optional_inline}}
      - : Một số (cắt cụt thành số nguyên) biểu thị bước làm tròn trong `smallestUnit` đã cho. Mặc định là `1`. Đối với tất cả các giá trị của `smallestUnit` ngoại trừ `"day"`, bước tăng phải là ước số của giá trị tối đa của đơn vị; ví dụ, nếu đơn vị là giờ, bước tăng phải là ước số của 24 và không được là 24, có nghĩa là có thể là 1, 2, 3, 4, 6, 8 hoặc 12. Đối với `"day"`, bước tăng phải là 1.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi chỉ định cách làm tròn phần thập phân của `smallestUnit`. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"halfExpand"`.
    - `smallestUnit`
      - : Một chuỗi biểu thị đơn vị nhỏ nhất cần đưa vào đầu ra. Giá trị phải là một trong các giá trị sau: `"day"`, `"hour"`, `"minute"`, `"second"`, `"millisecond"`, `"microsecond"`, `"nanosecond"`, hoặc dạng số nhiều của chúng. Đối với các đơn vị lớn hơn `"nanosecond"`, các phần thập phân của `smallestUnit` sẽ được làm tròn theo cài đặt `roundingIncrement` và `roundingMode`.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.ZonedDateTime")}} mới biểu thị ngày-giờ này được làm tròn đến đơn vị đã cho, trong đó tất cả các đơn vị nhỏ hơn `smallestUnit` đều được đặt về 0.

Nếu `smallestUnit` là `"day"`, ngày-giờ trả về sẽ là [đầu ngày](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/startOfDay) của ngày này hoặc ngày hôm sau, tùy thuộc vào `roundingMode` và khoảng cách đến hai thời điểm này. Ngược lại, việc làm tròn trước tiên được thực hiện trên `PlainDateTime` của nó (giống như {{jsxref("Temporal/PlainDateTime/round", "Temporal.PlainDateTime.prototype.round()")}}), sau đó được diễn giải lại trong cùng múi giờ, với `disambiguation: "compatible", offset: "prefer"`. Xem [tính mơ hồ và khoảng trống từ giờ địa phương đến giờ UTC](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#ambiguity_and_gaps_from_local_time_to_utc_time) và [tính mơ hồ của offset](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#offset_ambiguity).

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Ví dụ

### Làm tròn các đơn vị nhỏ

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.123456789[America/New_York]",
);
const nearestMillisecond = zdt.round("millisecond");
console.log(nearestMillisecond.toString()); // 2021-07-01T12:34:56.123-04:00[America/New_York]

const nearestHalfHour = zdt.round({
  smallestUnit: "minute",
  roundingIncrement: 30,
});
console.log(nearestHalfHour.toString()); // 2021-07-01T12:30:00-04:00[America/New_York]

const nextDay = zdt.round({ smallestUnit: "day", roundingMode: "ceil" });
console.log(nextDay.toString()); // 2021-07-02T00:00:00-04:00[America/New_York]
```

### Tính mơ hồ sau khi làm tròn

Có thể ngày-giờ đã làm tròn không rõ ràng trong múi giờ đã cho. Tính mơ hồ luôn được giải quyết bằng `disambiguation: "compatible", offset: "prefer"`. Đây là ví dụ nhanh:

```js
const zdt = Temporal.ZonedDateTime.from(
  "2024-03-10T01:00:00-05:00[America/New_York]",
);
const rounded = zdt.round({ smallestUnit: "hour", roundingIncrement: 2 });
// The result is supposed to be 2024-03-10T02:00:00-05:00[America/New_York],
// but this time does not exist. `disambiguation: "compatible"` tells us to move
// forward by 1 hour.
console.log(rounded.toString()); // 2024-03-10T03:00:00-04:00[America/New_York]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
