---
title: "SyntaxError: raw bracket is not allowed in regular expression with unicode flag"
slug: Web/JavaScript/Reference/Errors/Regex_raw_bracket
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "raw bracket is not allowed in regular expression with unicode flag" xảy ra khi một mẫu biểu thức chính quy [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) chứa dấu ngoặc thô (`{`, `}`, `]`) không phải là một phần của [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) hoặc [lớp ký tự](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class).

## Thông báo

```plain
SyntaxError: Invalid regular expression: /{/u: Lone quantifier brackets (V8-based)
SyntaxError: raw bracket is not allowed in regular expression with unicode flag (Firefox)
SyntaxError: Invalid regular expression: incomplete {} quantifier for Unicode pattern (Safari)
SyntaxError: Invalid regular expression: unmatched ] or } bracket for Unicode pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong chế độ không nhận biết Unicode, `{`, `}`, và `]` không phải là một phần của bộ định lượng hoặc lớp ký tự được coi là ký tự đặc biệt. Điều này có thể ẩn lỗi trong code của bạn và do đó đã bị phản đối và không được phép trong chế độ nhận biết Unicode. Bạn nên kiểm tra xem bạn có cú pháp không hợp lệ hay bạn nên [thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) các ký tự để khớp với chúng theo nghĩa đen.

Nếu `{` xuất hiện trong một ngữ cảnh chấp nhận [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier), nó được coi là phần bắt đầu của bộ định lượng. Nếu những gì theo sau nó không phải là bộ định lượng hợp lệ, một lỗi cú pháp khác, [bộ định lượng chưa hoàn chỉnh](/en-US/docs/Web/JavaScript/Reference/Errors/Regex_incomplete_quantifier), sẽ được ném ra.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/\{{MDN_Macro}}/u;
/\[sic]/u;
```

### Các trường hợp hợp lệ

<!-- Note: the {} need to be double-escaped, once for Yari -->

```js example-good
// Tất cả { và } cần được thoát
/\\{\\{MDN_Macro\\}\\}/u;
// ] cần được thoát
/\[sic\]/u;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Lớp ký tự: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
- [Thoát ký tự: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Bộ định lượng: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
