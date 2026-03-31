---
title: Intl.NumberFormat.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.NumberFormat.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.NumberFormat")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `NumberFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.NumberFormat.prototype.resolvedOptions()")}}

```js interactive-example
const numberFormat = new Intl.NumberFormat("de-DE");
const options = numberFormat.resolvedOptions();

console.log(options.locale);
// Expected output: "de-DE"

console.log(options.numberingSystem);
// Expected output: "latn"

console.log(options.style);
// Expected output: "decimal"
```

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `NumberFormat` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho locale thực sự được dùng, được xác định bởi quá trình [thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Chỉ khóa mở rộng Unicode `nu`, nếu được yêu cầu, mới có thể được bao gồm trong đầu ra.
- `numberingSystem`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"nu"`, với giá trị mặc định được điền vào khi cần. Đây là [hệ thống đánh số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types) được hỗ trợ cho locale này. Mặc định phụ thuộc vào locale.
- `style`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"decimal"`, `"percent"`, `"currency"` hoặc `"unit"`. Mặc định là `"decimal"`.
- `currency` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`. Chỉ có mặt nếu `style` là `"currency"`. Là mã tiền tệ ISO 4217; xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_currency_identifiers). Bắt buộc nếu `style` là `"currency"` nên không có giá trị mặc định.
- `currencyDisplay` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Chỉ có mặt nếu `style` là `"currency"`. Là `"code"`, `"symbol"`, `"narrowSymbol"` hoặc `"name"`. Mặc định là `"symbol"`.
- `currencySign` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Chỉ có mặt nếu `style` là `"currency"`. Là `"standard"` hoặc `"accounting"`. Mặc định là `"standard"`.
- `unit` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`. Chỉ có mặt nếu `style` là `"unit"`. Là [định danh đơn vị được chấp thuận](https://tc39.es/ecma402/#table-sanctioned-single-unit-identifiers) từ [danh sách CLDR đầy đủ](https://github.com/unicode-org/cldr/blob/main/common/validity/unit.xml). Bắt buộc nếu `style` là `"unit"` nên không có giá trị mặc định.
- `unitDisplay` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Chỉ có mặt nếu `style` là `"unit"`. Là `"short"`, `"narrow"` hoặc `"long"`. Mặc định là `"short"`.
- `minimumIntegerDigits`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là số nguyên từ `1` đến `21`. Mặc định là `1`.
- `minimumFractionDigits`, `maximumFractionDigits` {{optional_inline}}
  - : Giá trị được cung cấp cho các thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Chỉ có mặt khi cần thiết; xem [tùy chọn chữ số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#digit_options). Là số nguyên từ `0` đến `100`.
- `minimumSignificantDigits`, `maximumSignificantDigits` {{optional_inline}}
  - : Giá trị được cung cấp cho các thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Chỉ có mặt khi cần thiết; xem [tùy chọn chữ số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#digit_options). Là số nguyên từ `1` đến `21`.
- `useGrouping`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần, và một số giá trị được chuẩn hóa. Là `"always"`, `"auto"`, `"min2"` hoặc boolean `false`. Mặc định là `"min2"` nếu `notation` là `"compact"`, và `"auto"` trong các trường hợp khác.
- `notation`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"standard"`, `"scientific"`, `"engineering"` hoặc `"compact"`. Mặc định là `"standard"`.
- `compactDisplay` {{optional_inline}}
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Chỉ có mặt nếu `notation` là `"compact"`. Là `"short"` hoặc `"long"`. Mặc định là `"short"`.
- `signDisplay`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"auto"`, `"always"`, `"exceptZero"`, `"negative"` hoặc `"never"`. Mặc định là `"auto"`.
- `roundingIncrement`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là một trong `1`, `2`, `5`, `10`, `20`, `25`, `50`, `100`, `200`, `250`, `500`, `1000`, `2000`, `2500` và `5000`. Mặc định là `1`.
- `roundingMode`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là một trong `"ceil"`, `"floor"`, `"expand"`, `"trunc"`, `"halfCeil"`, `"halfFloor"`, `"halfExpand"`, `"halfTrunc"` và `"halfEven"`. Mặc định là `"halfExpand"`.
- `roundingPriority`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"auto"`, `"morePrecision"` hoặc `"lessPrecision"`. Mặc định là `"auto"`.
- `trailingZeroDisplay`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"auto"` hoặc `"stripIfInteger"`. Mặc định là `"auto"`.

## Ví dụ

### Sử dụng phương thức `resolvedOptions`

```js
// Create a NumberFormat
const de = new Intl.NumberFormat("de-DE", {
  style: "currency",
  currency: "USD",
  maximumFractionDigits: 2,
  roundingIncrement: 5,
  roundingMode: "halfCeil",
});

// Resolve the options
const usedOptions = de.resolvedOptions();
console.log(usedOptions.locale); // "de-DE"
console.log(usedOptions.numberingSystem); // "latn"
console.log(usedOptions.compactDisplay); // undefined ("notation" not set to "compact")
console.log(usedOptions.currency); // "USD"
console.log(usedOptions.currencyDisplay); // "symbol"
console.log(usedOptions.currencySign); // "standard"
console.log(usedOptions.minimumIntegerDigits); // 1
console.log(usedOptions.minimumFractionDigits); // 2
console.log(usedOptions.maximumFractionDigits); // 2
console.log(usedOptions.minimumSignificantDigits); // undefined (maximumFractionDigits is set)
console.log(usedOptions.maximumSignificantDigits); // undefined (maximumFractionDigits is set)
console.log(usedOptions.notation); // "standard"
console.log(usedOptions.roundingIncrement); // 5
console.log(usedOptions.roundingMode); // halfCeil
console.log(usedOptions.roundingPriority); // auto
console.log(usedOptions.signDisplay); // "auto"
console.log(usedOptions.style); // "currency"
console.log(usedOptions.trailingZeroDisplay); // auto
console.log(usedOptions.useGrouping); // auto
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
