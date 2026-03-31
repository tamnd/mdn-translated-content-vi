---
title: Intl.DurationFormat
slug: Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat
page-type: javascript-class
browser-compat: javascript.builtins.Intl.DurationFormat
sidebar: jsref
---

Đối tượng **`Intl.DurationFormat`** cho phép định dạng thời lượng nhạy cảm ngôn ngữ.

## Constructor

- {{jsxref("Intl/DurationFormat/DurationFormat", "Intl.DurationFormat()")}}
  - : Tạo một đối tượng `Intl.DurationFormat` mới.

## Phương thức tĩnh

- {{jsxref("Intl/DurationFormat/supportedLocalesOf", "Intl.DurationFormat.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các ngôn ngữ được hỗ trợ trong số các ngôn ngữ đã cung cấp mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.DurationFormat.prototype` và được chia sẻ bởi tất cả các instance `Intl.DurationFormat`.

- {{jsxref("Object/constructor", "Intl.DurationFormat.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Intl.DurationFormat`, giá trị khởi tạo là constructor {{jsxref("Intl/DurationFormat/DurationFormat", "Intl.DurationFormat")}}.
- `Intl.DurationFormat.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.DurationFormat"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/DurationFormat/format", "Intl.DurationFormat.prototype.format()")}}
  - : Hàm getter định dạng một thời lượng theo ngôn ngữ và các tùy chọn định dạng của đối tượng `DurationFormat` này.
- {{jsxref("Intl/DurationFormat/formatToParts", "Intl.DurationFormat.prototype.formatToParts()")}}
  - : Trả về một {{jsxref("Array")}} các đối tượng biểu diễn thời lượng được định dạng theo từng phần.
- {{jsxref("Intl/DurationFormat/resolvedOptions", "Intl.DurationFormat.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn ngôn ngữ và định dạng được tính toán trong quá trình khởi tạo đối tượng.

## Ví dụ

### Sử dụng Intl.DurationFormat

Các ví dụ bên dưới cho thấy cách sử dụng đối tượng `Intl.DurationFormat` để định dạng một đối tượng thời lượng với các ngôn ngữ và kiểu khác nhau.

```js
const duration = {
  hours: 1,
  minutes: 46,
  seconds: 40,
};

// With style set to "long" and locale "fr-FR"
new Intl.DurationFormat("fr-FR", { style: "long" }).format(duration);
// "1 heure, 46 minutes et 40 secondes"

// With style set to "short" and locale "en"
new Intl.DurationFormat("en", { style: "short" }).format(duration);
// "1 hr, 46 min and 40 sec"

// With style set to "narrow" and locale "pt"
new Intl.DurationFormat("pt", { style: "narrow" }).format(duration);
// "1 h 46 min 40 s"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.DurationFormat` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-durationformat/)
- {{jsxref("Intl")}}
- {{jsxref("Temporal/Duration/toLocaleString", "Temporal.Duration.prototype.toLocaleString()")}}
