---
title: IIFE
slug: Glossary/IIFE
page-type: glossary-definition
sidebar: glossarysidebar
---

**IIFE** (Immediately Invoked Function Expression) là thành ngữ trong đó một {{glossary("function","hàm")}} {{glossary("JavaScript")}} chạy ngay khi được định nghĩa. Còn được gọi là _hàm ẩn danh tự thực thi_. Tên gọi IIFE được phổ biến bởi Ben Alman trong [blog của ông](https://benalman.com/news/2010/11/immediately-invoked-function-expression/#iife).

```js
// IIFE tiêu chuẩn
(function () {
  // các câu lệnh…
})();

// biến thể arrow function
(() => {
  // các câu lệnh…
})();

// IIFE async
(async () => {
  // các câu lệnh…
})();
```

Nó chứa hai phần chính:

1. Một [_biểu thức_ hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function). Điều này thường cần được [đặt trong dấu ngoặc](/en-US/docs/Web/JavaScript/Reference/Operators/Grouping) để được phân tích cú pháp đúng cách.
2. _Gọi_ biểu thức hàm ngay lập tức. Có thể cung cấp các đối số, mặc dù IIFE không có đối số phổ biến hơn.

IIFE là mẫu phổ biến dùng để thực thi một số lượng câu lệnh tùy ý trong phạm vi riêng của chúng (và có thể trả về giá trị), ở vị trí chỉ cho phép một biểu thức đơn. Chúng tương tự nhưng mạnh hơn nhiều so với [toán tử dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator), vốn chỉ thực thi nhiều biểu thức mà không hỗ trợ biến cục bộ hay câu lệnh điều khiển luồng.

Các trường hợp sử dụng của IIFE bao gồm:

- Tránh ô nhiễm không gian tên toàn cục bằng cách tạo một {{glossary("scope","phạm vi")}} mới.
- Tạo một ngữ cảnh async mới để sử dụng {{jsxref("Operators/await", "await")}} trong một ngữ cảnh không async.
- Tính toán giá trị với logic phức tạp, chẳng hạn như sử dụng nhiều câu lệnh như một biểu thức đơn.

Để xem các ví dụ mã, xem các trang tham khảo [biểu thức `function`](/en-US/docs/Web/JavaScript/Reference/Operators/function) và [biểu thức `async function`](/en-US/docs/Web/JavaScript/Reference/Operators/async_function).

## Xem thêm

- [IIFE](https://en.wikipedia.org/wiki/Immediately-invoked_function_expression) (Wikipedia)
- [Toán tử dấu phẩy](/en-US/docs/Web/JavaScript/Reference/Operators/Comma_operator)
- Các thuật ngữ liên quan:
  - {{Glossary("Function")}}
