---
title: Argument
slug: Glossary/Argument
page-type: glossary-definition
sidebar: glossarysidebar
---

**Đối số** (Arguments) là các {{glossary("value", "giá trị")}} ({{Glossary("primitive", "kiểu nguyên thủy")}} hoặc {{Glossary("object", "đối tượng")}}) được truyền vào làm đầu vào cho một {{Glossary("function", "hàm")}}. Đừng nhầm lẫn đối số với {{Glossary("parameter","tham số")}}, là tên được sử dụng trong định nghĩa hàm để tham chiếu đến các đối số.

Ví dụ:

```js
const argument1 = "Web";
const argument2 = "Development";
example(argument1, argument2); // passing two arguments

// This function takes two values
function example(parameter1, parameter2) {
  console.log(parameter1); // Output = "Web"
  console.log(parameter2); // Output = "Development"
}
```

Thứ tự đối số trong lời gọi hàm phải giống với thứ tự tham số trong định nghĩa hàm.

```js
const argument1 = "foo";
const argument2 = [1, 2, 3];
example(argument1, argument2); // passing two arguments

// This function takes a single value, so the second argument passed is ignored
function example(parameter) {
  console.log(parameter); // Output = foo
}
```

## Xem thêm

- [Sự khác biệt giữa tham số và đối số](/en-US/docs/Glossary/Parameter#parameters_versus_arguments)
- Đối tượng JavaScript {{jsxref("Functions/arguments", "arguments")}}
- Các thuật ngữ liên quan:
  - {{Glossary("Function")}}
  - {{Glossary("Parameter")}}
  - {{glossary("JavaScript")}}
