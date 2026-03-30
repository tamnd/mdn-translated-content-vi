---
title: Function
slug: Glossary/Function
page-type: glossary-definition
sidebar: glossarysidebar
---

**Hàm** là một đoạn code có thể được gọi bởi code khác hoặc bởi chính nó, hoặc là một {{Glossary("variable")}} tham chiếu đến hàm. Khi một hàm được gọi, {{Glossary("Argument", "đối số")}} được truyền vào hàm như đầu vào, và hàm có thể tùy chọn trả về một giá trị. Một hàm trong {{glossary("JavaScript")}} cũng là một {{glossary("object")}}.

Tên hàm là một {{Glossary("identifier")}} được bao gồm như một phần của khai báo hàm hoặc biểu thức hàm. {{Glossary("scope")}} của tên hàm phụ thuộc vào việc tên hàm là khai báo hay biểu thức.

## Các loại hàm khác nhau

**Hàm ẩn danh** là hàm không có tên. Chỉ các biểu thức hàm mới có thể ẩn danh, các khai báo hàm phải có tên:

```js
// Hàm ẩn danh được tạo dưới dạng biểu thức hàm
(function () {});

// Hàm ẩn danh được tạo dưới dạng hàm mũi tên
() => {};
```

Các thuật ngữ sau không được sử dụng trong đặc tả ngôn ngữ ECMAScript, chúng là thuật ngữ thông thường dùng để chỉ các loại hàm khác nhau.

**Hàm có tên** là hàm có tên hàm:

```js
// Khai báo hàm
function foo() {}

// Biểu thức hàm có tên
(function bar() {});

// Hàm mũi tên
const baz = () => {};
```

**Hàm nội** là một hàm bên trong một hàm khác (trong trường hợp này là `square`). **Hàm ngoài** là hàm chứa một hàm (trong trường hợp này là `addSquares`):

```js
function addSquares(a, b) {
  function square(x) {
    return x * x;
  }
  return square(a) + square(b);
}

// Hàm mũi tên
const addSquares2 = (a, b) => {
  const square = (x) => x * x;
  return square(a) + square(b);
};
```

**Hàm đệ quy** là hàm gọi chính nó. Xem {{Glossary("Recursion", "đệ quy")}}.

```js
function loop(x) {
  if (x >= 10) return;
  loop(x + 1);
}

// Hàm mũi tên
const loop2 = (x) => {
  if (x >= 10) return;
  loop2(x + 1);
};
```

**Immediately Invoked Function Expression** ({{glossary("IIFE")}} - Biểu thức hàm được gọi ngay lập tức) là hàm được gọi ngay sau khi hàm được nạp vào trình biên dịch của trình duyệt. Cách nhận biết một IIFE là tìm dấu ngoặc đơn trái và phải bổ sung ở cuối định nghĩa hàm.

Các biểu thức hàm, có tên hay ẩn danh, đều có thể được gọi ngay lập tức.

```js
(function foo() {
  console.log("Hello Foo");
})();

(function food() {
  console.log("Hello Food");
})();

(() => console.log("hello world"))();
```

Các hàm được khai báo không thể được gọi ngay lập tức theo cách này, vì IIFE phải là _biểu thức_ hàm.

```js-nolint example-bad
function foo() {
  console.log("Hello Foo");
}();
```

Nếu bạn muốn tìm hiểu thêm về IIFE, hãy xem trang Wikipedia sau: [Immediately Invoked Function Expression](https://en.wikipedia.org/wiki/Immediately_invoked_function_expression)

## Xem thêm

- [Hàm](/en-US/docs/Web/JavaScript/Guide/Functions)
- [Hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
