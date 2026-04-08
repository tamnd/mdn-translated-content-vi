---
title: "SyntaxError: property name __proto__ appears more than once in object literal"
slug: Web/JavaScript/Reference/Errors/Duplicate_proto
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "property name \_\_proto\_\_ appears more than once in object literal" xảy ra khi một [object literal](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) chứa nhiều lần xuất hiện của trường `__proto__`, vốn được dùng để [đặt prototype của đối tượng mới này](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#prototype_setter).

## Thông báo

```plain
SyntaxError: Duplicate __proto__ fields are not allowed in object literals (V8-based)
SyntaxError: property name __proto__ appears more than once in object literal (Firefox)
SyntaxError: Attempted to redefine __proto__ property. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Khóa `__proto__`, không giống các khóa thuộc tính khác, là một cú pháp đặc biệt trong object literal. Nó được dùng để đặt prototype của đối tượng đang được tạo và không được phép xuất hiện nhiều hơn một lần trong object literal. Lưu ý rằng hạn chế này chỉ áp dụng cho cú pháp prototype setter `__proto__`: nếu nó thực sự có tác dụng tạo ra một thuộc tính có tên `__proto__`, thì nó có thể xuất hiện nhiều lần. Xem [prototype setter](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#prototype_setter) để biết các hạn chế cú pháp chính xác.

Đáng chú ý là khóa `__proto__` trong object literal là một cú pháp đặc biệt và không bị deprecated, khác với thuộc tính accessor [`Object.prototype.__proto__`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/proto).

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
const obj = { __proto__: {}, __proto__: { a: 1 } };
```

### Các trường hợp hợp lệ

```js example-good
// Only setting the prototype once
const obj = { __proto__: { a: 1 } };

// These syntaxes all create a property called "__proto__" and can coexist
// They would overwrite each other and the last one is actually used
const __proto__ = null;
const obj2 = {
  ["__proto__"]: {},
  __proto__,
  __proto__() {},
  get __proto__() {
    return 1;
  },
};
```

## Xem thêm

- [Object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer)
- [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
