---
title: "TypeError: invalid 'instanceof' operand 'x'"
slug: Web/JavaScript/Reference/Errors/invalid_right_hand_side_instanceof_operand
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "invalid 'instanceof' operand" xảy ra khi toán hạng bên phải của [toán tử `instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) không phải là một đối tượng constructor, tức là một đối tượng có thuộc tính `prototype` và có thể gọi được.

## Thông báo

```plain
TypeError: Right-hand side of 'instanceof' is not an object (V8-based)
TypeError: invalid 'instanceof' operand "x" (Firefox)
TypeError: Right hand side of instanceof is not an object (Safari)

TypeError: Right-hand side of 'instanceof' is not callable (V8-based)
TypeError: x is not a function (Firefox)
TypeError: x is not a function. (evaluating 'x instanceof y') (Safari)

TypeError: Function has non-object prototype 'undefined' in instanceof check (V8-based)
TypeError: 'prototype' property of x is not an object (Firefox)
TypeError: instanceof called on an object with an invalid prototype property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

[Toán tử `instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) yêu cầu toán hạng bên phải phải là một đối tượng constructor, tức là một đối tượng có thuộc tính `prototype` và có thể gọi được. Nó cũng có thể là một đối tượng có phương thức [`Symbol.hasInstance`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance). Lỗi này có thể xảy ra nếu:

- Toán hạng bên phải không phải là một đối tượng.
- Toán hạng bên phải không thể gọi được và không có phương thức `Symbol.hasInstance`.
- Toán hạng bên phải có thể gọi được, nhưng thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) của nó không phải là một đối tượng. (Ví dụ: [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) không có thuộc tính `prototype`.)

## Ví dụ

### instanceof so với typeof

```js example-bad
"test" instanceof ""; // TypeError: invalid 'instanceof' operand ""
42 instanceof 0; // TypeError: invalid 'instanceof' operand 0

function Foo() {}
const f = Foo(); // Foo() được gọi và trả về undefined
const x = new Foo();

x instanceof f; // TypeError: invalid 'instanceof' operand f
x instanceof x; // TypeError: x is not a function
```

Để khắc phục những lỗi này, bạn cần thay thế [toán tử `instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) bằng [toán tử `typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof), hoặc đảm bảo bạn sử dụng tên hàm thay vì kết quả của lời gọi hàm đó.

```js example-good
typeof "test" === "string"; // true
typeof 42 === "number"; // true

function Foo() {}
const f = Foo; // Không gọi Foo.
const x = new Foo();

x instanceof f; // true
x instanceof Foo; // true
```

## Xem thêm

- [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof)
- [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof)
