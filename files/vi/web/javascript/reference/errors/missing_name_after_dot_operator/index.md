---
title: "SyntaxError: missing name after . operator"
slug: Web/JavaScript/Reference/Errors/Missing_name_after_dot_operator
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing name after . operator" xảy ra khi có vấn đề với cách sử dụng toán tử chấm (`.`) cho [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors).

## Thông báo

```plain
SyntaxError: missing name after . operator (Firefox)
SyntaxError: Unexpected token '['. Expected a property name after '.'. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Toán tử chấm (`.`) được dùng để [truy cập thuộc tính](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Bạn phải chỉ định tên của thuộc tính muốn truy cập. Để truy cập thuộc tính được tính toán, bạn có thể cần thay đổi từ dùng dấu chấm sang dùng dấu ngoặc vuông. Những dấu ngoặc vuông này cho phép tính toán một biểu thức. Có thể bạn định nối chuỗi? Trong trường hợp đó cần dùng toán tử cộng (`+`). Xem các ví dụ bên dưới.

## Ví dụ

### Truy cập thuộc tính

[Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) trong JavaScript sử dụng dấu chấm (.) hoặc dấu ngoặc vuông (`[]`), nhưng không dùng cả hai cùng lúc. Dấu ngoặc vuông cho phép truy cập thuộc tính được tính toán.

```js-nolint example-bad
const obj = { foo: { bar: "baz", bar2: "baz2" } };
const i = 2;

obj.[foo].[bar]
// SyntaxError: missing name after . operator

obj.foo."bar"+i;
// SyntaxError: missing name after . operator
```

Để sửa code này, bạn cần truy cập đối tượng như sau:

```js example-good
obj.foo.bar; // "baz"
// hoặc
obj["foo"]["bar"]; // "baz"

// thuộc tính tính toán cần dấu ngoặc vuông
obj.foo["bar" + i]; // "baz2"
// hoặc dùng template literal
obj.foo[`bar${i}`]; // "baz2"
```

### Truy cập thuộc tính so với nối chuỗi

Nếu bạn đến từ ngôn ngữ lập trình khác (như [PHP](/en-US/docs/Glossary/PHP)), cũng dễ nhầm lẫn toán tử chấm (`.`) với toán tử nối chuỗi (`+`).

```js-nolint example-bad
console.log("Hello" . "world");

// SyntaxError: missing name after . operator
```

Thay vào đó bạn cần dùng dấu cộng để nối chuỗi:

```js example-good
console.log("Hello" + "World");
```

## Xem thêm

- [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors)
