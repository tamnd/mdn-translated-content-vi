---
title: "SyntaxError: use of super property/member accesses only valid within methods or eval code within methods"
slug: Web/JavaScript/Reference/Errors/Bad_super_prop
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "use of super property/member accesses only valid within methods or eval code within methods" xảy ra khi cú pháp {{jsxref("Operators/super", "super.x")}} hoặc `super[x]` được sử dụng bên ngoài một [phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions).

## Thông báo

```plain
SyntaxError: 'super' keyword unexpected here (V8-based)
SyntaxError: use of super property accesses only valid within methods or eval code within methods (Firefox)
SyntaxError: super is not valid in this context. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Cú pháp `super.x` được dùng để truy cập các thuộc tính trên prototype của đối tượng hiện tại. Nó có thể được sử dụng trong các phương thức của cả [object literals](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) và [classes](/en-US/docs/Web/JavaScript/Reference/Classes), [field initializers](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields), và [static initialization blocks](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks), nhưng không trong các ngữ cảnh khác.

## Ví dụ

### Trường hợp không hợp lệ

Bạn không thể sử dụng `super.x` bên ngoài một phương thức trong một đối tượng:

```js example-bad
const obj = {
  __proto__: { x: 1 },
  x: super.x, // SyntaxError: use of super property accesses only valid within methods or eval code within methods
};
```

Bạn không thể sử dụng `super.x` trong một hàm, ngay cả khi hàm đó có tác dụng như một phương thức:

```js example-bad
function getX() {
  return super.x; // SyntaxError: use of super property accesses only valid within methods or eval code within methods
}

const obj = {
  getX,
  getX2: function () {
    return super.x; // SyntaxError: use of super property accesses only valid within methods or eval code within methods
  },
};

class Derived extends Base {
  getX = () => super.x;
}
```

### Trường hợp hợp lệ

Bạn có thể sử dụng `super.x` trong một phương thức:

```js example-good
class Base {
  x = 1;
}

class Derived extends Base {
  getX() {
    return super.x;
  }
}
```

Bạn có thể sử dụng `super.x` trong một field initializer:

```js example-good
class Derived extends Base {
  x = super.x;
}
```

Bạn cũng có thể sử dụng `super.x` trong các phương thức của đối tượng:

```js example-good
const obj = {
  __proto__: { x: 1 },
  getX() {
    return super.x;
  },
};
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Operators/super", "super")}}
