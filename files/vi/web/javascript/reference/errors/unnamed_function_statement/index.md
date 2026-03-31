---
title: "SyntaxError: function statement requires a name"
slug: Web/JavaScript/Reference/Errors/Unnamed_function_statement
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "function statement requires a name" xảy ra khi có một [câu lệnh hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function) trong code yêu cầu một tên.

## Thông báo

```plain
SyntaxError: Function statements require a function name (V8-based)
SyntaxError: function statement requires a name (Firefox)
SyntaxError: Function statements must have a name. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Có một [câu lệnh hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function) trong code yêu cầu một tên. Bạn cần kiểm tra cách các hàm được định nghĩa và xem bạn có cần cung cấp tên cho nó không, hoặc liệu hàm đó có cần là một biểu thức hàm, một [IIFE](/en-US/docs/Glossary/IIFE), hay liệu code hàm có được đặt đúng ngữ cảnh này không.

## Ví dụ

### Câu lệnh so với biểu thức

Một _[câu lệnh hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function)_ (hoặc _khai báo hàm_) yêu cầu một tên. Cách này sẽ không hoạt động:

```js-nolint example-bad
function () {
  return "Hello world";
}
// SyntaxError: function statement requires a name
```

Bạn có thể sử dụng [biểu thức hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function) (phép gán) thay thế:

```js example-good
const greet = function () {
  return "Hello world";
};
```

Nếu hàm của bạn dự định là một [IIFE](https://en.wikipedia.org/wiki/Immediately-invoked_function_expression) (Immediately Invoked Function Expression, là một hàm chạy ngay khi được định nghĩa) thì bạn cần thêm một vài dấu ngoặc:

```js example-good
(function () {
  // …
})();
```

### Hàm được đặt nhãn

[Nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label) là một tính năng hoàn toàn khác so với tên hàm. Bạn không thể sử dụng nhãn làm tên hàm.

```js-nolint example-bad
function Greeter() {
  german: function () {
    return "Moin";
  }
}
// SyntaxError: function statement requires a name
```

Ngoài ra, các khai báo hàm có nhãn là một tính năng đã lỗi thời. Hãy sử dụng khai báo hàm thông thường thay thế.

```js example-good
function Greeter() {
  function german() {
    return "Moin";
  }
}
```

### Phương thức đối tượng

Nếu bạn muốn tạo một phương thức của đối tượng, bạn cần tạo một đối tượng. Cú pháp sau đây không có tên sau từ khóa `function` là hợp lệ.

```js example-good
const greeter = {
  german: function () {
    return "Moin";
  },
};
```

Bạn cũng có thể sử dụng [cú pháp phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions).

```js example-good
const greeter = {
  german() {
    return "Moin";
  },
};
```

### Cú pháp callback

Ngoài ra, hãy kiểm tra cú pháp của bạn khi sử dụng callback. Dấu ngoặc nhọn và dấu phẩy có thể dễ gây nhầm lẫn.

```js-nolint example-bad
promise.then(
  function () {
    console.log("success");
  });
  function () {
    console.log("error");
}
// SyntaxError: function statement requires a name
```

Đúng phải là:

```js example-good
promise.then(
  function () {
    console.log("success");
  },
  function () {
    console.log("error");
  },
);
```

## Xem thêm

- Hướng dẫn [Hàm](/en-US/docs/Web/JavaScript/Guide/Functions)
- [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function)
- [Biểu thức `function`](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- {{Glossary("IIFE")}}
- [Câu lệnh có nhãn](/en-US/docs/Web/JavaScript/Reference/Statements/label)
