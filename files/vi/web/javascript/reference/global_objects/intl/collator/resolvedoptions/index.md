---
title: Intl.Collator.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Collator/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.Collator.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.Collator")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `Collator` này.

{{InteractiveExample("JavaScript Demo: Intl.Collator.prototype.resolvedOptions()")}}

```js interactive-example
const numberDe = new Intl.NumberFormat("de-DE");
const numberAr = new Intl.NumberFormat("ar");

console.log(numberDe.resolvedOptions().numberingSystem);
// Expected output: "latn"

console.log(numberAr.resolvedOptions().numberingSystem);
// Expected output: "arab"
```

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `Collator` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho ngôn ngữ thực sự được sử dụng, được xác định bởi quá trình [thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Chỉ các khóa mở rộng Unicode `co`, `kn`, và `kf`, nếu được yêu cầu và hỗ trợ, mới có thể được bao gồm trong đầu ra.
- `usage`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Nó là `"sort"` hoặc `"search"`. Mặc định là `"sort"`.
- `sensitivity`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Nó là `"base"`, `"accent"`, `"case"`, hoặc `"variant"`. Mặc định là `"variant"` cho usage `"sort"`; phụ thuộc vào ngôn ngữ cho usage `"search"`.
- `ignorePunctuation`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Đây là một boolean. Mặc định là `true` cho tiếng Thái (`th`) và `false` cho tất cả ngôn ngữ khác.
- `collation`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"co"`, với giá trị mặc định được điền vào khi cần. Đây là [kiểu đối chiếu](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_collation_types) được hỗ trợ cho ngôn ngữ này. Mặc định là `"default"`.
- `numeric`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"kn"`, với giá trị mặc định được điền vào khi cần. Đây là một boolean. Mặc định là `false`. Nếu triển khai không hỗ trợ khóa mở rộng Unicode này, thuộc tính này sẽ bị bỏ qua.
- `caseFirst`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, hoặc sử dụng khóa mở rộng Unicode `"kf"`, với giá trị mặc định được điền vào khi cần. Nó là `"upper"`, `"lower"`, hoặc `"false"`. Mặc định là `"false"`. Nếu triển khai không hỗ trợ khóa mở rộng Unicode này, thuộc tính này sẽ bị bỏ qua.

## Ví dụ

### Sử dụng phương thức resolvedOptions

```js
const de = new Intl.Collator("de", { sensitivity: "base" });
const usedOptions = de.resolvedOptions();

usedOptions.locale; // "de"
usedOptions.usage; // "sort"
usedOptions.sensitivity; // "base"
usedOptions.ignorePunctuation; // false
usedOptions.collation; // "default"
usedOptions.numeric; // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Collator")}}
