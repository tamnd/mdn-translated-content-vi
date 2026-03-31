---
title: "Character escape: \\n, \\u{...}"
slug: Web/JavaScript/Reference/Regular_expressions/Character_escape
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.character_escape
sidebar: jssidebar
---

Một **character escape** đại diện cho một ký tự mà có thể không thể biểu diễn thuận tiện ở dạng literal của nó.

## Cú pháp

<!-- Note: the {} need to be double-escaped, once for Yari -->

```regex
\f, \n, \r, \t, \v
\cA, \cB, …, \cz
\0
\^, \$, \\, \., \*, \+, \?, \(, \), \[, \], \\{, \\}, \|, \/

\xHH
\uHHHH
\u{H…H}
```

> [!NOTE]
> `,` không phải là một phần của cú pháp.

### Tham số

- `H…H`
  - : Một số thập lục phân đại diện cho code point Unicode của ký tự. Dạng `\xHH` phải có đúng hai chữ số thập lục phân; dạng `\uHHHH` phải có đúng bốn chữ số; dạng `\u{H…H}` có thể có từ 1 đến 6 chữ số thập lục phân.

## Mô tả

Các character escapes sau được nhận diện trong regular expressions:

- `\f`, `\n`, `\r`, `\t`, `\v`
  - : Giống như trong [string literals](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences), ngoại trừ `\b`, đại diện cho [word boundary](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion) trong regexes trừ khi trong một [character class](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class).
- `\c` theo sau là một chữ cái từ `A` đến `Z` hoặc `a` đến `z`
  - : Đại diện cho ký tự điều khiển có giá trị bằng giá trị ký tự của chữ cái modulo 32. Ví dụ, `\cJ` đại diện cho ngắt dòng (`\n`), vì code point của `J` là 74, và 74 modulo 32 là 10, là code point của ngắt dòng. Vì một chữ cái viết hoa và dạng viết thường của nó chênh nhau 32, `\cJ` và `\cj` tương đương nhau. Bạn có thể biểu diễn các ký tự điều khiển từ 1 đến 26 theo dạng này.
- `\0`
  - : Đại diện cho ký tự U+0000 NUL. Không thể được theo sau bởi một chữ số (điều này làm cho nó trở thành một chuỗi [legacy octal escape](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#escape_sequences)).
- `\^`, `\$`, `\\`, `\.` `\*`, `\+`, `\?`, `\(`, `\)`, `\[`, `\]`, `\\{`, `\\}`, `\|`, `\/`
  - : Đại diện cho chính ký tự đó. Ví dụ, `\\` đại diện cho dấu gạch chéo ngược, và `\(` đại diện cho dấu ngoặc đơn mở. Đây là [các ký tự cú pháp](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) trong regexes (`/` là dấu phân giới của một regex literal), vì vậy chúng cần được thoát trừ khi trong một [character class](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class).
- `\xHH`
  - : Đại diện cho ký tự có code point Unicode thập lục phân đã cho. Số thập lục phân phải có đúng hai chữ số.
- `\uHHHH`
  - : Đại diện cho ký tự có code point Unicode thập lục phân đã cho. Số thập lục phân phải có đúng bốn chữ số. Hai escape sequences như vậy có thể được sử dụng để đại diện cho một surrogate pair trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode). (Trong Unicode-unaware mode, chúng luôn là hai ký tự riêng biệt.)
- `\u{H…H}`
  - : (Chỉ [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode)) Đại diện cho ký tự có code point Unicode thập lục phân đã cho. Số thập lục phân có thể từ 1 đến 6 chữ số.

Trong [Unicode-unaware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), các escape sequences không phải một trong số các trường hợp trên trở thành _identity escapes_: chúng đại diện cho ký tự theo sau dấu gạch chéo ngược. Ví dụ, `\a` đại diện cho ký tự `a`. Hành vi này giới hạn khả năng giới thiệu các escape sequences mới mà không gây ra các vấn đề tương thích ngược, và do đó bị cấm trong Unicode-aware mode.

Trong Unicode-unaware mode, `]`, `{`, và `}` có thể xuất hiện [theo nghĩa đen](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character) nếu không thể phân tích chúng như sự kết thúc của character class hoặc dấu phân giới quantifier. Đây là [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

Trong Unicode-unaware mode, các escape sequences trong [character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class) có dạng `\cX` trong đó `X` là một số hoặc `_` được giải mã theo cùng cách như những cái có các chữ cái {{Glossary("ASCII")}}: `\c0` giống như `\cP` khi lấy modulo 32. Ngoài ra, nếu dạng `\cX` gặp phải ở bất kỳ đâu mà `X` không phải là một trong các ký tự được nhận diện, thì dấu gạch chéo ngược được xử lý như ký tự literal. Các cú pháp này cũng không dùng nữa.

```js
/[\c0]/.test("\x10"); // true
/[\c_]/.test("\x1f"); // true
/[\c*]/.test("\\"); // true
/\c/.test("\\c"); // true
/\c0/.test("\\c0"); // true (the \c0 syntax is only supported in character classes)
```

## Ví dụ

### Sử dụng character escapes

Character escapes hữu ích khi bạn muốn khớp một ký tự không dễ biểu diễn ở dạng literal của nó. Ví dụ, bạn không thể sử dụng ngắt dòng theo nghĩa đen trong một regex literal, vì vậy bạn phải sử dụng character escape:

```js
const pattern = /a\nb/;
const string = `a
b`;
console.log(pattern.test(string)); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Character class escape: `\d`, `\D`, `\w`, `\W`, `\s`, `\S`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape)
- [Literal character: `a`, `b`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character)
- [Unicode character class escape: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
- [Backreference: `\1`, `\2`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference)
- [Named backreference: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
- [Word boundary assertion: `\b`, `\B`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Word_boundary_assertion)
