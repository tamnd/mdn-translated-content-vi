---
title: function* expression
slug: Web/JavaScript/Reference/Operators/function*
page-type: javascript-operator
browser-compat: javascript.operators.generator_function
sidebar: jssidebar
---

Từ khóa **`function*`** có thể được dùng để định nghĩa một generator function bên trong một biểu thức.

Bạn cũng có thể định nghĩa generator function bằng cách sử dụng [`function*` declaration](/en-US/docs/Web/JavaScript/Reference/Statements/function*).

{{InteractiveExample("JavaScript Demo: function* expression", "taller")}}

```js interactive-example
const foo = function* () {
  yield "a";
  yield "b";
  yield "c";
};

let str = "";
for (const val of foo()) {
  str += val;
}

console.log(str);
// Expected output: "abc"
```

## Cú pháp

```js-nolint
function* (param0) {
  statements
}
function* (param0, param1) {
  statements
}
function* (param0, param1, /* …, */ paramN) {
  statements
}

function* name(param0) {
  statements
}
function* name(param0, param1) {
  statements
}
function* name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng từ khóa `function` để tránh nhầm lẫn với khai báo [`function*`](/en-US/docs/Web/JavaScript/Reference/Statements/function*). Từ khóa `function` chỉ bắt đầu một biểu thức khi nó xuất hiện trong ngữ cảnh không thể chấp nhận câu lệnh.

### Tham số

- `name` {{optional_inline}}
  - : Tên của function. Có thể bỏ qua, trong trường hợp đó function là _ẩn danh_. Tên chỉ có phạm vi cục bộ trong phần thân function.
- `paramN` {{optional_inline}}
  - : Tên của tham số chính thức cho function. Về cú pháp của tham số, xem [tài liệu tham khảo Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo nên phần thân của function.

## Mô tả

Biểu thức `function*` rất tương tự và có cú pháp gần giống với [`function*` declaration](/en-US/docs/Web/JavaScript/Reference/Statements/function*). Sự khác biệt chính giữa biểu thức `function*` và khai báo `function*` là _tên function_, có thể được bỏ qua trong biểu thức `function*` để tạo các function _ẩn danh_. Biểu thức `function*` có thể được dùng như một [IIFE](/en-US/docs/Glossary/IIFE) (Immediately Invoked Function Expression) chạy ngay khi nó được định nghĩa, cho phép bạn tạo một [iterable iterator object](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) tạm thời. Xem thêm chương về [functions](/en-US/docs/Web/JavaScript/Reference/Functions) để biết thêm thông tin.

## Ví dụ

### Sử dụng biểu thức function\*

Ví dụ sau đây định nghĩa một generator function không tên và gán nó cho `x`. Function yield bình phương của đối số:

```js
const x = function* (y) {
  yield y * y;
};
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Statements/function*", "function*")}}
- {{jsxref("GeneratorFunction")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Operators/yield", "yield")}}
- {{jsxref("Operators/yield*", "yield*")}}
