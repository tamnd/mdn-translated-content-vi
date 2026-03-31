---
title: Intl.RelativeTimeFormat
slug: Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat
page-type: javascript-class
browser-compat: javascript.builtins.Intl.RelativeTimeFormat
sidebar: jsref
---

Đối tượng **`Intl.RelativeTimeFormat`** cho phép định dạng thời gian tương đối theo ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.RelativeTimeFormat")}}

```js interactive-example
const rtf1 = new Intl.RelativeTimeFormat("en", { style: "short" });

console.log(rtf1.format(3, "quarter"));
// Expected output: "in 3 qtrs."

console.log(rtf1.format(-1, "day"));
// Expected output: "1 day ago"

const rtf2 = new Intl.RelativeTimeFormat("es", { numeric: "auto" });

console.log(rtf2.format(2, "day"));
// Expected output: "pasado mañana"
```

## Hàm khởi tạo

- {{jsxref("Intl/RelativeTimeFormat/RelativeTimeFormat", "Intl.RelativeTimeFormat()")}}
  - : Tạo một đối tượng `Intl.RelativeTimeFormat` mới.

## Phương thức tĩnh

- {{jsxref("Intl/RelativeTimeFormat/supportedLocalesOf", "Intl.RelativeTimeFormat.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các locale được cung cấp mà được hỗ trợ mà không phải dùng locale mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.RelativeTimeFormat.prototype` và dùng chung cho tất cả các instance `Intl.RelativeTimeFormat`.

- {{jsxref("Object/constructor", "Intl.RelativeTimeFormat.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng instance. Với các instance `Intl.RelativeTimeFormat`, giá trị khởi tạo là hàm khởi tạo {{jsxref("Intl/RelativeTimeFormat/RelativeTimeFormat", "Intl.RelativeTimeFormat")}}.
- `Intl.RelativeTimeFormat.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.RelativeTimeFormat"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/RelativeTimeFormat/format", "Intl.RelativeTimeFormat.prototype.format()")}}
  - : Định dạng `value` và `unit` theo locale và tùy chọn định dạng của đối tượng `Intl.RelativeTimeFormat` đã cho.
- {{jsxref("Intl/RelativeTimeFormat/formatToParts", "Intl.RelativeTimeFormat.prototype.formatToParts()")}}
  - : Trả về một {{jsxref("Array")}} các đối tượng đại diện cho định dạng thời gian tương đối theo từng phần, có thể dùng để định dạng theo locale tùy chỉnh.
- {{jsxref("Intl/RelativeTimeFormat/resolvedOptions", "Intl.RelativeTimeFormat.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh locale và tùy chọn định dạng được tính toán trong quá trình khởi tạo đối tượng.

## Ví dụ

### Sử dụng format cơ bản

Ví dụ sau đây cho thấy cách sử dụng bộ định dạng thời gian tương đối cho ngôn ngữ tiếng Anh.

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

### Sử dụng formatToParts

Ví dụ sau đây cho thấy cách tạo bộ định dạng thời gian tương đối trả về các phần được định dạng.

```js
const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });

// Format relative time using the day unit.
rtf.formatToParts(-1, "day");
// [{ type: "literal", value: "yesterday"}]

rtf.formatToParts(100, "day");
// [
//   { type: "literal", value: "in " },
//   { type: "integer", value: "100", unit: "day" },
//   { type: "literal", value: " days" }
// ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.RelativeTimeFormat` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-relativetimeformat/)
- {{jsxref("Intl")}}
- [`Intl.RelativeTimeFormat`](https://v8.dev/features/intl-relativetimeformat) trên v8.dev (2018)
