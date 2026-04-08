---
title: "SyntaxError: incomplete quantifier in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_incomplete_quantifier
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "incomplete quantifier in regular expression" xảy ra khi một mẫu biểu thức chính quy chứa `{`, nhưng nó không bắt đầu một [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) hợp lệ.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /1{/u: Incomplete quantifier (V8-based)
SyntaxError: incomplete quantifier in regular expression (Firefox)
SyntaxError: Invalid regular expression: incomplete {} quantifier for Unicode pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Ký tự `{` trong một mẫu biểu thức chính quy bắt đầu một [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier). Một bộ định lượng hợp lệ có dạng `{n}`, `{n,}`, hoặc `{n,m}`, trong đó `n` và `m` là các số nguyên không âm và `m` không nhỏ hơn `n`. Nếu ký tự `{` không bắt đầu một bộ định lượng hợp lệ, sẽ xảy ra `SyntaxError`.

Trong chế độ không nhận biết Unicode, cú pháp này khiến `{` trở thành ký tự đặc biệt thay vì tạo ra lỗi, nhưng đây là [cú pháp đã lỗi thời](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) và bạn không nên dựa vào nó.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/1{/u;
/1{a}/u;
/1{}/u;
/1{1,2,3}/u;
/1{1, 2}/u;
```

### Các trường hợp hợp lệ

```js example-good
/1{1}/u;
/1{1,}/u;
/1{1,2}/u;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Bộ định lượng: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
