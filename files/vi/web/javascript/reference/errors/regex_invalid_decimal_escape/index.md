---
title: "SyntaxError: invalid decimal escape in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_decimal_escape
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid decimal escape in regular expression" xảy ra khi một [chuỗi thoát bát phân cũ](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#escape_sequences) được sử dụng trong một mẫu biểu thức chính quy [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode).

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\00/u: Invalid decimal escape (V8-based)
SyntaxError: invalid decimal escape in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid octal escape for Unicode pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong biểu thức chính quy, `\0` được theo sau bởi một chữ số khác là _chuỗi thoát bát phân cũ_. Cú pháp tương tự bị cấm trong các chuỗi template và chuỗi ký tự chế độ strict. Trong regex, tính năng này bị vô hiệu hóa bởi các chế độ nhận biết Unicode (`u` và `v`). `\0` _không_ được theo sau bởi một chữ số khác là một chuỗi thoát hợp lệ đại diện cho ký tự null (U+0000).

`\` được theo sau bởi một chữ số khác 0 là một [tham chiếu ngược](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Backreference), và không hợp lệ trong chế độ nhận biết Unicode nếu nó không tham chiếu đến một nhóm bắt giữ; xem [thoát nhận dạng không hợp lệ](/en-US/docs/Web/JavaScript/Reference/Errors/Regex_invalid_identity_escape) để biết thêm thông tin.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/\00/u;
/\01/u;
```

### Các trường hợp hợp lệ

```js example-good
// Nếu bạn muốn khớp NULL theo sau là một chữ số, sử dụng lớp ký tự
/[\0]0/u;
// Nếu bạn muốn khớp một ký tự theo giá trị ký tự của nó, sử dụng \x
/\x01/u;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences)
- [Thoát ký tự: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
