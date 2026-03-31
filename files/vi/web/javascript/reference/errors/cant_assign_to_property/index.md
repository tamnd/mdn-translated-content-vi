---
title: 'TypeError: can''t assign to property "x" on "y": not an object'
slug: Web/JavaScript/Reference/Errors/Cant_assign_to_property
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript strict mode "can't assign to property" xảy ra khi cố gắng
tạo một thuộc tính trên giá trị [nguyên thủy](/en-US/docs/Glossary/Primitive)
như [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol), [string](/en-US/docs/Glossary/String), [number](/en-US/docs/Glossary/Number) hoặc [boolean](/en-US/docs/Glossary/Boolean). Các giá trị [nguyên thủy](/en-US/docs/Glossary/Primitive) không thể chứa bất kỳ [thuộc tính](/en-US/docs/Glossary/Property/JavaScript) nào.

## Thông báo

```plain
TypeError: Cannot create property 'x' on number '1' (V8-based)
TypeError: can't assign to property "x" on 1: not an object (Firefox)
TypeError: Attempted to assign to readonly property. (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}.

## Nguyên nhân?

Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), một {{jsxref("TypeError")}} được phát sinh khi cố gắng
tạo một thuộc tính trên giá trị [nguyên thủy](/en-US/docs/Glossary/Primitive) như
[symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol), [string](/en-US/docs/Glossary/String), [number](/en-US/docs/Glossary/Number) hoặc [boolean](/en-US/docs/Glossary/Boolean). Các giá trị [nguyên thủy](/en-US/docs/Glossary/Primitive) không thể chứa bất kỳ [thuộc tính](/en-US/docs/Glossary/Property/JavaScript) nào.

Vấn đề có thể là một giá trị không mong đợi đang chảy đến một nơi không mong đợi, hoặc
một biến thể đối tượng của {{jsxref("String")}} hoặc {{jsxref("Number")}} được mong đợi.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
"use strict";

const foo = "my string";
// The following line does nothing if not in strict mode.
foo.bar = {}; // TypeError: can't assign to property "bar" on "my string": not an object
```

### Sửa vấn đề

Hãy sửa code để ngăn [giá trị nguyên thủy](/en-US/docs/Glossary/Primitive) được sử dụng ở những nơi như vậy, hoặc sửa vấn đề bằng cách tạo đối tượng tương đương {{jsxref("Object")}}.

```js example-good
"use strict";

const foo = new String("my string");
foo.bar = {};
```

## Xem thêm

- [Strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)
- [primitive](/en-US/docs/Glossary/Primitive)
