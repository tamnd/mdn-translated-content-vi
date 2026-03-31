---
title: "SyntaxError: invalid capture group name in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_capture_group_name
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid capture group name in regular expression" xảy ra khi một [nhóm bắt giữ được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group) hoặc [tham chiếu ngược được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_backreference) chứa một [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) không hợp lệ.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /(?<1>)/: Invalid capture group name (V8-based)
SyntaxError: invalid capture group name in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid group specifier name (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Mỗi nhóm bắt giữ được đặt tên phải có tên là một định danh hợp lệ. Bạn không thể sử dụng các chuỗi tùy ý làm định danh nhóm.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/(?<1>\d+) (?<2>\d+)/;
```

Hoặc bạn có thể đang xây dựng regex động:

```js example-bad
const tokenTypes = {
  "number literal": /\d+/,
  "string literal": /".+?"/,
  identifier: /[a-zA-Z_]\w*/,
};

const tokenPattern = new RegExp(
  Object.entries(tokenTypes)
    .map(([name, pattern]) => `(?<${name}>${pattern.source})`)
    .join("|"),
);
```

### Các trường hợp hợp lệ

```js example-good
/(?<group1>\d+) (?<group2>\d+)/;
```

Nếu regex được xây dựng động, hãy đảm bảo tất cả các tên đều là định danh hợp lệ. Ví dụ:

```js example-good
const tokenTypes = {
  numberLiteral: /\d+/,
  stringLiteral: /".+?"/,
  identifier: /[a-zA-Z_]\w*/,
};

const tokenPattern = new RegExp(
  Object.entries(tokenTypes)
    .map(([name, pattern]) => `(?<${name}>${pattern.source})`)
    .join("|"),
);
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Nhóm bắt giữ được đặt tên: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
