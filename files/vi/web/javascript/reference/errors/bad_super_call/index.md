---
title: "SyntaxError: super() is only valid in derived class constructors"
slug: Web/JavaScript/Reference/Errors/Bad_super_call
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "super() is only valid in derived class constructors" xảy ra khi lời gọi {{jsxref("Operators/super", "super()")}} được sử dụng ở nơi không phải thân của [constructor](/en-US/docs/Web/JavaScript/Reference/Classes/constructor) trong một class có từ khóa [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends).

## Thông báo

```plain
SyntaxError: 'super' keyword unexpected here (V8-based)
SyntaxError: super() is only valid in derived class constructors (Firefox)
SyntaxError: super is not valid in this context. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Lời gọi `super()` được dùng để gọi constructor cơ sở của class dẫn xuất, để class cơ sở có thể khởi tạo đối tượng {{jsxref("Operators/this", "this")}}. Sử dụng nó ở bất kỳ nơi nào khác không có ý nghĩa.

`super()` cũng có thể được định nghĩa trong một arrow function được lồng bên trong constructor. Tuy nhiên, nó không thể được định nghĩa trong bất kỳ loại hàm nào khác.

## Ví dụ

### Trường hợp không hợp lệ

Bạn không thể gọi `super()` nếu class không có `extends`, vì không có class cơ sở để gọi:

```js example-bad
class Base {
  constructor() {
    super();
  }
}
```

Bạn không thể gọi `super()` trong một phương thức class, ngay cả khi phương thức đó được gọi từ constructor:

```js example-ba
class Base {}

class Derived extends Base {
  constructor() {
    this.init();
  }

  init() {
    super();
  }
}
```

Bạn không thể gọi `super()` trong một hàm, ngay cả khi hàm được sử dụng như một constructor:

```js example-bad
function Base(x) {
  this.x = x;
}

function Derived() {
  super(1);
}

Object.setPrototypeOf(Derived.prototype, Base.prototype);
Object.setPrototypeOf(Derived, Base);
```

### Trường hợp hợp lệ

Bạn có thể gọi `super()` trước khi gọi bất kỳ phương thức nào khác trong constructor:

```js example-good
class Base {}

class Derived extends Base {
  constructor() {
    super();
    this.init();
  }

  init() {
    // …
  }
}
```

Bạn có thể gọi `super()` trong một arrow function được lồng bên trong constructor:

```js example-good
class Base {}

class Derived extends Base {
  constructor() {
    const init = () => {
      super();
    };

    init();
  }
}
```

## Xem thêm

- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Operators/super", "super")}}
