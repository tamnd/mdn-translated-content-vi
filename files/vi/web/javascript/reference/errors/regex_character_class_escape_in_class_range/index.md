---
title: "SyntaxError: character class escape cannot be used in class range in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_character_class_escape_in_class_range
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "character class escape cannot be used in class range in regular expression" xảy ra khi một mẫu biểu thức chính quy [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode) chứa một [lớp ký tự](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class) trong đó ranh giới của một phạm vi ký tự là một lớp ký tự khác, chẳng hạn như [chuỗi thoát lớp ký tự](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class_escape).

## Thông báo

```plain
SyntaxError: Invalid regular expression: /[\s-1]/u: Invalid character class (V8-based)
SyntaxError: character class escape cannot be used in class range in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid range in character class for Unicode pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Một lớp ký tự có thể chỉ định một phạm vi ký tự bằng cách sử dụng dấu gạch ngang (`-`) giữa hai ký tự. Ví dụ, `[a-z]` khớp với bất kỳ chữ thường nào từ `a` đến `z`. Hai ranh giới của phạm vi phải đại diện cho các ký tự đơn để phạm vi có ý nghĩa. Nếu một trong các ranh giới thực sự đại diện cho nhiều ký tự, một lỗi sẽ được tạo ra. Trong [lớp ký tự không phải chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#non-v-mode_character_class), chỉ các chuỗi thoát lớp ký tự được phép bên trong lớp ký tự; trong [lớp ký tự chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class), điều này cũng có thể xảy ra nếu một trong các ranh giới là một lớp ký tự `[...]` khác.

Trong chế độ không nhận biết Unicode, cú pháp này khiến dấu `-` trở thành ký tự đặc biệt thay vì tạo ra lỗi, nhưng đây là [cú pháp đã lỗi thời](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp) và bạn không nên dựa vào nó.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/[\s-_]/u; // \s là chuỗi thoát lớp ký tự cho khoảng trắng
/[A-\D]/u; // \D là chuỗi thoát lớp ký tự cho ký tự không phải chữ số
/[\p{L}-\p{N}]/u; // \p{L} là chuỗi thoát lớp ký tự cho chữ cái Unicode
/[[A-z]-_]/v; // Trong chế độ unicodeSets, lớp ký tự có thể được lồng nhau
```

### Các trường hợp hợp lệ

```js example-good
// Đặt dấu gạch ngang ở đầu lớp ký tự,
// để nó khớp với ký tự đặc biệt
/[-\s_]/u;
// Thoát dấu gạch ngang để nó cũng khớp với ký tự đặc biệt
/[\s\-_]/u;
// Xóa dấu gạch chéo ngược để ranh giới là ký tự đặc biệt
/[A-D]/u;
// Xóa dấu gạch ngang để hai ranh giới đại diện cho hai lựa chọn thay thế
/[\p{L}\p{N}]/u;
// Sử dụng -- trong chế độ unicodeSets, đại diện cho phép trừ tập hợp
/[[A-z]--_]]/v;
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Lớp ký tự: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
