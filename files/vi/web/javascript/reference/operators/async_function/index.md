---
title: async function expression
slug: Web/JavaScript/Reference/Operators/async_function
page-type: javascript-operator
browser-compat: javascript.operators.async_function
sidebar: jssidebar
---

Từ khóa **`async function`** có thể được sử dụng để định nghĩa một async function bên trong một biểu thức.

Bạn cũng có thể định nghĩa async function bằng cách sử dụng [khai báo `async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc [cú pháp arrow](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions).

## Cú pháp

```js-nolint
async function (param0) {
  statements
}
async function (param0, param1) {
  statements
}
async function (param0, param1, /* …, */ paramN) {
  statements
}

async function name(param0) {
  statements
}
async function name(param0, param1) {
  statements
}
async function name(param0, param1, /* …, */ paramN) {
  statements
}
```

> [!NOTE]
> Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng từ khóa `async function` để tránh nhầm lẫn với một [khai báo `async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function). Từ khóa `async function` chỉ bắt đầu một biểu thức khi chúng xuất hiện trong ngữ cảnh không thể chấp nhận câu lệnh.

### Tham số

- `name` {{optional_inline}}
  - : Tên hàm. Có thể bỏ qua, trong trường hợp đó hàm là _ẩn danh_. Tên chỉ cục bộ trong thân hàm.
- `paramN` {{optional_inline}}
  - : Tên của một tham số hình thức cho hàm. Để biết cú pháp của các tham số, xem [Tham chiếu Functions](/en-US/docs/Web/JavaScript/Guide/Functions#function_parameters).
- `statements` {{optional_inline}}
  - : Các câu lệnh tạo nên thân hàm.

## Mô tả

Một biểu thức `async function` rất giống với, và có cú pháp gần như giống với, một [khai báo `async function`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function). Sự khác biệt chính giữa biểu thức `async function` và khai báo `async function` là _tên hàm_, có thể được bỏ qua trong các biểu thức `async function` để tạo ra các hàm _ẩn danh_. Biểu thức `async function` có thể được sử dụng như một [IIFE](/en-US/docs/Glossary/IIFE) (Immediately Invoked Function Expression) chạy ngay khi nó được định nghĩa, cho phép bạn mô phỏng [top-level await](/en-US/docs/Web/JavaScript/Guide/Modules#top_level_await). Xem thêm chương về [functions](/en-US/docs/Web/JavaScript/Reference/Functions) để biết thêm thông tin.

## Ví dụ

### Sử dụng biểu thức async function

```js
function resolveAfter2Seconds(x) {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(x);
    }, 2000);
  });
}

// biểu thức async function được gán cho một biến
const add = async function (x) {
  const a = await resolveAfter2Seconds(20);
  const b = await resolveAfter2Seconds(30);
  return x + a + b;
};

add(10).then((v) => {
  console.log(v); // in ra 60 sau 4 giây.
});

// biểu thức async function được sử dụng như một IIFE
(async function (x) {
  const p1 = resolveAfter2Seconds(20);
  const p2 = resolveAfter2Seconds(30);
  return x + (await p1) + (await p2);
})(10).then((v) => {
  console.log(v); // in ra 60 sau 2 giây.
});
```

### Async IIFE

Một `async` [IIFE](/en-US/docs/Glossary/IIFE) cho phép bạn sử dụng [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) và [`for...await`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of) trong các ngữ cảnh mà [top-level await](/en-US/docs/Web/JavaScript/Reference/Operators/await#top_level_await) không khả dụng. Ở đây chúng ta sử dụng một [arrow function](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) để định nghĩa IIFE, nhưng các biểu thức `async function` cũng có thể được sử dụng.

```js
const getFileStream = async (url) => {
  // implementation
};

(async () => {
  const stream = await getFileStream("https://domain.name/path/file.ext");
  for await (const chunk of stream) {
    console.log({ chunk });
  }
})();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Functions](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- {{jsxref("Statements/async_function", "async function")}}
- {{jsxref("AsyncFunction")}}
- {{jsxref("Operators/await", "await")}}
