---
title: Intl.RelativeTimeFormat.prototype.format()
short-title: format()
slug: Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/format
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.RelativeTimeFormat.format
sidebar: jsref
---

Phương thức **`format()`** của các instance {{jsxref("Intl.RelativeTimeFormat")}} định dạng `value` và `unit` theo locale và tùy chọn định dạng của đối tượng `Intl.RelativeTimeFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.RelativeTimeFormat.prototype.format()")}}

```js interactive-example
const rtf = new Intl.RelativeTimeFormat("en", { style: "short" });

console.log(rtf.format(3, "quarter"));
// Expected output: "in 3 qtrs."

console.log(rtf.format(-1, "day"));
// Expected output: "1 day ago"

console.log(rtf.format(10, "seconds"));
// Expected output: "in 10 sec."
```

## Cú pháp

```js-nolint
format(value, unit)
```

### Tham số

- `value`
  - : Giá trị số để dùng trong thông báo thời gian tương đối được quốc tế hóa.
- `unit`
  - : Đơn vị để dùng trong thông báo thời gian tương đối được quốc tế hóa. Các giá trị có thể là: `"year"`, `"quarter"`, `"month"`, `"week"`, `"day"`, `"hour"`, `"minute"`, `"second"`. Dạng số nhiều cũng được phép.

### Giá trị trả về

Chuỗi đại diện cho `value` và `unit` đã cho được định dạng theo locale và tùy chọn định dạng của đối tượng {{jsxref("Intl.RelativeTimeFormat")}} này.

> [!NOTE]
> Hầu hết thời gian, định dạng được trả về bởi `format()` là nhất quán. Tuy nhiên, đầu ra có thể thay đổi giữa các triển khai, ngay cả trong cùng một locale — các biến thể trong đầu ra là có chủ đích và được phép bởi đặc tả. Nó cũng có thể không phải những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng dấu cách không ngắt dòng hoặc được bao quanh bởi các ký tự kiểm soát hướng hai chiều. Bạn không nên so sánh kết quả của `format()` với các hằng số được mã hóa cứng.

## Ví dụ

### Sử dụng format cơ bản

Ví dụ sau đây cho thấy cách tạo bộ định dạng thời gian tương đối sử dụng ngôn ngữ tiếng Anh.

```js
// Create a relative time formatter in your locale
// with default values explicitly passed in.
const rtf = new Intl.RelativeTimeFormat("en", {
  localeMatcher: "best fit", // other values: "lookup"
  numeric: "always", // other values: "auto"
  style: "long", // other values: "short" or "narrow"
});

// Format relative time using negative value (-1).
rtf.format(-1, "day"); // "1 day ago"

// Format relative time using positive value (1).
rtf.format(1, "day"); // "in 1 day"
```

### Sử dụng tùy chọn auto

Nếu tùy chọn `numeric:auto` được truyền vào, nó sẽ tạo ra chuỗi `yesterday`, `today` hoặc `tomorrow` thay vì `1 day ago`, `in 0 days` hoặc `in 1 day`. Điều này cho phép không phải luôn sử dụng giá trị số trong đầu ra.

```js
// Create a relative time formatter in your locale
// with numeric: "auto" option value passed in.
const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });

// Format relative time using negative value (-1).
rtf.format(-1, "day"); // "yesterday"

rtf.format(0, "day"); // "today"

// Format relative time using positive day unit (1).
rtf.format(1, "day"); // "tomorrow"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.RelativeTimeFormat")}}
