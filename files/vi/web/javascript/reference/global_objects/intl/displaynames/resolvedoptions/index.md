---
title: Intl.DisplayNames.prototype.resolvedOptions()
short-title: resolvedOptions()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/resolvedOptions
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DisplayNames.resolvedOptions
sidebar: jsref
---

Phương thức **`resolvedOptions()`** của các instance {{jsxref("Intl.DisplayNames")}} trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `DisplayNames` này.

## Cú pháp

```js-nolint
resolvedOptions()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới với các thuộc tính phản ánh các tùy chọn được tính toán trong quá trình khởi tạo đối tượng `DisplayNames` này. Đối tượng có các thuộc tính sau, theo thứ tự được liệt kê:

- `locale`
  - : {{glossary("BCP 47 language tag")}} cho ngôn ngữ thực sự được sử dụng, được xác định bởi quá trình [thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation). Không có khóa mở rộng Unicode nào sẽ được bao gồm trong đầu ra.
- `style`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`, với giá trị mặc định được điền vào khi cần. Nó là `"narrow"`, `"short"`, hoặc `"long"`. Mặc định là `"long"`.
- `type`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`. Nó là `"language"`, `"region"`, `"script"`, `"currency"`, `"calendar"`, hoặc `"dateTimeField"`. Đây là bắt buộc nên không có giá trị mặc định.
- `fallback`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`. Nó là `"code"` hoặc `"none"`. Mặc định là `"code"`.
- `languageDisplay`
  - : Giá trị được cung cấp cho thuộc tính này trong đối số `options`. Nó là `"dialect"` hoặc `"standard"`. Mặc định là `"dialect"`.

## Ví dụ

### Sử dụng resolvedOptions

```js
const displayNames = new Intl.DisplayNames(["de-DE"], { type: "region" });

const usedOptions = displayNames.resolvedOptions();
console.log(usedOptions.locale); // "de-DE"
console.log(usedOptions.style); // "long"
console.log(usedOptions.type); // "region"
console.log(usedOptions.fallback); // "code"
```

```js
const displayNames = new Intl.DisplayNames("en", {
  type: "language",
  languageDisplay: "standard",
});

const usedOptions = displayNames.resolvedOptions();
console.log(usedOptions.type); // "language"
console.log(usedOptions.languageDisplay); // "standard"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DisplayNames")}}
