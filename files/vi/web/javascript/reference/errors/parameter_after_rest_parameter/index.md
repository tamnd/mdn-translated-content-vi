---
title: "SyntaxError: parameter after rest parameter"
slug: Web/JavaScript/Reference/Errors/Parameter_after_rest_parameter
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "parameter after rest parameter" xảy ra khi một [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters) được theo sau bởi bất kỳ thứ gì khác trong danh sách tham số, bao gồm một tham số rest khác, một tham số hình thức, hoặc một [dấu phẩy ở cuối](/en-US/docs/Web/JavaScript/Reference/Trailing_commas).

## Thông báo

```plain
SyntaxError: Rest parameter must be last formal parameter (V8-based)
SyntaxError: parameter after rest parameter (Firefox)
SyntaxError: Unexpected token ','. Rest parameter should be the last parameter in a function declaration. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Tham số rest phải là tham số cuối cùng trong định nghĩa hàm. Điều này là vì tham số rest thu thập tất cả các đối số còn lại được truyền vào hàm, vì vậy sẽ không có ý nghĩa gì khi có bất kỳ tham số nào sau nó. Ký tự không phải khoảng trắng tiếp theo phải là dấu ngoặc đơn đóng của danh sách tham số.

## Ví dụ

### Các trường hợp không hợp lệ

```js-nolint example-bad
function replacer(match, ...groups, offset, string) {}

function doSomething(
  arg1,
  arg2,
  ...otherArgs, // Dấu phẩy ở cuối vô tình
) {}
```

### Các trường hợp hợp lệ

```js example-good
function replacer(match, ...args) {
  const offset = args.at(-2);
  const string = args.at(-1);
}

function doSomething(arg1, arg2, ...otherArgs) {}
```

## Xem thêm

- [Hàm](/en-US/docs/Web/JavaScript/Reference/Functions)
- [Tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)
