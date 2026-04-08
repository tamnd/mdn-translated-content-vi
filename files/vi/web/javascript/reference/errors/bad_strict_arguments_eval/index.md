---
title: "SyntaxError: 'arguments'/'eval' can't be defined or assigned to in strict mode code"
slug: Web/JavaScript/Reference/Errors/Bad_strict_arguments_eval
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript chỉ dành cho [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) "'arguments' can't be defined or assigned to in strict mode code" hoặc "'eval' can't be defined or assigned to in strict mode code" xảy ra khi cố gắng tạo một {{Glossary("binding")}} có tên `arguments` hoặc `eval`, hoặc gán giá trị cho tên đó.

## Thông báo

```plain
SyntaxError: Unexpected eval or arguments in strict mode (V8-based)
SyntaxError: 'arguments' can't be defined or assigned to in strict mode code (Firefox)
SyntaxError: Cannot modify 'arguments' in strict mode. (Safari)
SyntaxError: Cannot destructure to a parameter name 'arguments' in strict mode. (Safari)
SyntaxError: Cannot declare a variable named arguments in strict mode. (Safari)
SyntaxError: Cannot declare a catch variable named 'arguments' in strict mode. (Safari)
SyntaxError: 'arguments' is not a valid function name in strict mode. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Trong strict mode, tên {{jsxref("Functions/arguments", "arguments")}} và {{jsxref("Global_Objects/eval", "eval")}} hoạt động như thể chúng là [reserved words](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words): bạn không thể làm chúng tham chiếu đến bất cứ điều gì khác ngoài đối tượng `arguments` trong hàm hoặc hàm `eval` toàn cục.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
"use strict";

const arguments = [1, 2, 3];
console.log(Math.max(...arguments));

function foo(...arguments) {
  console.log(arguments);
}
```

### Trường hợp hợp lệ

```js example-good
"use strict";

const args = [1, 2, 3];
console.log(Math.max(...args));

function foo(...args) {
  console.log(args);
}
```

## Xem thêm

- [Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- {{jsxref("Functions/arguments", "arguments")}}
- {{jsxref("Global_Objects/eval", "eval()")}}
