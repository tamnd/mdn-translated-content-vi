---
title: "SyntaxError: missing : after property id"
slug: Web/JavaScript/Reference/Errors/Missing_colon_after_property_id
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "missing : after property id" xảy ra khi đối tượng được tạo bằng cú pháp [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer). Dấu hai chấm (`:`) phân tách khóa và giá trị cho các thuộc tính của đối tượng. Đôi khi dấu hai chấm này bị thiếu hoặc đặt sai vị trí.

## Thông báo

```plain
SyntaxError: Invalid shorthand property initializer (V8-based)
SyntaxError: missing : after property id (Firefox)
SyntaxError: Unexpected token '='. Expected a ':' following the property name 'x'. (Safari)
SyntaxError: Unexpected token '+'. Expected an identifier as property name. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Khi tạo đối tượng bằng cú pháp [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer), dấu hai chấm (`:`) phân tách khóa và giá trị cho các thuộc tính của đối tượng.

```js
const obj = { propertyKey: "value" };
```

## Ví dụ

### Dấu hai chấm so với dấu bằng

Đoạn code này thất bại vì dấu bằng không thể dùng theo cách này trong cú pháp object initializer.

```js-nolint example-bad
const obj = { propertyKey = "value" };
// SyntaxError: missing : after property id
```

Cách đúng là dùng dấu hai chấm, hoặc dùng dấu ngoặc vuông để gán thuộc tính mới sau khi đối tượng đã được tạo.

```js example-good
const obj = { propertyKey: "value" };
```

Hoặc:

```js
const obj = {};
obj.propertyKey = "value";
```

### Thuộc tính tính toán

Nếu bạn tạo khóa thuộc tính từ một biểu thức, bạn cần dùng dấu ngoặc vuông. Nếu không, tên thuộc tính không thể được tính toán:

```js-nolint example-bad
const obj = { "b"+"ar": "foo" };
// SyntaxError: missing : after property id
```

Đặt biểu thức trong dấu ngoặc vuông `[]`:

```js example-good
const obj = { ["b" + "ar"]: "foo" };
```

## Xem thêm

- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
