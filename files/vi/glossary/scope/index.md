---
title: Phạm vi
slug: Glossary/Scope
page-type: glossary-definition
sidebar: glossarysidebar
---

**Scope** (phạm vi) là ngữ cảnh thực thi hiện tại, trong đó các {{glossary("value","giá trị")}} và biểu thức "hiển thị" hay có thể được tham chiếu. Nếu một {{glossary("variable","biến")}} hay biểu thức không nằm trong phạm vi hiện tại, nó sẽ không thể sử dụng được. Các phạm vi cũng có thể được xếp tầng theo hệ thống phân cấp, sao cho phạm vi con có thể truy cập phạm vi cha, nhưng không theo chiều ngược lại.

JavaScript có các loại phạm vi sau:

- Phạm vi toàn cục (Global scope): Phạm vi mặc định cho tất cả mã chạy ở chế độ script.
- Phạm vi module (Module scope): Phạm vi dành cho mã chạy ở chế độ module.
- Phạm vi hàm (Function scope): Phạm vi được tạo ra bởi một {{glossary("function","hàm")}}.

Ngoài ra, các định danh được khai báo với một số cú pháp nhất định, bao gồm [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), [`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class), hoặc (ở chế độ strict) [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function), có thể thuộc về một phạm vi bổ sung:

- Phạm vi khối (Block scope): Phạm vi được tạo bởi một cặp dấu ngoặc nhọn (một [khối](/en-US/docs/Web/JavaScript/Reference/Statements/block)).

Một {{glossary("function","hàm")}} tạo ra một phạm vi, do đó (chẳng hạn) một biến được khai báo chỉ trong hàm đó không thể truy cập từ bên ngoài hàm hoặc trong các hàm khác. Ví dụ, đoạn mã sau không hợp lệ:

```js example-bad
function exampleFunction() {
  const x = "declared inside function"; // x chỉ có thể dùng trong exampleFunction
  console.log("Inside function");
  console.log(x);
}

console.log(x); // Gây lỗi
```

Tuy nhiên, đoạn mã sau hợp lệ vì biến được khai báo bên ngoài hàm, tức là biến toàn cục:

```js example-good
const x = "declared outside function";

exampleFunction();

function exampleFunction() {
  console.log("Inside function");
  console.log(x);
}

console.log("Outside function");
console.log(x);
```

Khối chỉ giới hạn phạm vi cho khai báo `let` và `const`, nhưng không phải khai báo `var`.

```js example-good
{
  var x = 1;
}
console.log(x); // 1
```

```js example-bad
{
  const x = 1;
}
console.log(x); // ReferenceError: x is not defined
```

## Xem thêm

- [Scope (computer science)](<https://en.wikipedia.org/wiki/Scope_(computer_science)>) trên Wikipedia
- [Quy tắc block scoping](/en-US/docs/Web/JavaScript/Reference/Statements/block#block_scoping_rules_with_let_const_class_or_function_declaration_in_strict_mode)
