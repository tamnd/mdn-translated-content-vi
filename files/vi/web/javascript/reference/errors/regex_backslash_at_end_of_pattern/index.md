---
title: "SyntaxError: \\ at end of pattern"
slug: Web/JavaScript/Reference/Errors/Regex_backslash_at_end_of_pattern
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "\\ at end of pattern" xảy ra khi một mẫu biểu thức chính quy kết thúc bằng dấu gạch chéo ngược không được thoát (`\`). Trong một ký tự đặc biệt regex literal, dấu gạch chéo ngược sẽ khiến dấu gạch chéo đóng `/` trở thành ký tự đặc biệt, vì vậy điều này chỉ có thể xảy ra khi sử dụng hàm tạo {{jsxref("RegExp/RegExp", "RegExp()")}}.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /\/: \ at end of pattern (V8-based)
SyntaxError: \ at end of pattern (Firefox)
SyntaxError: Invalid regular expression: \ at end of pattern (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Dấu gạch chéo ngược không thể xuất hiện theo nghĩa đen trong biểu thức chính quy. Nó phải đứng trước một ký tự khác để [thoát ký tự đó](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences), hoặc bản thân nó được thoát bằng một dấu gạch chéo ngược khác. Dấu gạch chéo ngược ở cuối mẫu biểu thức chính quy là không hợp lệ vì nó không thoát bất kỳ thứ gì.

## Ví dụ

### Thoát kép dấu gạch chéo ngược

Lỗi này chỉ có thể xảy ra khi sử dụng hàm tạo `RegExp()`. Hãy xem xét đoạn code sau, dự định khớp một ký tự dấu gạch chéo ngược đơn:

```js example-bad
const pattern = new RegExp("\\");
```

Trong chuỗi JavaScript, dấu gạch chéo ngược cũng là chuỗi thoát. Do đó, hai dấu gạch chéo ngược trong chuỗi ký tự `"\\"` được hiểu là một dấu gạch chéo ngược đơn. Hàm tạo `RegExp()` sau đó chỉ thấy một ký tự dấu gạch chéo ngược đơn trong nguồn regex. Để sửa lỗi này, bạn cần thoát kép dấu gạch chéo ngược:

```js example-good
const pattern = new RegExp("\\\\");
```

Bốn dấu gạch chéo ngược trong chuỗi ký tự đại diện cho hai dấu gạch chéo ngược trong nguồn regex, sau đó trở thành một [chuỗi thoát ký tự](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape) cho một ký tự dấu gạch chéo ngược đặc biệt.

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Chuỗi thoát](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences)
