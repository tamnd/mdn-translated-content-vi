---
title: "SyntaxError: invalid character in class in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_char_in_class
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid character in class in regular expression" xảy ra khi một ký tự xuất hiện trong [lớp ký tự chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class) nhưng không được phép xuất hiện theo nghĩa đen.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /[|]/v: Invalid character in character class (V8-based)
SyntaxError: invalid character in class in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid class set character (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Thông thường, lớp ký tự có thể chứa hầu hết các ký tự theo nghĩa đen. Tuy nhiên, chế độ `v` làm cho cú pháp lớp ký tự phức tạp hơn, và để dành không gian cho các phần mở rộng cú pháp trong tương lai, một số ký tự cú pháp bị cấm xuất hiện theo nghĩa đen trong lớp ký tự. Chúng bao gồm: `(`, `)`, `[`, `]`, `{`, `}`, `/`, `-`, `|`. Nếu bạn muốn khớp với các ký tự đặc biệt này theo nghĩa đen, hãy thoát chúng; ví dụ: `/[\|]/v`.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/[(){}]/v;
```

### Các trường hợp hợp lệ

<!-- Note: the {} need to be double-escaped, once for Yari -->

```js example-good
/[\(\)\\{\\}]/v;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Lớp ký tự: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
