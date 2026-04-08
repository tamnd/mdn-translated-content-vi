---
title: Temporal.Duration.prototype.round()
short-title: round()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/round
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.round
sidebar: jsref
---

Phương thức **`round()`** của các instance {{jsxref("Temporal.Duration")}} trả về một đối tượng `Temporal.Duration` mới với duration được làm tròn đến đơn vị nhỏ nhất đã cho và/hoặc [cân bằng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#duration_balancing) đến đơn vị lớn nhất đã cho.

## Cú pháp

```js-nolint
round(smallestUnit)
round(options)
```

### Tham số

- `smallestUnit`
  - : Một chuỗi đại diện cho tùy chọn [`smallestUnit`](#smallestunit_2). Đây là cú pháp tắt tiện lợi, vì vậy `round(smallestUnit)` tương đương với `round({ smallestUnit })`, trong đó `smallestUnit` là một chuỗi.
- `options`
  - : Một đối tượng chứa một số hoặc tất cả các thuộc tính sau (theo thứ tự chúng được truy xuất và xác thực):
    - `largestUnit` {{optional_inline}}
      - : Bất kỳ đơn vị thời gian nào: `"years"`, `"months"`, `"weeks"`, `"days"`, `"hours"`, `"minutes"`, `"seconds"`, `"milliseconds"`, `"microseconds"`, `"nanoseconds"`, hoặc các dạng số ít của chúng, hoặc giá trị `"auto"` có nghĩa là thành phần khác không lớn nhất của duration này hoặc `smallestUnit`, tùy theo cái nào lớn hơn. Mặc định là `"auto"`. Kết quả sẽ không chứa các đơn vị lớn hơn đơn vị này; ví dụ, nếu đơn vị lớn nhất là `"minutes"`, thì "1 giờ 30 phút" sẽ trở thành "90 phút".
    - `relativeTo` {{optional_inline}}
      - : Một ngày/giờ có múi hoặc đơn giản cung cấp thông tin thời gian và lịch để giải quyết [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (xem liên kết để biết cách diễn giải chung của tùy chọn này). Bắt buộc nếu `this` hoặc `other` là calendar duration, hoặc `smallestUnit` là một đơn vị lịch.
    - `roundingIncrement` {{optional_inline}}
      - : Một số (được cắt bỏ thành số nguyên) đại diện cho bước làm tròn trong `smallestUnit` đã cho. Mặc định là `1`. Phải nằm trong khoảng từ 1 đến 1e9, bao gồm cả hai đầu. Nếu đơn vị nhỏ nhất là giờ, phút, giây, millisecond, microsecond, hoặc nanosecond, bước tăng phải là ước số của giá trị tối đa của đơn vị; ví dụ, nếu đơn vị là giờ, bước tăng phải là ước số của 24 và không được là 24 chính nó, nghĩa là có thể là 1, 2, 3, 4, 6, 8, hoặc 12.
    - `roundingMode` {{optional_inline}}
      - : Một chuỗi đại diện cho chế độ làm tròn, xác định cách làm tròn lên hoặc xuống trong các tình huống khác nhau. Xem [`Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#roundingmode). Mặc định là `"halfExpand"`.
    - `smallestUnit` {{optional_inline}}
      - : Bất kỳ đơn vị thời gian nào: `"years"`, `"months"`, `"weeks"`, `"days"`, `"hours"`, `"minutes"`, `"seconds"`, `"milliseconds"`, `"microseconds"`, `"nanoseconds"`, hoặc các dạng số ít của chúng. Mặc định là `"nanoseconds"`. Đối với các đơn vị lớn hơn `"nanoseconds"`, phần phân số của `smallestUnit` sẽ được làm tròn theo cài đặt `roundingIncrement` và `roundingMode`. Phải nhỏ hơn hoặc bằng `largestUnit`. Ít nhất một trong `smallestUnit` và `largestUnit` phải được cung cấp.

### Giá trị trả về

Một đối tượng `Temporal.Duration` mới, trong đó đơn vị lớn nhất không lớn hơn tùy chọn `largestUnit`, và đơn vị nhỏ nhất không nhỏ hơn tùy chọn `smallestUnit`. Các phần phân số của `smallestUnit` được làm tròn theo cài đặt `roundingIncrement` và `roundingMode`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu bất kỳ tùy chọn nào không hợp lệ.

## Mô tả

Phương thức `round()` thực hiện hai thao tác: làm tròn và cân bằng. Nó thực hiện như sau:

1. Đảm bảo duration được cân bằng. Nếu một thành phần vượt quá giá trị tối đa ưu tiên của nó (24 giờ mỗi ngày, 60 phút mỗi giờ, v.v.), phần dư được chuyển lên đơn vị lớn hơn tiếp theo, cho đến khi đạt `largestUnit`. Ví dụ, "24 giờ 90 phút" trở thành "25 giờ 30 phút" nếu `largestUnit` là `"auto"`, và "1 ngày 1 giờ 30 phút" nếu `largestUnit` là `"days"`.
2. Đối với tất cả các thành phần lớn hơn `largestUnit`, chúng được chuyển xuống `largestUnit`; ví dụ, "2 giờ 30 phút" trở thành "150 phút" nếu `largestUnit` là `"minutes"`.
3. Đối với tất cả các thành phần nhỏ hơn `smallestUnit`, chúng được chuyển lên `smallestUnit` như một phần phân số, và sau đó được làm tròn theo cài đặt `roundingIncrement` và `roundingMode`. Ví dụ, "1 giờ 30 phút" trở thành "1.5 giờ" nếu `smallestUnit` là `"hours"`, sau đó được làm tròn thành "2 giờ" với cài đặt mặc định.

[Đơn vị lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) có độ dài không đều. Độ dài của chúng được giải quyết tương đối với một điểm bắt đầu. Ví dụ, một duration "2 năm" trong lịch Gregorian có thể dài 730 hoặc 731 ngày, tùy thuộc vào liệu nó có đi qua năm nhuận hay không. Khi làm tròn đến một đơn vị lịch, trước tiên ta lấy ngày/giờ chính xác được biểu diễn bởi `relativeTo + duration`, sau đó làm tròn xuống và lên theo `smallestUnit` và `roundingIncrement` để lấy hai ứng viên. Sau đó, ta chọn ứng viên theo cài đặt `roundingMode`, và cuối cùng trừ `relativeTo` để lấy duration cuối cùng.

## Ví dụ

### Làm tròn bỏ đơn vị nhỏ

```js
const duration = Temporal.Duration.from({ hours: 1, minutes: 30, seconds: 15 });
const roundedDuration = duration.round("minutes");
console.log(roundedDuration.toString()); // "PT1H30M"
```

### Tránh các đơn vị lớn hơn

```js
const duration = Temporal.Duration.from({
  days: 3,
  hours: 1,
  minutes: 41,
  seconds: 5,
});
const roundedDuration = duration.round({ largestUnit: "hours" });
console.log(
  `Time spent on this problem: ${roundedDuration.toLocaleString("en-US", { style: "digital" })}`,
);
// Time spent on this problem: 73:41:05
```

### Làm tròn đến số giờ nguyên

```js
const duration = Temporal.Duration.from({ days: 1, hours: 1, minutes: 30 });
const roundedDuration = duration.round({
  largestUnit: "hours",
  smallestUnit: "hours",
  roundingMode: "floor",
});
console.log(roundedDuration.hours); // 25
```

### Làm tròn theo bước 15 phút

```js
const duration = Temporal.Duration.from({ hours: 1, minutes: 17 });
const roundedDuration = duration.round({
  smallestUnit: "minutes",
  roundingIncrement: 15,
});
console.log(
  `The queue will take approximately ${roundedDuration.toLocaleString("en-US")}`,
);
// The queue will take approximately 1 hr, 15 min
```

### Giải quyết calendar duration

Nếu duration ban đầu hoặc đơn vị lớn nhất/nhỏ nhất chứa đơn vị lịch, bạn phải cung cấp tùy chọn `relativeTo` để giải quyết calendar duration.

```js
const duration = Temporal.Duration.from({ months: 1, days: 1, hours: 1 });
const roundedDuration = duration.round({
  largestUnit: "days",
  smallestUnit: "days",
  relativeTo: Temporal.PlainDateTime.from("2022-01-01"),
});
console.log(roundedDuration); // "P32D"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/total", "Temporal.Duration.prototype.total()")}}
