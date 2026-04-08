---
title: "SyntaxError: negated character class with strings in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_negated_char_class_with_strings
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "negated character class with strings in regular expression" xảy ra khi một [lớp ký tự chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class) bị phủ định và có thể khớp với một chuỗi (nhiều hơn một ký tự).

## Thông báo

```plain
SyntaxError: Invalid regular expression: /[^\p{RGI_Emoji_Flag_Sequence}]/v: Negated character class may contain strings (V8-based)
SyntaxError: negated character class with strings in regular expression (Firefox)
SyntaxError: Invalid regular expression: negated class set may contain strings (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong chế độ `v`, lớp ký tự có thể khớp với nhiều hơn 1 ký tự. Ví dụ, `/[\q{abc}]/v` sẽ khớp với chuỗi `"abc"`, và `/[\p{RGI_Emoji_Flag_Sequence}]/v` sẽ khớp với bất kỳ chuỗi ký tự nào đại diện cho một emoji quốc kỳ. Tuy nhiên, lớp ký tự bị phủ định `[^...]` không được phép khớp với các chuỗi, vì vậy `/[^\p{RGI_Emoji_Flag_Sequence}]/v` không hợp lệ, vì không rõ nó nên khớp với bao nhiêu ký tự. Để biết thêm thông tin, hãy xem tài liệu tham khảo [lớp ký tự chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class).

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/[^\p{RGI_Emoji_Flag_Sequence}]/v;
```

### Các trường hợp hợp lệ

```js example-good
// Khớp với hai ký tự không phải là một chuỗi emoji quốc kỳ
/(?!\p{RGI_Emoji_Flag_Sequence})../v;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Lớp ký tự: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Chuỗi thoát lớp ký tự Unicode: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
