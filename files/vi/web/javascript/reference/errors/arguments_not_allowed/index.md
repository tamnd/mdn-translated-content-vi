---
title: "SyntaxError: arguments is not valid in fields"
slug: Web/JavaScript/Reference/Errors/Arguments_not_allowed
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "SyntaxError: arguments is not valid in fields" xảy ra khi định danh [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) được đọc trong bộ khởi tạo trường class hoặc trong khối khởi tạo tĩnh, bên ngoài một hàm không phải [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

## Thông báo

```plain
SyntaxError: 'arguments' is not allowed in class field initializer or static initialization block (V8-based)
SyntaxError: arguments is not valid in fields (Firefox)
SyntaxError: Unexpected identifier 'arguments'. Cannot reference 'arguments' in class field initializer. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Biểu thức bộ khởi tạo trường class hoặc khối khởi tạo tĩnh của class không có `arguments` trong phạm vi của nó. Việc cố gắng truy cập nó là một lỗi cú pháp.

- Điều này đúng ngay cả khi `arguments` được liên kết trong phạm vi cha (chẳng hạn khi class được lồng bên trong một hàm không phải arrow function).
- Hàm không phải arrow function được khai báo trong phạm vi này vẫn sẽ liên kết `arguments` của chính nó và đọc nó bình thường.

## Ví dụ

```js example-bad
function makeOne() {
  class C {
    args = { ...arguments }; // SyntaxError: arguments is not valid in fields
  }
  return new C();
}
```

```js example-bad
let CArgs;
class C {
  static {
    CArgs = arguments; // SyntaxError: arguments is not valid in fields
  }
}
```

```js example-good
class C {
  args = {};
  constructor() {
    this.args = arguments; // You can use arguments in constructors
  }
  myMethod() {
    this.args = arguments; // You can also use it in methods
  }
}
```

```js example-good
function makeOne() {
  const _arguments = arguments;
  class C {
    args = { ..._arguments }; // Only the identifier is forbidden
  }
  return new C();
}
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Public class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields)
- [Static initialization blocks](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)
