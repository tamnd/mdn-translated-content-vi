---
title: async function* expression
slug: Web/JavaScript/Reference/Operators/async_function*
page-type: javascript-operator
browser-compat: javascript.operators.async_generator_function
sidebar: jssidebar
---

Các từ khóa **`async function*`** có thể được dùng để định nghĩa một async generator function bên trong một biểu thức.

Bạn cũng có thể định nghĩa async generator function bằng cách sử dụng [`async function*` declaration](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*).

{{InteractiveExample("JavaScript Demo: async function* expression", "taller")}}

```js interactive-example
async function joinAll(generator) {
  let str = "";
  for await (const val of generator()) {
    str += val;
  }
  return str;
}
joinAll(async function* () {
  yield await Promise.resolve("a");
  yield await Promise.resolve("b");
  yield await Promise.resolve("c");
}).then((str) => console.log(str));
// Expected output: "abc"
```

## Cú pháp

```js-nolint
async function* (param0) {
  statements
}
async function* (param0, param1) {
  statements
}
async function* (param0, param1, /* …, */ paramN) {
  statements
}

async function* name(param0) {
  statements
}
async function* name(param0, param1) {
  statements
}
async function* name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng các từ khóa `async function` để tránh nhầm lẫn với khai báo [`async function*`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*). Các từ khóa `async function` chỉ bắt đầu một biểu thức khi chúng xuất hiện trong ngữ cảnh không thể chấp nhận câu lệnh.

### Tham số

- `name` {{optional_inline}}
  - : Tên của function. Có thể bỏ qua, trong trường hợp đó function là _ẩn danh_. Tên chỉ có phạm vi cục bộ trong phần thân function.
- `paramN` {{optional_inline}}
  - : Tên của tham số chính thức cho function. Về cú pháp của tham số, xem [tài liệu tham khảo Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo nên phần thân của function.

## Mô tả

Biểu thức `async function*` rất tương tự và có cú pháp gần giống với [`async function*` declaration](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*). Sự khác biệt chính giữa biểu thức `async function*` và khai báo `async function*` là _tên function_, có thể được bỏ qua trong biểu thức `async function*` để tạo các function _ẩn danh_. Biểu thức `async function*` có thể được dùng như một [IIFE](/en-US/docs/Glossary/IIFE) (Immediately Invoked Function Expression) chạy ngay khi nó được định nghĩa, cho phép bạn tạo một [async iterable object](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) tạm thời. Xem thêm chương về [functions](/en-US/docs/Web/JavaScript/Reference/Functions) để biết thêm thông tin.

## Ví dụ

### Sử dụng biểu thức async function\*

Ví dụ sau đây định nghĩa một async generator function không tên và gán nó cho `x`. Function yield bình phương của đối số:

```js
const x = async function* (y) {
  yield Promise.resolve(y * y);
};
x(6)
  .next()
  .then((res) => console.log(res.value)); // 36
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Statements/async_function*", "async function*")}}
- {{jsxref("AsyncGeneratorFunction")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- {{jsxref("Operators/yield", "yield")}}
- {{jsxref("Operators/yield*", "yield*")}}
