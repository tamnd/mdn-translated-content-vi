---
title: 'SyntaxError: "x" is a reserved identifier'
slug: Web/JavaScript/Reference/Errors/Reserved_identifier
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "_biến_ is a reserved identifier" xảy ra khi các [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords) được sử dụng làm định danh.

## Thông báo

```plain
SyntaxError: Unexpected reserved word (V8-based)
SyntaxError: implements is a reserved identifier (Firefox)
SyntaxError: Cannot use the reserved word 'implements' as a variable name. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

[Các từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#keywords) sẽ gây ra lỗi nếu chúng được sử dụng làm định danh. Những từ khóa này bị dành riêng trong cả strict mode và sloppy mode:

- `enum`

Những từ khóa sau chỉ bị dành riêng khi chúng xuất hiện trong code strict mode:

- `implements`
- `interface`
- {{jsxref("Statements/let", "let")}}
- `package`
- `private`
- `protected`
- `public`
- `static`

## Ví dụ

### Các từ khóa dành riêng trong strict và non-strict mode

Định danh `enum` thường bị dành riêng.

```js-nolint example-bad
const enum = { RED: 0, GREEN: 1, BLUE: 2 };
// SyntaxError: enum is a reserved identifier
```

Trong code strict mode, nhiều định danh hơn bị dành riêng.

```js-nolint example-bad
"use strict";
const package = ["potatoes", "rice", "fries"];
// SyntaxError: package is a reserved identifier
```

Bạn cần đổi tên các biến này.

```js example-good
const colorEnum = { RED: 0, GREEN: 1, BLUE: 2 };
const list = ["potatoes", "rice", "fries"];
```

### Cập nhật trình duyệt cũ hơn

Nếu bạn đang sử dụng trình duyệt cũ chưa triển khai
[`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let) hoặc
[`class`](/en-US/docs/Web/JavaScript/Reference/Statements/class),
bạn nên cập nhật lên phiên bản trình duyệt mới hơn có hỗ trợ các tính năng ngôn ngữ mới này.

```js
"use strict";
class DocArchiver {}

// SyntaxError: class is a reserved identifier
// (chỉ xảy ra trong các trình duyệt cũ hơn, ví dụ: Firefox 44 và cũ hơn)
```

## Xem thêm

- [Lexical grammar](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar)
