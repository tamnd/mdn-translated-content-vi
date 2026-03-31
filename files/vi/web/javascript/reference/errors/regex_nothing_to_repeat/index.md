---
title: "SyntaxError: nothing to repeat"
slug: Web/JavaScript/Reference/Errors/Regex_nothing_to_repeat
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "nothing to repeat" hoặc "invalid quantifier in regular expression" xảy ra khi một [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) trong biểu thức chính quy được áp dụng cho không có gì hoặc được áp dụng cho một [khẳng định](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#assertions).

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\b+/: Nothing to repeat (V8-based)
SyntaxError: Invalid regular expression: /(?=)+/u: Invalid quantifier (V8-based)
SyntaxError: nothing to repeat (Firefox)
SyntaxError: invalid quantifier in regular expression (Firefox)
SyntaxError: Invalid regular expression: nothing to repeat (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

[Bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) được sử dụng để chỉ định số lần một ký tự hoặc nhóm ký tự có thể xuất hiện trong biểu thức chính quy. Ví dụ, `a{3}` khớp với ký tự `a` đúng ba lần. Do đó, nếu thứ đứng trước bộ định lượng không phải là thứ khớp với ký tự, bộ định lượng không hợp lệ. Ví dụ: bộ định lượng ở đầu của một [nhóm bắt giữ](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group), ở đầu của một [lựa chọn thay thế disjunction](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Disjunction), v.v., không thể lặp lại bất kỳ thứ gì. [Khẳng định](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#assertions) không tiêu thụ ký tự, vì vậy cũng không có ý nghĩa gì khi lặp lại chúng.

Trong [chế độ không nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), có một cú pháp đã lỗi thời cho phép các [khẳng định nhìn trước](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion) được định lượng. Đây là cú pháp đã lỗi thời và bạn không nên dựa vào nó.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/\b+/; // \b là khẳng định ranh giới từ, nó không tiêu thụ ký tự
/(*hello*)/;
```

### Các trường hợp hợp lệ

```js example-good
/b+/; // b là ký tự, nó có thể được lặp lại
/(\*hello\*)/; // Thoát dấu hoa thị để khớp với chúng theo nghĩa đen
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Bộ định lượng: `*`, `+`, `?`, `{n}`, `{n,}`, `{n,m}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier)
