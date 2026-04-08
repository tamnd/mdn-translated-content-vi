---
title: "TypeError: 'caller', 'callee', and 'arguments' properties may not be accessed"
slug: Web/JavaScript/Reference/Errors/Deprecated_caller_or_arguments_usage
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript chỉ xảy ra trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them" xảy ra khi các thuộc tính đã lỗi thời {{jsxref("Functions/arguments/callee", "arguments.callee")}}, {{jsxref("Function.prototype.caller")}}, hoặc {{jsxref("Function.prototype.arguments")}} được sử dụng.

## Thông báo

```plain
TypeError: 'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them (V8-based & Firefox)
TypeError: 'arguments', 'callee', and 'caller' cannot be accessed in this context. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}} chỉ trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode).

## Điều gì đã xảy ra?

Trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), các thuộc tính {{jsxref("Functions/arguments/callee", "arguments.callee")}}, {{jsxref("Function.prototype.caller")}}, hoặc {{jsxref("Function.prototype.arguments")}} được sử dụng nhưng không nên. Chúng đã lỗi thời vì chúng làm lộ thông tin về hàm gọi, không chuẩn, khó tối ưu hóa và là tính năng có thể gây hại đến hiệu suất.

## Ví dụ

### Sử dụng function.caller hoặc arguments.callee đã lỗi thời

{{jsxref("Function.prototype.caller")}} và [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee) đã lỗi thời (xem các bài viết tham khảo để biết thêm thông tin).

```js example-bad
"use strict";

function myFunc() {
  if (myFunc.caller === null) {
    return "The function was called from the top!";
  }
  return `This function's caller was ${myFunc.caller}`;
}

myFunc();
// TypeError: 'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them
```

### Function.prototype.arguments

{{jsxref("Function.prototype.arguments")}} đã lỗi thời (xem bài viết tham khảo để biết thêm thông tin).

```js example-bad
"use strict";

function f(n) {
  g(n - 1);
}

function g(n) {
  console.log(`before: ${g.arguments[0]}`);
  if (n > 0) {
    f(n);
  }
  console.log(`after: ${g.arguments[0]}`);
}

f(2);

console.log(`returned: ${g.arguments}`);
// TypeError: 'caller', 'callee', and 'arguments' properties may not be accessed on strict mode functions or the arguments objects for calls to them
```

## Xem thêm

- [Các tính năng đã lỗi thời và lỗi thời](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features)
- [Chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- {{jsxref("Function.prototype.arguments")}}
- {{jsxref("Function.prototype.caller")}}
- [`arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee)
