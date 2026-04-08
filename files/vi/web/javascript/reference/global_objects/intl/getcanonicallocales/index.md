---
title: Intl.getCanonicalLocales()
short-title: getCanonicalLocales()
slug: Web/JavaScript/Reference/Global_Objects/Intl/getCanonicalLocales
page-type: javascript-static-method
browser-compat: javascript.builtins.Intl.getCanonicalLocales
sidebar: jsref
---

Phương thức tĩnh **`Intl.getCanonicalLocales()`** trả về một mảng chứa các tên locale chuẩn hóa. Các phần tử trùng lặp sẽ bị bỏ qua và các phần tử sẽ được kiểm tra là các language tag hợp lệ về mặt cấu trúc.

{{InteractiveExample("JavaScript Demo: Intl.getCanonicalLocales()")}}

```js interactive-example
console.log(Intl.getCanonicalLocales("EN-US"));
// Expected output: Array ["en-US"]

console.log(Intl.getCanonicalLocales(["EN-US", "Fr"]));
// Expected output: Array ["en-US", "fr"]

try {
  Intl.getCanonicalLocales("EN_US");
} catch (err) {
  console.log(err.toString());
  // Expected output: RangeError: invalid language tag: "EN_US"
}
```

## Cú pháp

```js-nolint
Intl.getCanonicalLocales(locales)
```

### Tham số

- `locales`
  - : Danh sách các giá trị {{jsxref("String")}} cần lấy tên locale chuẩn hóa.

### Giá trị trả về

Một mảng chứa các tên locale chuẩn hóa.

## Ví dụ

### Sử dụng getCanonicalLocales

```js
Intl.getCanonicalLocales("EN-US"); // ["en-US"]
Intl.getCanonicalLocales(["EN-US", "Fr"]); // ["en-US", "fr"]

Intl.getCanonicalLocales("EN_US");
// RangeError: invalid language tag: "EN_US"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.getCanonicalLocales` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-getcanonicallocales/)
- {{jsxref("Intl/NumberFormat/supportedLocalesOf", "Intl.NumberFormat.supportedLocalesOf()")}}
- {{jsxref("Intl/DateTimeFormat/supportedLocalesOf", "Intl.DateTimeFormat.supportedLocalesOf()")}}
- {{jsxref("Intl/Collator/supportedLocalesOf", "Intl.Collator.supportedLocalesOf()")}}
