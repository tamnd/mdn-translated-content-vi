---
title: "SyntaxError: invalid property name in regular expression"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_property_name
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid property name in regular expression" hoặc "invalid class property name in regular expression" xảy ra khi các chuỗi thoát `\p` và `\P` [lớp ký tự Unicode](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) không được theo sau bởi tên thuộc tính Unicode và/hoặc giá trị hợp lệ.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\p{x}/u: Invalid property name (V8-based)
SyntaxError: Invalid regular expression: /[\p{x}]/u: Invalid property name in character class (V8-based)
SyntaxError: invalid property name in regular expression (Firefox)
SyntaxError: invalid class property name in regular expression (Firefox)
SyntaxError: Invalid regular expression: invalid property expression (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong [chế độ nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), các chuỗi thoát `\p` và `\P` được sử dụng để khớp các ký tự hoặc chuỗi ký tự dựa trên các thuộc tính Unicode của chúng. Chuỗi thoát `\p` khớp các ký tự có thuộc tính Unicode được chỉ định, trong khi chuỗi thoát `\P` khớp các ký tự không có thuộc tính Unicode được chỉ định. Cú pháp là:

```regex
\p{loneProperty}
\P{loneProperty}

\p{property=value}
\P{property=value}
```

Nếu không được theo sau bởi `{`, sau đó là tên/giá trị thuộc tính có thể nhận ra, rồi `}`, lỗi cú pháp này sẽ được ném ra. Để biết thêm thông tin về các thuộc tính đơn và tên thuộc tính được phép, hãy xem tài liệu tham khảo [chuỗi thoát lớp ký tự Unicode](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape).

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/\p{x}/u; // "x" không phải là tên thuộc tính Unicode hợp lệ
/\p{Script=x}/u; // "x" không phải là giá trị hợp lệ cho Script
/\property/u; // "\p" không được theo sau bởi cú pháp đúng
/\p{RGI_Emoji_Flag_Sequence}/u;
// "RGI_Emoji_Flag_Sequence" là thuộc tính của chuỗi, vì vậy phải sử dụng cờ "v"
/\P{RGI_Emoji_Flag_Sequence}/v; // \P không thể khớp với thuộc tính của chuỗi
```

### Các trường hợp hợp lệ

```js example-good
/\p{Script=Latin}/u; // "Script=Latin" là thuộc tính Unicode hợp lệ
/\p{Letter}/u; // "Letter" là giá trị hợp lệ cho General_Category
/\p{RGI_Emoji_Flag_Sequence}/v; // Thuộc tính của chuỗi chỉ có thể sử dụng trong chế độ "v"
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Chuỗi thoát lớp ký tự Unicode: `\p{...}`, `\P{...}`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)
