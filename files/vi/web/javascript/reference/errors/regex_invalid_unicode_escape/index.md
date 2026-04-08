---
title: "SyntaxError: invalid unicode escape in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_unicode_escape
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid unicode escape in regular expression" xảy ra khi các chuỗi thoát ký tự `\c` và `\u` không được theo sau bởi các ký tự hợp lệ.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\u{123456}/u: Invalid Unicode escape (V8-based)
SyntaxError: invalid unicode escape in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid Unicode code point \u{} escape (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong [chế độ nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), [chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences) `\c` phải được theo sau bởi một chữ cái từ `A` đến `Z` hoặc `a` đến `z`, và chuỗi thoát `\u` phải được theo sau bởi 4 chữ số thập lục phân hoặc 1 đến 6 chữ số thập lục phân được bao trong dấu ngoặc nhọn (`{}`). Hơn nữa, khi sử dụng chuỗi thoát `\u{xxx}`, các chữ số phải đại diện cho một điểm mã Unicode hợp lệ, nghĩa là giá trị của nó không được vượt quá `10FFFF`.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/\u{123456}/u; // Điểm mã Unicode quá lớn
/\u65/u; // Không đủ chữ số
/\c1/u; // Không phải chữ cái
```

### Các trường hợp hợp lệ

```js example-good
/\u0065/u; // Chữ thường "e"
/\u{1f600}/u; // Biểu tượng cảm xúc mặt cười
/\cA/u; // U+0001 (Start of Heading)
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Thoát ký tự: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
