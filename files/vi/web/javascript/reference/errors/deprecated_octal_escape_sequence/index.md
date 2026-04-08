---
title: "SyntaxError: octal escape sequences can't be used in untagged template literals or in strict mode code"
slug: Web/JavaScript/Reference/Errors/Deprecated_octal_escape_sequence
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "octal escape sequences can't be used in untagged template literals or in strict mode code" xảy ra khi các chuỗi thoát bát phân được sử dụng trong chuỗi ký tự [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) hoặc trong template literals không được gắn thẻ.

## Thông báo

```plain
SyntaxError: Octal escape sequences are not allowed in strict mode. (V8-based)
SyntaxError: \8 and \9 are not allowed in strict mode. (V8-based)
SyntaxError: Octal escape sequences are not allowed in template strings. (V8-based)
SyntaxError: \8 and \9 are not allowed in template strings. (V8-based)
SyntaxError: octal escape sequences can't be used in untagged template literals or in strict mode code (Firefox)
SyntaxError: the escapes \8 and \9 can't be used in untagged template literals or in strict mode code (Firefox)
SyntaxError: The only valid numeric escape in strict mode is '\0' (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

[Chuỗi thoát trong chuỗi ký tự](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences) có dạng `\` theo sau bởi bất kỳ số chữ số nào, ngoại trừ một `0` đơn lẻ, đã lỗi thời. Nếu bạn muốn biểu diễn một ký tự theo giá trị code point của nó, bạn nên sử dụng chuỗi thoát `\x` hoặc `\u` thay thế, chẳng hạn như `\x01` hoặc `\u0001` thay vì `\1`.

[Template literals không được gắn thẻ](/en-US/docs/Web/JavaScript/Reference/Template_literals) không bao giờ được phép chứa chuỗi thoát bát phân, dù ở chế độ strict hay không. Tuy nhiên, template literals _được gắn thẻ_ có thể chứa bất kỳ dạng chuỗi thoát nào, và sẽ khiến mảng template mà hàm gắn thẻ nhận được chứa `undefined`.

## Ví dụ

### Chuỗi thoát bát phân

```js-nolint example-bad
"use strict";

"\251";

// SyntaxError: octal escape sequences can't be used in untagged template literals or in strict mode code
```

### Số bát phân hợp lệ

Đối với chuỗi thoát bát phân, bạn có thể sử dụng chuỗi thoát thập lục phân thay thế:

```js example-good
"\xA9";
```

Nếu bạn muốn biểu diễn một số văn bản nguồn theo nghĩa đen mà không diễn giải bất kỳ chuỗi thoát nào, hãy sử dụng {{jsxref("String.raw")}}:

```js example-good
String.raw`\251`; // Một chuỗi chứa bốn ký tự
```

## Xem thêm

- [Ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#escape_sequences)
