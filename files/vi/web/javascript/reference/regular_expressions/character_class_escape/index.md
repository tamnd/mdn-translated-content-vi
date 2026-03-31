---
title: "Character class escape: \\d, \\D, \\w, \\W, \\s, \\S"
slug: Web/JavaScript/Reference/Regular_expressions/Character_class_escape
page-type: javascript-language-feature
browser-compat: javascript.regular_expressions.character_class_escape
sidebar: jssidebar
---

Một **character class escape** là một escape sequence đại diện cho một tập hợp ký tự.

## Cú pháp

```regex
\d, \D
\s, \S
\w, \W
```

> [!NOTE]
> `,` không phải là một phần của cú pháp.

## Mô tả

Không giống như [character escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape), character class escapes đại diện cho một _tập hợp_ ký tự được định nghĩa sẵn, giống như một [character class](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class). Các character classes sau được hỗ trợ:

- `\d`
  - : Khớp bất kỳ ký tự chữ số nào. Tương đương với `[0-9]`.
- `\w`
  - : Khớp bất kỳ ký tự từ nào, trong đó ký tự từ bao gồm các chữ cái (A–Z, a–z), số (0–9), và dấu gạch dưới (\_). Nếu regex là [Unicode-aware](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) và flag [`i`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/ignoreCase) được đặt, nó cũng khớp với các ký tự Unicode khác được chuẩn hóa thành một trong các ký tự trên thông qua [case folding](https://unicode.org/Public/UCD/latest/ucd/CaseFolding.txt).
- `\s`
  - : Khớp bất kỳ ký tự [khoảng trắng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#white_space) hoặc [ký tự kết thúc dòng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#line_terminators) nào.

Các dạng chữ hoa `\D`, `\W`, và `\S` tạo ra các character classes bổ sung cho `\d`, `\w`, và `\s` tương ứng. Chúng khớp bất kỳ ký tự nào không nằm trong tập hợp ký tự được khớp bởi dạng chữ thường.

[Unicode character class escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) bắt đầu bằng `\p` và `\P`, nhưng chúng chỉ được hỗ trợ trong [Unicode-aware mode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode). Trong Unicode-unaware mode, chúng là [identity escapes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) cho ký tự `p` hoặc `P`.

Character class escapes có thể được sử dụng trong [character classes](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class). Tuy nhiên, chúng không thể được sử dụng làm ranh giới của các dải ký tự, điều này chỉ được phép như một [cú pháp không dùng nữa để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào nó.

## Ví dụ

### Tách theo khoảng trắng

Ví dụ sau tách một chuỗi thành một mảng các từ, hỗ trợ tất cả các loại dấu phân cách khoảng trắng:

```js
function splitWords(str) {
  return str.split(/\s+/);
}

splitWords(`Look at the stars
Look  how they\tshine for you`);
// ['Look', 'at', 'the', 'stars', 'Look', 'how', 'they', 'shine', 'for', 'you']
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Character classes](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- [Regular expressions](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Character class: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Unicode character class escape: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
- [Character escape: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Disjunction: `|`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction)
