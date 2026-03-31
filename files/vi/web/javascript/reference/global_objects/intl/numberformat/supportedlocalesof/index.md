---
title: Intl.NumberFormat.supportedLocalesOf()
short-title: supportedLocalesOf()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/supportedLocalesOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Intl.NumberFormat.supportedLocalesOf
sidebar: jsref
---

Phương thức tĩnh **`Intl.NumberFormat.supportedLocalesOf()`** trả về một mảng chứa các locale được cung cấp được hỗ trợ trong định dạng số mà không phải dùng locale mặc định của runtime.

{{InteractiveExample("JavaScript Demo: Intl.NumberFormat.supportedLocalesOf()", "shorter")}}

```js interactive-example
const locales = ["ban", "id-u-co-pinyin", "de-ID"];
const options = { localeMatcher: "lookup" };

console.log(Intl.NumberFormat.supportedLocalesOf(locales, options));
// Expected output: Array ["id-u-co-pinyin", "de-ID"]
// (Note: the exact output may be browser-dependent)
```

## Cú pháp

```js-nolint
Intl.NumberFormat.supportedLocalesOf(locales)
Intl.NumberFormat.supportedLocalesOf(locales, options)
```

### Tham số

- `locales`
  - : Chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Đối tượng có thể có thuộc tính sau:
    - `localeMatcher`
      - : Thuật toán khớp locale để sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thông tin về tùy chọn này, xem trang {{jsxref("Intl", "Intl", "#locale_identification_and_negotiation", 1)}}.

### Giá trị trả về

Một mảng chuỗi đại diện cho tập hợp con của các thẻ locale đã cho được hỗ trợ trong định dạng số mà không phải dùng locale mặc định của runtime.

## Ví dụ

### Sử dụng supportedLocalesOf()

Giả sử runtime hỗ trợ tiếng Indonesia và tiếng Đức nhưng không hỗ trợ tiếng Bali trong định dạng số, `supportedLocalesOf` trả về các thẻ ngôn ngữ Indonesia và Đức không thay đổi, mặc dù sắp xếp `pinyin` không liên quan đến định dạng số và không được dùng với tiếng Indonesia, và tiếng Đức chuyên biệt cho Indonesia khó có thể được hỗ trợ. Lưu ý đặc tả của thuật toán `"lookup"` ở đây — một bộ khớp `"best fit"` có thể quyết định rằng tiếng Indonesia là kết hợp phù hợp cho tiếng Bali vì hầu hết người nói tiếng Bali cũng hiểu tiếng Indonesia, và do đó cũng trả về thẻ ngôn ngữ Bali.

```js
const locales = ["ban", "id-u-co-pinyin", "de-ID"];
const options = { localeMatcher: "lookup" };
console.log(Intl.NumberFormat.supportedLocalesOf(locales, options));
// ["id-u-co-pinyin", "de-ID"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
