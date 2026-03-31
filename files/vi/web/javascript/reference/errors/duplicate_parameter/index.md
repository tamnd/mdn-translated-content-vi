---
title: "SyntaxError: duplicate formal argument x"
slug: Web/JavaScript/Reference/Errors/Duplicate_parameter
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "duplicate formal argument x" hoặc "duplicate argument names not allowed in this context" xảy ra khi một hàm tạo ra hai hay nhiều {{Glossary("binding", "ràng buộc")}} tham số có cùng tên, và hàm đó không phải là hàm [không ở chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) với chỉ các tham số đơn giản.

## Thông báo

```plain
SyntaxError: Duplicate parameter name not allowed in this context (V8-based)
SyntaxError: duplicate formal argument x (Firefox)
SyntaxError: duplicate argument names not allowed in this context (Firefox)
SyntaxError: Cannot declare a parameter named 'x' in strict mode as it has already been declared. (Safari)
SyntaxError: Duplicate parameter 'x' not allowed in function with default parameter values. (Safari)
SyntaxError: Duplicate parameter 'x' not allowed in function with a rest parameter. (Safari)
SyntaxError: Duplicate parameter 'x' not allowed in function with destructuring parameters. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Việc có hai tham số chính thức cùng tên rất có thể là một lỗi — lần xuất hiện thứ hai sẽ khiến lần xuất hiện đầu tiên không thể truy cập được qua tên tham số. Trong JavaScript cũ, điều này được cho phép. Do đó, để không phá vỡ code hiện có, đây chỉ là lỗi nếu code được đảm bảo không phải là code cũ — hoặc vì nó ở trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) hoặc nó sử dụng cú pháp tham số hiện đại (tham số [rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), [mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), hoặc [destructured](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)).

## Ví dụ

### Các trường hợp không hợp lệ

```js-nolint example-bad
"use strict";

function add(x, x) {
  // How can you access both "x" parameters?
  // SyntaxError: duplicate formal argument x
}
```

```js-nolint example-bad
function doSomething(name, { name }) {
  // How can you access both "name" parameters?
  // SyntaxError: duplicate argument names not allowed in this context
}
```

### Các trường hợp hợp lệ

```js example-good
function doSomething(operationName, { name: userName }) {
  // You can access both "operationName" and "userName" parameters.
}

function doSomething(name, user) {
  // You can access both "name" and "user.name" parameters.
}
```

## Xem thêm

- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
