---
title: "SyntaxError: getter and setter for private name #x should either be both static or non-static"
slug: Web/JavaScript/Reference/Errors/Either_be_both_static_or_non-static
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "mismatched placement" xảy ra khi một [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) riêng tư không khớp nhau về việc có phải là {{jsxref("Classes/static", "static")}} hay không.

## Thông báo

```plain
SyntaxError: Identifier '#x' has already been declared (V8-based)
SyntaxError: getter and setter for private name #x should either be both static or non-static (Firefox)
SyntaxError: Cannot declare a private non-static getter if there is a static private setter with used name. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Các [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) riêng tư có cùng tên phải đều là {{jsxref("Classes/static", "static")}}, hoặc đều không phải static. Giới hạn này không tồn tại đối với các phương thức public.

## Ví dụ

### Vị trí không khớp

```js-nolint example-bad
class Test {
  static set #foo(_) {}
  get #foo() {}
}

// SyntaxError: getter and setter for private name #foo should either be both static or non-static
```

Vì `foo` là [riêng tư](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements), các phương thức phải đều là {{jsxref("Classes/static", "static")}}:

```js example-good
class Test {
  static set #foo(_) {}
  static get #foo() {}
}
```

hoặc đều không phải static:

```js example-good
class Test {
  set #foo(_) {}
  get #foo() {}
}
```

## Xem thêm

- {{jsxref("Functions/get", "get")}}
- {{jsxref("Functions/set", "set")}}
- {{jsxref("Classes/static", "static")}}
- [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
