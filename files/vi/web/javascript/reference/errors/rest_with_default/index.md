---
title: "SyntaxError: rest parameter may not have a default"
slug: Web/JavaScript/Reference/Errors/Rest_with_default
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "rest parameter may not have a default" xảy ra khi một [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) có một [giá trị mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters). Vì tham số rest luôn tạo ra một mảng, giá trị mặc định sẽ không bao giờ được áp dụng.

## Thông báo

```plain
SyntaxError: Rest parameter may not have a default initializer (V8-based)
SyntaxError: rest parameter may not have a default (Firefox)
SyntaxError: Unexpected token '='. Expected a ')' or a ',' after a parameter declaration. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Một [tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters) cung cấp cho một tham số một giá trị mặc định nếu đối số không được truyền vào hoặc được truyền vào là `undefined`. Một [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) thu thập tất cả các đối số còn lại được truyền vào hàm và luôn tạo ra một mảng. Do đó, không có ý nghĩa gì khi có một giá trị mặc định cho tham số rest.

## Ví dụ

### Các trường hợp không hợp lệ

```js-nolint example-bad
function doSomething(...args = []) {}
```

### Các trường hợp hợp lệ

```js example-good
function doSomething(...args) {
  // args luôn là một mảng
}
```

## Xem thêm

- [Hàm](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)
- [Tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)
