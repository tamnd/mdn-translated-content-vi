---
title: Intl.RelativeTimeFormat.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.RelativeTimeFormat.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.RelativeTimeFormat")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `RelativeTimeFormat` này.

{{InteractiveExample("JavaScript Demo: Intl.RelativeTimeFormat.prototype.resolvedOptions()")}}

```js interactive-example
const rtf1 = new Intl.RelativeTimeFormat("en", { style: "narrow" });
const options1 = rtf1.resolvedOptions();

const rtf2 = new Intl.RelativeTimeFormat("es", { numeric: "auto" });
const options2 = rtf2.resolvedOptions();

console.log(`${options1.locale}, ${options1.style}, ${options1.numeric}`);
// Expected output: "en, narrow, always"

console.log(`${options2.locale}, ${options2.style}, ${options2.numeric}`);
// Expected output: "es, long, auto"
```

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `RelativeTimeFormat` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho locale thực sự được dùng, được xác định bởi quá trình [thương lượng locale](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Chỉ có khóa mở rộng Unicode `nu`, nếu được yêu cầu, có thể được đưa vào đầu ra.
- `style`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Có thể là `"long"`, `"short"`, hoặc `"narrow"`. Mặc định là `"long"`.
- `numeric`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Có thể là `"always"` hoặc `"auto"`. Mặc định là `"always"`.
- `numberingSystem`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"nu"`, với giá trị mặc định được điền vào khi cần. Là một [hệ thống đánh số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_numbering_system_types) được hỗ trợ cho locale này. Mặc định phụ thuộc vào locale.

## Ví dụ

### Sử dụng phương thức resolvedOptions()

```js
const de = new Intl.RelativeTimeFormat("de-DE");
const usedOptions = de.resolvedOptions();

usedOptions.locale; // "de-DE"
usedOptions.style; // "long"
usedOptions.numeric; // "always"
usedOptions.numberingSystem; // "latn"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.RelativeTimeFormat")}}
