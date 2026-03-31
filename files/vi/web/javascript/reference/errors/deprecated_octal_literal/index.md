---
title: 'SyntaxError: "0"-prefixed octal literals are deprecated'
slug: Web/JavaScript/Reference/Errors/Deprecated_octal_literal
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript chỉ xảy ra trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "0-prefixed octal literals are deprecated; use the "0o" prefix instead" xảy ra khi các ký tự bát phân lỗi thời (`0` theo sau bởi chữ số) được sử dụng.

## Thông báo

```plain
SyntaxError: Octal literals are not allowed in strict mode. (V8-based)
SyntaxError: Decimals with leading zeros are not allowed in strict mode. (V8-based)
SyntaxError: Unexpected number (V8-based)
SyntaxError: "0"-prefixed octal literals are deprecated; use the "0o" prefix instead (Firefox)
SyntaxError: Decimal integer literals with a leading zero are forbidden in strict mode (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}} chỉ trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Điều gì đã xảy ra?

Các ký tự bát phân đã lỗi thời. Khi bạn thêm tiền tố `0` vào một số nguyên thập phân, bạn thực sự đổi nó thành một ký tự bát phân, điều này có thể gây bất ngờ. Cú pháp chuẩn sử dụng số 0 đứng đầu theo sau bởi chữ cái Latin viết thường hoặc viết hoa "O" (`0o` hoặc `0O`).

Số 0 đứng đầu luôn bị cấm, ngay cả khi ký tự không phải là cú pháp ký tự bát phân hợp lệ (chẳng hạn khi ký tự chứa các chữ số `8` hoặc `9`, hoặc có dấu thập phân). Một ký tự số chỉ có thể bắt đầu bằng `0` nếu số 0 đó là vị trí đơn vị của nó.

## Ví dụ

### Ký tự bát phân có tiền tố "0"

```js-nolint example-bad
"use strict";

03;

// SyntaxError: "0"-prefixed octal literals are deprecated; use the "0o" prefix instead
```

### Số bát phân hợp lệ

Sử dụng số 0 đứng đầu theo sau bởi chữ cái "o" hoặc "O":

```js example-good
0o3;
```

## Xem thêm

- [Ngữ pháp từ vựng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#octal)
