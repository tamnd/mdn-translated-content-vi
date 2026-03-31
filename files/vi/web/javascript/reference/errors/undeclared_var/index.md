---
title: 'ReferenceError: assignment to undeclared variable "x"'
slug: Web/JavaScript/Reference/Errors/Undeclared_var
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "Assignment to undeclared variable" xảy ra khi giá trị được gán cho một biến chưa được khai báo.

## Thông báo

```plain
ReferenceError: x is not defined (V8-based)
ReferenceError: assignment to undeclared variable x (Firefox)
ReferenceError: Can't find variable: x (Safari)
```

## Loại lỗi

{{jsxref("ReferenceError")}} chỉ trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Điều gì đã xảy ra?

Bạn có một phép gán dạng `x = ...`, nhưng `x` chưa được khai báo trước với từ khóa `var`, `let`, hoặc `const`. Lỗi này chỉ xảy ra trong [code chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Trong code không phải strict, việc gán cho biến chưa được khai báo sẽ tạo ngầm một thuộc tính trên phạm vi toàn cục.

## Ví dụ

### Các trường hợp không hợp lệ

Trong trường hợp này, biến "bar" là một biến chưa được khai báo.

```js example-bad
function foo() {
  "use strict";
  bar = true;
}
foo(); // ReferenceError: assignment to undeclared variable bar
```

### Các trường hợp hợp lệ

Để làm cho "bar" là một biến được khai báo, bạn có thể thêm từ khóa [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/var), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) trước nó.

```js example-good
function foo() {
  "use strict";
  const bar = true;
}
foo();
```

## Xem thêm

- [Chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var)
- [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let)
- [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const)
