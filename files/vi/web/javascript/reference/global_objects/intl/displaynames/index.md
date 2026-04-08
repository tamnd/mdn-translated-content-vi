---
title: Intl.DisplayNames
slug: Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames
page-type: javascript-class
browser-compat: javascript.builtins.Intl.DisplayNames
sidebar: jsref
---

Đối tượng **`Intl.DisplayNames`** cho phép dịch nhất quán tên hiển thị ngôn ngữ, vùng và chữ viết.

{{InteractiveExample("JavaScript Demo: Intl.DisplayNames")}}

```js interactive-example
const regionNamesInEnglish = new Intl.DisplayNames(["en"], { type: "region" });
const regionNamesInTraditionalChinese = new Intl.DisplayNames(["zh-Hant"], {
  type: "region",
});

console.log(regionNamesInEnglish.of("US"));
// Expected output: "United States"

console.log(regionNamesInTraditionalChinese.of("US"));
// Expected output: "美國"
```

## Constructor

- {{jsxref("Intl/DisplayNames/DisplayNames", "Intl.DisplayNames()")}}
  - : Tạo một đối tượng `Intl.DisplayNames` mới.

## Phương thức tĩnh

- {{jsxref("Intl/DisplayNames/supportedLocalesOf", "Intl.DisplayNames.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các ngôn ngữ được hỗ trợ trong số các ngôn ngữ đã cung cấp mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.DisplayNames.prototype` và được chia sẻ bởi tất cả các instance `Intl.DisplayNames`.

- {{jsxref("Object/constructor", "Intl.DisplayNames.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Intl.DisplayNames`, giá trị khởi tạo là constructor {{jsxref("Intl/DisplayNames/DisplayNames", "Intl.DisplayNames")}}.
- `Intl.DisplayNames.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.DisplayNames"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/DisplayNames/of", "Intl.DisplayNames.prototype.of()")}}
  - : Phương thức này nhận một `code` và trả về một chuỗi dựa trên ngôn ngữ và tùy chọn được cung cấp khi khởi tạo `Intl.DisplayNames`.
- {{jsxref("Intl/DisplayNames/resolvedOptions", "Intl.DisplayNames.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn ngôn ngữ và định dạng được tính toán trong quá trình khởi tạo đối tượng.

## Ví dụ

### Tên hiển thị mã vùng

Để tạo một `Intl.DisplayNames` cho một ngôn ngữ và lấy tên hiển thị cho mã vùng.

```js
// Get display names of region in English
let regionNames = new Intl.DisplayNames(["en"], { type: "region" });
regionNames.of("419"); // "Latin America"
regionNames.of("BZ"); // "Belize"
regionNames.of("US"); // "United States"
regionNames.of("BA"); // "Bosnia & Herzegovina"
regionNames.of("MM"); // "Myanmar (Burma)"

// Get display names of region in Traditional Chinese
regionNames = new Intl.DisplayNames(["zh-Hant"], { type: "region" });
regionNames.of("419"); // "拉丁美洲"
regionNames.of("BZ"); // "貝里斯"
regionNames.of("US"); // "美國"
regionNames.of("BA"); // "波士尼亞與赫塞哥維納"
regionNames.of("MM"); // "緬甸"
```

### Tên hiển thị ngôn ngữ

Để tạo một `Intl.DisplayNames` cho một ngôn ngữ và lấy tên hiển thị cho chuỗi ngôn ngữ-chữ viết-vùng.

```js
// Get display names of language in English
let languageNames = new Intl.DisplayNames(["en"], { type: "language" });
languageNames.of("fr"); // "French"
languageNames.of("de"); // "German"
languageNames.of("fr-CA"); // "Canadian French"
languageNames.of("zh-Hant"); // "Traditional Chinese"
languageNames.of("en-US"); // "American English"
languageNames.of("zh-TW"); // "Chinese (Taiwan)"]

// Get display names of language in Traditional Chinese
languageNames = new Intl.DisplayNames(["zh-Hant"], { type: "language" });
languageNames.of("fr"); // "法文"
languageNames.of("zh"); // "中文"
languageNames.of("de"); // "德文"
```

### Tên hiển thị mã chữ viết

Để tạo một `Intl.DisplayNames` cho một ngôn ngữ và lấy tên hiển thị cho mã chữ viết.

```js
// Get display names of script in English
let scriptNames = new Intl.DisplayNames(["en"], { type: "script" });
// Get script names
scriptNames.of("Latn"); // "Latin"
scriptNames.of("Arab"); // "Arabic"
scriptNames.of("Kana"); // "Katakana"

// Get display names of script in Traditional Chinese
scriptNames = new Intl.DisplayNames(["zh-Hant"], { type: "script" });
scriptNames.of("Latn"); // "拉丁文"
scriptNames.of("Arab"); // "阿拉伯文"
scriptNames.of("Kana"); // "片假名"
```

### Tên hiển thị mã tiền tệ

Để tạo một `Intl.DisplayNames` cho một ngôn ngữ và lấy tên hiển thị cho mã tiền tệ.

```js
// Get display names of currency code in English
let currencyNames = new Intl.DisplayNames(["en"], { type: "currency" });
// Get currency names
currencyNames.of("USD"); // "US Dollar"
currencyNames.of("EUR"); // "Euro"
currencyNames.of("TWD"); // "New Taiwan Dollar"
currencyNames.of("CNY"); // "Chinese Yuan"

// Get display names of currency code in Traditional Chinese
currencyNames = new Intl.DisplayNames(["zh-Hant"], { type: "currency" });
currencyNames.of("USD"); // "美元"
currencyNames.of("EUR"); // "歐元"
currencyNames.of("TWD"); // "新台幣"
currencyNames.of("CNY"); // "人民幣"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.DisplayNames` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-displaynames/)
- {{jsxref("Intl")}}
