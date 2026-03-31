---
title: "SyntaxError: invalid range in character class"
slug: Web/JavaScript/Reference/Errors/Regex_invalid_range_in_character_class
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid range in character class" xảy ra khi một [lớp ký tự](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class) trong biểu thức chính quy sử dụng một phạm vi, nhưng điểm bắt đầu của phạm vi lớn hơn điểm kết thúc.

## Thông báo

```plain
SyntaxError: Invalid regular expression: /[2-1]/: Range out of order in character class (V8-based)
SyntaxError: invalid range in character class (Firefox)
SyntaxError: Invalid regular expression: range out of order in character class (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Trong lớp ký tự, bạn có thể kết hợp hai ký tự với dấu gạch ngang `-` để đại diện cho một khoảng các ký tự dựa trên các điểm mã Unicode của chúng. Ví dụ, `[a-z]` khớp với bất kỳ chữ thường nào. Tuy nhiên, nếu cuối phạm vi nhỏ hơn đầu phạm vi, phạm vi đó không thể khớp với bất kỳ thứ gì và rất có thể là một lỗi.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
/[9-1]/; // Phạm vi không theo thứ tự
/[_-=]/; // _ có giá trị 95, = có giá trị 61
```

### Các trường hợp hợp lệ

```js example-good
/[1-9]/; // Hoán đổi phạm vi
/[_\-=]/; // Thoát dấu gạch ngang để nó khớp với ký tự đặc biệt
```

## Xem thêm

- [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions)
- [Lớp ký tự: `[...]`, `[^...]`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class)
