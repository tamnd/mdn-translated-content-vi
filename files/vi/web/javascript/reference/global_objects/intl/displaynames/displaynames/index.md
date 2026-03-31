---
title: Intl.DisplayNames() constructor
short-title: Intl.DisplayNames()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/DisplayNames
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.DisplayNames.DisplayNames
sidebar: jsref
---

Constructor **`Intl.DisplayNames()`** tạo các đối tượng {{jsxref("Intl.DisplayNames")}}.

{{InteractiveExample("JavaScript Demo: Intl.DisplayNames() constructor")}}

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
new Intl.DisplayNames(locales, options)
```

> [!NOTE]
> `Intl.DisplayNames()` chỉ có thể được khởi tạo với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cố gắng gọi nó không có `new` sẽ ném ra một {{jsxref("TypeError")}}.

### Tham số

- `locales`
  - : Một chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các mã định danh ngôn ngữ như vậy. Ngôn ngữ mặc định của runtime được sử dụng khi `undefined` được truyền vào hoặc khi không có mã định danh ngôn ngữ nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options`
  - : Một đối tượng chứa các thuộc tính sau, theo thứ tự được lấy ra:
    - `localeMatcher` {{optional_inline}}
      - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem [Xác định và thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `style` {{optional_inline}}
      - : Kiểu định dạng cần sử dụng. Các giá trị có thể là `"narrow"`, `"short"`, và `"long"`; mặc định là `"long"`.
    - `type`
      - : Kiểu tên hiển thị cần trả về từ [`of()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/of). Các giá trị có thể là `"language"`, `"region"`, `"script"`, `"currency"`, `"calendar"`, và `"dateTimeField"`.
    - `fallback` {{optional_inline}}
      - : Cái gì sẽ được trả về từ `of()` nếu đầu vào hợp lệ về mặt cấu trúc nhưng không có tên hiển thị khớp. Các giá trị có thể là:
        - `"code"` (mặc định)
          - : Trả về chính mã đầu vào.
        - `"none"`
          - : Trả về `undefined`.
    - `languageDisplay` {{optional_inline}}
      - : Cách tên ngôn ngữ nên được hiển thị. Chỉ có thể sử dụng cùng với `type: "language"`. Các giá trị có thể là:
        - `"dialect"` (mặc định)
          - : Hiển thị các phương ngữ vùng đặc biệt bằng tên riêng của chúng. Ví dụ: `"nl-BE"` sẽ được hiển thị là `"Flemish"`.
        - `"standard"`
          - : Hiển thị tất cả ngôn ngữ theo định dạng chuẩn. Ví dụ: `"nl-BE"` sẽ được hiển thị là `"Dutch (Belgium)"`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `options.type` không được cung cấp.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng cơ bản

Khi sử dụng cơ bản mà không chỉ định ngôn ngữ, một chuỗi được định dạng trong ngôn ngữ mặc định và với các tùy chọn mặc định sẽ được trả về.

```js
console.log(new Intl.DisplayNames([], { type: "language" }).of("US"));
// 'us'
```

### Sử dụng type `dateTimeField`

Ví dụ sử dụng `dateTimeField` làm tùy chọn type, sẽ trả về các chuỗi tên ngày giờ được bản địa hóa.

```js
const dn = new Intl.DisplayNames("pt", { type: "dateTimeField" });
console.log(dn.of("era")); // 'era'
console.log(dn.of("year")); // 'ano'
console.log(dn.of("month")); // 'mês'
console.log(dn.of("quarter")); // 'trimestre'
console.log(dn.of("weekOfYear")); // 'semana'
console.log(dn.of("weekday")); // 'dia da semana'
console.log(dn.of("dayPeriod")); // 'AM/PM'
console.log(dn.of("day")); // 'dia'
console.log(dn.of("hour")); // 'hora'
console.log(dn.of("minute")); // 'minuto'
console.log(dn.of("second")); // 'segundo'
```

### Sử dụng type `calendar`

Ví dụ sử dụng `calendar` làm tùy chọn type, sẽ trả về các chuỗi tên lịch được bản địa hóa.

```js
const dn = new Intl.DisplayNames("en", { type: "calendar" });
console.log(dn.of("roc")); // 'Minguo Calendar'
console.log(dn.of("gregory")); // 'Gregorian Calendar'
console.log(dn.of("chinese")); // 'Chinese Calendar'
```

### Sử dụng type `language` với `languageDisplay`

Ví dụ sử dụng `language` làm type với các tùy chọn `languageDisplay`.

```js
// Using `dialect` option
const dnDialect = new Intl.DisplayNames("en", {
  type: "language",
  languageDisplay: "dialect",
});
console.log(dnDialect.of("en-GB")); // 'British English'

// Using `standard` option
const dnStd = new Intl.DisplayNames("en", {
  type: "language",
  languageDisplay: "standard",
});
console.log(dnStd.of("en-GB")); // 'English (United Kingdom)'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DisplayNames")}}
- {{jsxref("Intl.supportedValuesOf()")}}
- {{jsxref("Intl")}}
