---
title: Intl.DurationFormat.prototype.format()
short-title: format()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/format
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DurationFormat.format
sidebar: jsref
---

Phương thức **`format()`** của các instance {{jsxref("Intl.DurationFormat")}} định dạng một thời lượng theo ngôn ngữ và các tùy chọn định dạng của đối tượng {{jsxref("Intl.DurationFormat")}} này.

## Cú pháp

```js-nolint
format(duration)
```

### Tham số

- `duration`
  - : Đối tượng thời lượng cần được định dạng. Nó nên bao gồm một số hoặc tất cả các thuộc tính sau: `years`, `months`, `weeks`, `days`, `hours`, `minutes`, `seconds`, `milliseconds`, `microseconds`, `nanoseconds`. Giá trị của mỗi thuộc tính phải là số nguyên, và dấu của chúng phải nhất quán. Đây có thể là đối tượng {{jsxref("Temporal.Duration")}}; xem tài liệu {{jsxref("Temporal.Duration")}} để biết thêm thông tin về các thuộc tính này.

### Giá trị trả về

Một chuỗi biểu diễn `duration` đã cho được định dạng theo ngôn ngữ và các tùy chọn định dạng của đối tượng {{jsxref("Intl.DurationFormat")}} này.

> [!NOTE]
> Trong hầu hết trường hợp, định dạng được trả về bởi `format()` là nhất quán. Tuy nhiên, đầu ra có thể thay đổi giữa các triển khai, ngay cả trong cùng một ngôn ngữ — các biến thể đầu ra là theo thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `format()` với các hằng số được mã cứng.

## Ví dụ

### Sử dụng format()

Ví dụ sau cho thấy cách tạo một bộ định dạng Duration sử dụng ngôn ngữ tiếng Anh.

```js
const duration = {
  years: 1,
  months: 2,
  weeks: 3,
  days: 3,
  hours: 4,
  minutes: 5,
  seconds: 6,
  milliseconds: 7,
  microseconds: 8,
  nanoseconds: 9,
};

// Without options, style defaults to "short"
new Intl.DurationFormat("en").format(duration);
// "1 yr, 2 mths, 3 wks, 3 days, 4 hr, 5 min, 6 sec, 7 ms, 8 μs, 9 ns"

// With style set to "long"
new Intl.DurationFormat("en", { style: "long" }).format(duration);
// "1 year, 2 months, 3 weeks, 3 days, 4 hours, 5 minutes, 6 seconds, 7 milliseconds, 8 microseconds, 9 nanoseconds"

// With style set to "narrow"
new Intl.DurationFormat("en", { style: "narrow" }).format(duration);
// "1y 2mo 3w 3d 4h 5m 6s 7ms 8μs 9ns"
```

### Sử dụng format() với các ngôn ngữ và kiểu khác nhau

```js
const duration = {
  hours: 1,
  minutes: 46,
  seconds: 40,
};

// With style set to "long" and locale "fr-FR"
new Intl.DurationFormat("fr-FR", { style: "long" }).format(duration);
// "1 heure, 46 minutes et 40 secondes"

// With style set to "short" and locale set to "en"
new Intl.DurationFormat("en", { style: "short" }).format(duration);
// "1 hr, 46 min and 40 sec"

// With style set to "short" and locale set to "pt"
new Intl.DurationFormat("pt", { style: "narrow" }).format(duration);
// "1 h 46 min 40 s"

// With style set to "digital" and locale set to "en"
new Intl.DurationFormat("en", { style: "digital" }).format(duration);
// "1:46:40"

// With style set to "digital", locale set to "en", and hours set to "long"
new Intl.DurationFormat("en", { style: "digital", hours: "long" }).format(
  duration,
);
// "1 hour, 46:40"
```

### Sử dụng format() với tùy chọn fractionalDigits

```js
const duration = {
  hours: 11,
  minutes: 30,
  seconds: 12,
  milliseconds: 345,
  microseconds: 600,
};

new Intl.DurationFormat("en", { style: "digital" }).format(duration);
// "11:30:12.3456"

new Intl.DurationFormat("en", { style: "digital", fractionalDigits: 5 }).format(
  duration,
);
// "11:30:12.34560"

new Intl.DurationFormat("en", { style: "digital", fractionalDigits: 3 }).format(
  duration,
);
// "11:30:12.346"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Temporal.Duration")}}
