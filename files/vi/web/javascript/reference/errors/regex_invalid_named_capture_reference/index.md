---
title: "SyntaxError: invalid named capture reference in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_named_capture_reference
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid named capture reference in regular expression" xảy ra khi một mẫu biểu thức chính quy chứa một [tham chiếu ngược được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference) không tham chiếu đến một [nhóm bắt giữ được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) trước nó. Thông báo lỗi tương tự "invalid named reference in regular expression" được ném ra khi chuỗi `\k` được gặp nhưng không được theo sau bởi `<`.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\k<x>/u: Invalid named capture referenced (V8-based)
SyntaxError: invalid named capture reference in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid \k<> named backreference (Safari)

SyntaxError: Invalid regular expression: /\k/u: Invalid named reference (V8-based)
SyntaxError: invalid named reference in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid escaped character for Unicode pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Bạn đang sử dụng chuỗi thoát `\k` được phân tích là [tham chiếu ngược được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference), nhưng `\k` hoặc không hợp lệ về mặt cú pháp hoặc không tham chiếu đến một nhóm bắt giữ được đặt tên trong mẫu.

`\k` chỉ bắt đầu một tham chiếu ngược được đặt tên khi mẫu chứa một [nhóm bắt giữ được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) hoặc khi mẫu [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode); nếu không, đây là một [thoát nhận dạng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences) cho ký tự `k`.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/\k<x>/u; // Không tham chiếu đến một nhóm bắt giữ được đặt tên
/(?<x>.+)\k<y>/u; // Không tham chiếu đến một nhóm bắt giữ được đặt tên hiện có
/(?<x>.+)\k{x}/u; // Cú pháp không hợp lệ
```

### Các trường hợp hợp lệ

```js example-good
/(?<x>.+)\k<x>/u; // Tham chiếu đến một nhóm bắt giữ được đặt tên hiện có
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Tham chiếu ngược được đặt tên: `\k<name>`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference)
- [Nhóm bắt giữ được đặt tên: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
