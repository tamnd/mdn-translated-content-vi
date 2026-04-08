---
title: "SyntaxError: invalid class set operation in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_class_set_operation
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid class set operation in regular expression" xảy ra khi một chuỗi dấu chấm câu kép xuất hiện trong [lớp ký tự chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class) nhưng không được nhận ra bởi cú pháp.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /[&&]/v: Invalid set operation in character class (V8-based)
SyntaxError: invalid class set operation in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid operation in class set (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Có ba trường hợp có thể xảy ra điều này:

- Bạn đang cố sử dụng `&&` hoặc `--`, nhưng cú pháp không đúng. Mỗi toán tử này phải kết hợp hai ký tự hoặc tập hợp ký tự.
- Bạn đang trộn các toán tử ở cùng cấp độ. Ví dụ, `[\w&&[A-z]--_]` không hợp lệ vì nó sử dụng `&&` và `--` ở cùng cấp độ. Bạn cần sử dụng các lớp ký tự lồng nhau để làm rõ nghĩa, chẳng hạn `[\w&&[[A-z]--_]]`. Lưu ý rằng phép hợp sử dụng một toán tử không có văn bản; ví dụ, `[AB&&C]` không hợp lệ vì `A` và `B` được kết hợp ngầm định bởi toán tử hợp. Bạn cần sử dụng `[A[B&&C]]` thay thế.
- Bạn đang sử dụng một chuỗi dấu chấm câu kép không phải là `&&` hoặc `--`. Các chuỗi này được dành cho các phần mở rộng cú pháp trong tương lai. Chúng bao gồm: `&&`, `!!`, `##`, `$$`, `%%`, `**`, `++`, `,,`, `..`, `::`, `;;`, `<<`, `==`, `>>`, `??`, `@@`, `^^`, ` `` `, `~~`. Tuy nhiên, những chuỗi này không có nhiều ý nghĩa và có thể được thay thế bằng một ký tự đơn hoặc khiến hai phạm vi liền kề được hợp nhất.

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Lớp ký tự: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
