---
title: Intl.PluralRules.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/PluralRules/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.PluralRules.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.PluralRules")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `PluralRules` này.

{{InteractiveExample("JavaScript Demo: Intl.PluralRules.prototype.resolvedOptions()")}}

```js interactive-example
const pluralRules1 = new Intl.PluralRules("uk");
const options1 = pluralRules1.resolvedOptions();

const pluralRules2 = new Intl.PluralRules("bn");
const options2 = pluralRules2.resolvedOptions();

console.log(options1.pluralCategories);
// Expected output: Array ["few", "many", "one", "other"]

console.log(options2.pluralCategories);
// Expected output: Array ["one", "other"]
```

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `PluralRules` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho locale thực sự được dùng, được xác định bởi quá trình [thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Không có khóa mở rộng Unicode nào được bao gồm trong đầu ra.
- `type`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"cardinal"` hoặc `"ordinal"`. Mặc định là `"cardinal"`.
- `minimumIntegerDigits`, `minimumFractionDigits`, `maximumFractionDigits` {{optional_inline}}
  - : Giá trị được cung cấp cho các thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Các thuộc tính này chỉ có mặt nếu cả `minimumSignificantDigits` và `maximumSignificantDigits` đều không được cung cấp trong đối số `options`.
- `minimumSignificantDigits`, `maximumSignificantDigits` {{optional_inline}}
  - : Giá trị được cung cấp cho các thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Các thuộc tính này chỉ có mặt nếu ít nhất một trong chúng được cung cấp trong đối số `options`.
- `pluralCategories`
  - : Một {{jsxref("Array")}} các danh mục số nhiều được sử dụng bởi locale đã cho, được chọn từ danh sách `"zero"`, `"one"`, `"two"`, `"few"`, `"many"` và `"other"`.
- `roundingIncrement`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là một trong `1`, `2`, `5`, `10`, `20`, `25`, `50`, `100`, `200`, `250`, `500`, `1000`, `2000`, `2500` và `5000`. Mặc định là `1`.
- `roundingMode`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là một trong `"ceil"`, `"floor"`, `"expand"`, `"trunc"`, `"halfCeil"`, `"halfFloor"`, `"halfExpand"`, `"halfTrunc"` và `"halfEven"`. Mặc định là `"halfExpand"`.
- `roundingPriority`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"auto"`, `"morePrecision"` hoặc `"lessPrecision"`. Mặc định là `"auto"`.
- `trailingZeroDisplay`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Là `"auto"` hoặc `"stripIfInteger"`. Mặc định là `"auto"`.

## Ví dụ

### Sử dụng phương thức resolvedOptions()

Đoạn mã dưới đây cho thấy việc khởi tạo đối tượng `PluralRules`, tiếp theo là log từng tùy chọn đã được giải quyết.

```js
// Create a PluralRules instance
const de = new Intl.PluralRules("de-DE", {
  maximumSignificantDigits: 2,
  trailingZeroDisplay: "auto",
});

// Resolve the options
const usedOptions = de.resolvedOptions();
console.log(usedOptions.locale); // "de-DE"
console.log(usedOptions.pluralCategories); // Array ["one", "other"]
console.log(usedOptions.type); // "cardinal"
console.log(usedOptions.minimumIntegerDigits); // 1
console.log(usedOptions.minimumFractionDigits); // undefined (maximumSignificantDigits is set)
console.log(usedOptions.maximumFractionDigits); // undefined (maximumSignificantDigits is set)
console.log(usedOptions.minimumSignificantDigits); // 1
console.log(usedOptions.maximumSignificantDigits); // 2
console.log(usedOptions.roundingIncrement); // 1
console.log(usedOptions.roundingMode); // "halfExpand"
console.log(usedOptions.roundingPriority); // "auto"
console.log(usedOptions.trailingZeroDisplay); // "auto"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.PluralRules")}}
