---
title: Intl.DisplayNames.supportedLocalesOf()
short-title: supportedLocalesOf()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DisplayNames/supportedLocalesOf
page-type: javascript-static-method
browser-compat: javascript.builtins.Intl.DisplayNames.supportedLocalesOf
sidebar: jsref
---

Phương thức tĩnh **`Intl.DisplayNames.supportedLocalesOf()`** trả về một mảng chứa các ngôn ngữ được hỗ trợ trong tên hiển thị mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Cú pháp

```js-nolint
Intl.DisplayNames.supportedLocalesOf(locales)
Intl.DisplayNames.supportedLocalesOf(locales, options)
```

### Tham số

- `locales`
  - : Một chuỗi với {{glossary("BCP 47 language tag")}}, hoặc một mảng các chuỗi như vậy. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).
- `options` {{optional_inline}}
  - : Một đối tượng có thể có thuộc tính sau:
    - `localeMatcher`
      - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem trang {{jsxref("Intl", "Intl", "#locale_identification_and_negotiation", 1)}}.

### Giá trị trả về

Một mảng các chuỗi đại diện cho một tập hợp con của các thẻ ngôn ngữ đã cho được hỗ trợ trong tên hiển thị mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Ví dụ

### Sử dụng supportedLocalesOf()

Giả sử một runtime hỗ trợ tiếng Indonesia và tiếng Đức nhưng không hỗ trợ tiếng Bali trong tên hiển thị, `supportedLocalesOf` trả về các thẻ ngôn ngữ Indonesia và Đức không thay đổi, mặc dù đối chiếu `pinyin` không liên quan đến tên hiển thị và không được dùng với tiếng Indonesia, và tiếng Đức chuyên biệt cho Indonesia khó có khả năng được hỗ trợ. Lưu ý việc chỉ định thuật toán `"lookup"` ở đây — trình khớp `"best fit"` có thể quyết định rằng tiếng Indonesia là phù hợp đủ cho tiếng Bali vì hầu hết người nói tiếng Bali cũng hiểu tiếng Indonesia, và do đó trả về thẻ ngôn ngữ Bali.

```js
const locales = ["ban", "id-u-co-pinyin", "de-ID"];
const options = { localeMatcher: "lookup" };
console.log(Intl.DisplayNames.supportedLocalesOf(locales, options));
// ["id-u-co-pinyin", "de-ID"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DisplayNames")}}
