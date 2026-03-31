---
title: Intl.DisplayNames.prototype.of()
short-title: of()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/of
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DisplayNames.of
sidebar: jsref
---

Phương thức **`of()`** của các instance {{jsxref("Intl.DisplayNames")}} nhận một code và trả về một chuỗi dựa trên ngôn ngữ và tùy chọn được cung cấp khi khởi tạo đối tượng `Intl.DisplayNames` này.

{{InteractiveExample("JavaScript Demo: Intl.DisplayNames.prototype.of()")}}

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

## Cú pháp

```js-nolint
of(code)
```

### Tham số

- `code`
  - : `code` cần cung cấp phụ thuộc vào `type`:
    - Nếu type là "region", `code` nên là [mã vùng ISO 3166 hai chữ cái](https://www.iso.org/iso-3166-country-codes.html), hoặc [mã địa lý UN M49 ba chữ số](https://unstats.un.org/unsd/methodology/m49/). Nó phải tuân theo ngữ pháp [`unicode_region_subtag`](https://unicode.org/reports/tr35/#unicode_region_subtag). Sử dụng mã chữ hoa (ví dụ: `"US"`), vì mã chữ thường (ví dụ: `"us"`) có thể không hoạt động đáng tin cậy ở mọi nơi.
    - Nếu type là "script", `code` nên là [mã chữ viết ISO 15924 bốn chữ cái](https://unicode.org/iso15924/iso15924-codes.html). Nó phải tuân theo ngữ pháp [`unicode_script_subtag`](https://unicode.org/reports/tr35/#unicode_script_subtag).
    - Nếu type là "language", `code` nên khớp với ký hiệu không kết thúc [`unicode_language_id`](https://unicode.org/reports/tr35/#Unicode_language_identifier).
    - Nếu type là "currency", `code` nên là [mã tiền tệ ISO 4217 ba chữ cái](https://www.iso.org/iso-4217-currency-codes.html). Nó phải có chính xác ba ký tự chữ cái.
    - Nếu type là "dateTimeField", `code` nên là một trong: `"era"`, `"year"`, `"quarter"`, `"month"`, `"weekOfYear"`, `"weekday"`, `"day"`, `"dayPeriod"`, `"hour"`, `"minute"`, `"second"`, `"timeZoneName"`.
    - Nếu type là "calendar", `code` nên là một [khóa lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/Locale/calendar). Nó phải tuân theo ngữ pháp `type` của một [mã định danh ngôn ngữ Unicode](https://unicode.org/reports/tr35/#32-unicode-locale-identifier).

### Giá trị trả về

Một chuỗi được định dạng đặc thù theo ngôn ngữ, hoặc `undefined` nếu không có dữ liệu cho đầu vào và `fallback` là `"none"`.

> [!NOTE]
> `fallback` chỉ được sử dụng nếu `code` hợp lệ về mặt cấu trúc. Xem [sử dụng fallback](#using_fallback).

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `code` không hợp lệ về mặt cấu trúc cho `type` đã cho.

## Ví dụ

### Sử dụng phương thức of

```js
const regionNames = new Intl.DisplayNames("en", { type: "region" });
regionNames.of("419"); // "Latin America"

const languageNames = new Intl.DisplayNames("en", { type: "language" });
languageNames.of("fr"); // "French"

const currencyNames = new Intl.DisplayNames("en", { type: "currency" });
currencyNames.of("EUR"); // "Euro"

const languageNamesStandard = new Intl.DisplayNames("fr", {
  type: "language",
  languageDisplay: "standard",
});
languageNamesStandard.of("fr-CA"); // "français (Canada)"

const languageNamesDialect = new Intl.DisplayNames("fr", {
  type: "language",
  languageDisplay: "dialect",
});
languageNamesDialect.of("fr-CA"); // "français canadien"
```

### Sử dụng fallback

Khi `Intl.DisplayNames` được khởi tạo với `fallback: "code"`, phương thức `of()` sẽ trả về `code` nếu đầu vào có vẻ hợp lệ về mặt cấu trúc nhưng không có dữ liệu cho đầu vào đó. Nếu `fallback` là `"none"`, `undefined` sẽ được trả về.

```js
console.log(
  new Intl.DisplayNames("en", { type: "region", fallback: "code" }).of("ZL"),
); // "ZL"

console.log(
  new Intl.DisplayNames("en", { type: "region", fallback: "none" }).of("ZL"),
); // undefined
```

Tuy nhiên, điều này chỉ áp dụng nếu `code` hợp lệ về mặt cấu trúc. Ví dụ, nếu `type` là `"region"` nhưng `code` không tuân theo ngữ pháp `unicode_region_subtag` (2 ký tự chữ cái hoặc 3 ký tự số), một {{jsxref("RangeError")}} sẽ được ném ra trực tiếp thay vì sử dụng fallback.

```js
console.log(
  new Intl.DisplayNames("en", { type: "region", fallback: "code" }).of("ZLC"),
); // throws RangeError: invalid value "ZLC" for option region
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DisplayNames")}}
