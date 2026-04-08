---
title: "SyntaxError: invalid regexp group"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_group
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid regexp group" xảy ra khi chuỗi `(?` không bắt đầu một cú pháp nhóm hợp lệ. Các cú pháp nhóm được nhận ra bắt đầu bằng `(?` bao gồm:

- `(?:` cho [nhóm không bắt giữ](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
- `(?=` cho [nhìn trước dương](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- `(?!` cho nhìn trước âm
- `(?<=` cho [nhìn sau dương](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
- `(?<!` cho nhìn sau âm
- `(?<` cho [nhóm bắt giữ được đặt tên](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
- `(?-i:`, `(?i:`, `(?m:`, `(?ims-:`, v.v. cho [bộ điều chỉnh](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier)

`(?` theo sau bởi bất kỳ ký tự nào khác sẽ gây ra lỗi này.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /(?1)/: Invalid group (V8-based)
SyntaxError: invalid regexp group (Firefox)
SyntaxError: Invalid regular expression: unrecognized character after (? (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

`?` không phải là [nguyên tử](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#atoms), vì vậy không có ý nghĩa gì khi xuất hiện ở đầu của một [nhóm bắt giữ](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group) (`?` là [bộ định lượng](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Quantifier) và nên đặt sau một nguyên tử). Có thể bạn muốn khớp ký tự `?` theo nghĩa đen, trong trường hợp đó bạn nên thoát nó bằng dấu gạch chéo ngược (`\?`). Có thể bạn nhớ nhầm cú pháp regex và bạn muốn sử dụng một trong các cú pháp nhóm được nhận ra ở trên. Có thể bạn đang sử dụng một tính năng không được hỗ trợ bởi engine JavaScript hiện tại.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/Hello(?|!)/;
// Đây là cú pháp Perl
/(?[\p{Thai}&\p{Digit}])/;
```

### Các trường hợp hợp lệ

```js example-good
/Hello(\?|!)/;
// Đây là cú pháp JavaScript cho các phép toán tập hợp ký tự
/[\p{Thai}&&\p{Digit}]/v;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Nhóm bắt giữ: `(...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Capturing_group)
- [Khẳng định nhìn trước: `(?=...)`, `(?!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookahead_assertion)
- [Khẳng định nhìn sau: `(?<=...)`, `(?<!...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Lookbehind_assertion)
- [Bộ điều chỉnh: `(?ims-ims:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Modifier)
- [Nhóm bắt giữ được đặt tên: `(?<name>...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Named_capturing_group)
- [Nhóm không bắt giữ: `(?:...)`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Non-capturing_group)
