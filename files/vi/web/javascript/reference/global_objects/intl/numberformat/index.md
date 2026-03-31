---
title: Intl.NumberFormat
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat
page-type: javascript-class
browser-compat: javascript.builtins.Intl.NumberFormat
sidebar: jsref
---

Đối tượng **`Intl.NumberFormat`** cho phép định dạng số theo ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.NumberFormat")}}

```js interactive-example
const number = 123456.789;

console.log(
  new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(
    number,
  ),
);
// Expected output: "123.456,79 €"

// The Japanese yen doesn't use a minor unit
console.log(
  new Intl.NumberFormat("ja-JP", { style: "currency", currency: "JPY" }).format(
    number,
  ),
);
// Expected output: "￥123,457"

// Limit to three significant digits
console.log(
  new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 3 }).format(
    number,
  ),
);
// Expected output: "1,23,000"
```

## Hàm khởi tạo

- {{jsxref("Intl/NumberFormat/NumberFormat", "Intl.NumberFormat()")}}
  - : Tạo một đối tượng `NumberFormat` mới.

## Phương thức tĩnh

- {{jsxref("Intl/NumberFormat/supportedLocalesOf", "Intl.NumberFormat.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các locale được cung cấp mà được hỗ trợ mà không phải dùng locale mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.NumberFormat.prototype` và dùng chung cho tất cả các instance `Intl.NumberFormat`.

- {{jsxref("Object/constructor", "Intl.NumberFormat.prototype.constructor")}}
  - : Hàm khởi tạo đã tạo ra đối tượng instance. Với các instance `Intl.NumberFormat`, giá trị khởi tạo là hàm khởi tạo {{jsxref("Intl/NumberFormat/NumberFormat", "Intl.NumberFormat")}}.
- `Intl.NumberFormat.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.NumberFormat"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/NumberFormat/format", "Intl.NumberFormat.prototype.format()")}}
  - : Hàm getter định dạng một số theo locale và tùy chọn định dạng của đối tượng `Intl.NumberFormat` này.
- {{jsxref("Intl/NumberFormat/formatRange", "Intl.NumberFormat.prototype.formatRange()")}}
  - : Hàm getter định dạng một khoảng số theo locale và tùy chọn định dạng của đối tượng `Intl.NumberFormat` mà phương thức được gọi từ đó.
- {{jsxref("Intl/NumberFormat/formatRangeToParts", "Intl.NumberFormat.prototype.formatRangeToParts()")}}
  - : Trả về một {{jsxref("Array")}} các đối tượng đại diện cho khoảng chuỗi số theo từng phần, có thể dùng để định dạng theo locale tùy chỉnh.
- {{jsxref("Intl/NumberFormat/formatToParts", "Intl.NumberFormat.prototype.formatToParts()")}}
  - : Trả về một {{jsxref("Array")}} các đối tượng đại diện cho chuỗi số theo từng phần, có thể dùng để định dạng theo locale tùy chỉnh.
- {{jsxref("Intl/NumberFormat/resolvedOptions", "Intl.NumberFormat.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh locale và tùy chọn sắp xếp được tính toán trong quá trình khởi tạo đối tượng.

## Ví dụ

### Sử dụng cơ bản

Khi dùng mà không chỉ định locale, trả về chuỗi được định dạng theo locale mặc định và tùy chọn mặc định.

```js
const number = 3500;

console.log(new Intl.NumberFormat().format(number));
// '3,500' if in US English locale
```

### Sử dụng locale

Ví dụ này cho thấy một số biến thể trong định dạng s�� theo locale. Để có định dạng của ngôn ngữ được dùng trong giao diện người dùng của ứng dụng, hãy đảm bảo chỉ định ngôn ngữ đó (và có thể một số ngôn ngữ dự phòng) bằng đối số `locales`:

```js
const number = 123456.789;

// German uses comma as decimal separator and period for thousands
console.log(new Intl.NumberFormat("de-DE").format(number));
// 123.456,789

// Arabic in most Arabic speaking countries uses real Arabic digits
console.log(new Intl.NumberFormat("ar-EG").format(number));
// ١٢٣٤٥٦٫٧٨٩

// India uses thousands/lakh/crore separators
console.log(new Intl.NumberFormat("en-IN").format(number));
// 1,23,456.789

// the nu extension key requests a numbering system, e.g. Chinese decimal
console.log(new Intl.NumberFormat("zh-Hans-CN-u-nu-hanidec").format(number));
// 一二三,四五六.七八九

// when requesting a language that may not be supported, such as
// Balinese, include a fallback language, in this case Indonesian
console.log(new Intl.NumberFormat(["ban", "id"]).format(number));
// 123.456,789
```

### Sử dụng tùy chọn

Kết quả có thể được tùy chỉnh bằng đối số [`options`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#options):

```js
const number = 123456.789;

// request a currency format
console.log(
  new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(
    number,
  ),
);
// 123.456,79 €

// the Japanese yen doesn't use a minor unit
console.log(
  new Intl.NumberFormat("ja-JP", { style: "currency", currency: "JPY" }).format(
    number,
  ),
);
// ￥123,457

// limit to three significant digits
console.log(
  new Intl.NumberFormat("en-IN", { maximumSignificantDigits: 3 }).format(
    number,
  ),
);
// 1,23,000

// Formatting with units
console.log(
  new Intl.NumberFormat("pt-PT", {
    style: "unit",
    unit: "kilometer-per-hour",
  }).format(50),
);
// 50 km/h

console.log(
  (16).toLocaleString("en-GB", {
    style: "unit",
    unit: "liter",
    unitDisplay: "long",
  }),
);
// 16 litres
```

Để biết danh sách đầy đủ các tùy chọn, xem trang [hàm khởi tạo `Intl.NumberFormat()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#options).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.NumberFormat` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-numberformat/)
- {{jsxref("Intl")}}
- {{jsxref("Number.prototype.toLocaleString()")}}
