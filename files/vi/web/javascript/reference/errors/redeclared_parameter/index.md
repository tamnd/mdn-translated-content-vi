---
title: 'SyntaxError: redeclaration of formal parameter "x"'
slug: Web/JavaScript/Reference/Errors/Redeclared_parameter
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "redeclaration of formal parameter" xảy ra khi cùng tên biến xuất hiện như một tham số hàm và sau đó được khai báo lại bằng cách sử dụng phép gán {{jsxref("Statements/let", "let")}} trong thân hàm.

## Thông báo

```plain
SyntaxError: Identifier "x" has already been declared (V8-based)
SyntaxError: redeclaration of formal parameter "x" (Firefox)
SyntaxError: Cannot declare a let variable twice: 'x'. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Cùng tên biến xuất hiện như một tham số hàm và sau đó được khai báo lại bằng cách sử dụng phép gán {{jsxref("Statements/let", "let")}} trong thân hàm. Việc khai báo lại cùng một biến trong cùng phạm vi hàm hoặc khối bằng `let` không được phép trong JavaScript.

## Ví dụ

### Tham số được khai báo lại

Trong trường hợp này, biến "arg" khai báo lại tham số.

```js-nolint example-bad
function f(arg) {
  let arg = "foo";
}

// SyntaxError: redeclaration of formal parameter "arg"
```

Nếu bạn muốn thay đổi giá trị của "arg" trong thân hàm, bạn có thể làm điều đó, nhưng bạn không cần khai báo lại cùng biến đó. Nói cách khác, bạn có thể bỏ qua từ khóa `let`. Nếu bạn muốn tạo một biến mới, bạn cần đặt tên lại vì nó xung đột với tham số hàm đã có.

```js example-good
function f(arg) {
  arg = "foo";
}

function g(arg) {
  let bar = "foo";
}
```

## Xem thêm

- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/var", "var")}}
- Hướng dẫn [Ngữ pháp và kiểu dữ liệu](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types)
