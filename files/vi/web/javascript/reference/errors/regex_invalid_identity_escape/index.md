---
title: "SyntaxError: invalid identity escape in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_identity_escape
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid identity escape in regular expression" xảy ra khi một mẫu biểu thức chính quy [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) chứa một [chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences) không đại diện cho một chuỗi thoát được nhận ra.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\q/u: Invalid escape (V8-based)
SyntaxError: invalid identity escape in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid escaped character for Unicode pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong chế độ không nhận biết Unicode, `\` có thể được sử dụng để thoát bất kỳ ký tự nào, kể cả những ký tự không có nghĩa được định nghĩa. Trong những trường hợp này, ký tự được thoát đại diện cho chính nó. Ví dụ, `\q` sẽ khớp với ký tự `q`. Điều này hạn chế nghiêm trọng khả năng thêm các chuỗi thoát mới trong tương lai, vì vậy trong chế độ nhận biết Unicode, chỉ các chuỗi thoát được nhận ra mới được phép. Đừng thêm `\` một cách thừa thãi.

Lỗi này cũng được ném ra khi chuỗi thoát ký tự `\x` không được theo sau bởi hai chữ số thập lục phân.

Để biết danh sách đầy đủ các chuỗi thoát có sẵn, hãy xem [tài liệu tham khảo biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences). Để biết bảng về các ký tự nào có thể xuất hiện theo nghĩa đen được thoát hoặc không được thoát trong từng ngữ cảnh, hãy xem [ký tự đặc biệt](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character).

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/[\f\v\n\t\ ]/u;
```

### Các trường hợp hợp lệ

```js example-good
// Không cần thoát khoảng trắng
/[\f\v\n\t ]/u;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences)
- [Thoát ký tự: `\n`, `\u{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape)
- [Ký tự đặc biệt: `a`, `b`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Literal_character)
