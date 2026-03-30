---
title: Parameter
slug: Glossary/Parameter
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tham số** (Parameters) là các biến được đặt tên, được khai báo là một phần của {{Glossary("function")}} (hàm). Chúng được dùng để tham chiếu đến các {{Glossary("argument", "đối số")}} được truyền vào hàm.

Ví dụ:

```js
const argument1 = "Web";
const argument2 = "Development";
example(argument1, argument2); // truyền vào hai đối số

// Hàm này nhận hai giá trị
function example(parameter1, parameter2) {
  console.log(parameter1); // Kết quả = "Web"
  console.log(parameter2); // Kết quả = "Development"
}
```

Có hai loại tham số:

- Tham số đầu vào (input parameters)
  - : Loại phổ biến nhất; chúng truyền giá trị vào hàm. Tùy thuộc vào ngôn ngữ lập trình, tham số đầu vào có thể được truyền theo nhiều cách (ví dụ: truyền theo giá trị, truyền theo địa chỉ, truyền theo tham chiếu).
- Tham số đầu ra/trả về (output/return parameters)
  - : Chủ yếu để trả về nhiều giá trị từ một hàm, nhưng không được khuyến nghị vì chúng gây nhầm lẫn.

## Tham số so với đối số

Lưu ý sự khác biệt giữa _tham số_ và _đối số_:

- Tham số hàm là các tên được liệt kê trong định nghĩa hàm.
- {{Glossary("argument","Đối số")}} hàm là các giá trị thực sự được truyền vào hàm.
- Tham số được khởi tạo với giá trị của các đối số được cung cấp.

## Xem thêm

- [Sự khác biệt giữa _tham số_ và _đối số_](<https://en.wikipedia.org/wiki/Parameter_(computer_programming)#Parameters_and_arguments>)
- [Khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function)
- [Biểu thức hàm](/en-US/docs/Web/JavaScript/Reference/Operators/function)
- Các thuật ngữ liên quan:
  - {{Glossary("Function")}}
  - {{Glossary("Argument")}}
