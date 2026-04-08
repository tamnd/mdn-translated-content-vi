---
title: Intl.DateTimeFormat.supportedLocalesOf()
short-title: supportedLocalesOf()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/supportedLocalesOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Intl.DateTimeFormat.supportedLocalesOf
sidebar: jsref
---

Phương thức tĩnh **`Intl.DateTimeFormat.supportedLocalesOf()`** trả về một mảng chứa các ngôn ngữ được hỗ trợ trong định dạng ngày và giờ mà không cần phải quay lại ngôn ngữ mặc định của runtime.

{{InteractiveExample("JavaScript Demo: Intl.DateTimeFormat.supportedLocalesOf()", "shorter")}}

```js interactive-example
const locales = ["ban", "id-u-co-pinyin", "de-ID"];
const options = { localeMatcher: "lookup" };

console.log(Intl.DateTimeFormat.supportedLocalesOf(locales, options));
// Expected output: Array ["id-u-co-pinyin", "de-ID"]
// (Note: the exact output may be browser-dependent)
```

## Cú pháp

```js-nolint
Intl.DateTimeFormat.supportedLocalesOf(locales)
Intl.DateTimeFormat.supportedLocalesOf(locales, options)
```

### Tham số

- `locales`
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Một đối tượng có thể có thuộc tính sau:
    - `localeMatcher`
      - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem trang {{jsxref("Intl", "Intl", "#locale_identification_and_negotiation", 1)}}.

### Giá trị trả về

Một mảng các chuỗi đại diện cho một tập hợp con của các thẻ ngôn ngữ đã cho được hỗ trợ trong định dạng ngày và giờ mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Ví dụ

### Sử dụng supportedLocalesOf()

Giả sử một runtime hỗ trợ tiếng Indonesia và tiếng Đức nhưng không hỗ trợ tiếng Bali trong định dạng ngày và giờ, `supportedLocalesOf` trả về các thẻ ngôn ngữ Indonesia và Đức không thay đổi, mặc dù đối chiếu `pinyin` không liên quan đến định dạng ngày và giờ và không được dùng với tiếng Indonesia, và tiếng Đức chuyên biệt cho Indonesia khó có khả năng được hỗ trợ. Lưu ý việc chỉ định thuật toán `"lookup"` ở đây — trình khớp `"best fit"` có thể quyết định rằng tiếng Indonesia là phù hợp đủ cho tiếng Bali vì hầu hết người nói tiếng Bali cũng hiểu tiếng Indonesia, và do đó trả về thẻ ngôn ngữ Bali.

```js
const locales = ["ban", "id-u-co-pinyin", "de-ID"];
const options = { localeMatcher: "lookup" };
console.log(Intl.DateTimeFormat.supportedLocalesOf(locales, options));
// ["id-u-co-pinyin", "de-ID"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DateTimeFormat")}}
