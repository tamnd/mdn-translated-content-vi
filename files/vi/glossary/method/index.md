---
title: Method
slug: Glossary/Method
page-type: glossary-definition
sidebar: glossarysidebar
---

**Phương thức** (method) là một {{glossary("function","hàm")}} thuộc {{glossary("property","thuộc tính")}} của một {{glossary("object","đối tượng")}}. Có hai loại phương thức: _phương thức thực thể_ (instance methods) là các tác vụ tích hợp được thực hiện bởi một thực thể đối tượng, và _{{Glossary("static method","phương thức tĩnh")}}_ là các tác vụ được gọi trực tiếp trên hàm khởi tạo đối tượng.

> [!NOTE]
> Trong JavaScript, chính bản thân hàm cũng là đối tượng, vì vậy trong ngữ cảnh đó, một phương thức thực sự là một {{glossary("object reference","tham chiếu đối tượng")}} đến một hàm.

Khi `F` được gọi là _phương thức_ của `O`, thường có nghĩa là `F` sử dụng `O` làm liên kết [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this). Các thuộc tính hàm không có hành vi khác nhau dựa trên giá trị `this` của chúng (hoặc những hàm không có liên kết `this` động — như [hàm được bind](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) và [hàm mũi tên](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)) có thể không được công nhận phổ biến là phương thức.

## Xem thêm

- [Method (computer programming)](<https://en.wikipedia.org/wiki/Method_(computer_programming)>) trên Wikipedia
- [Định nghĩa phương thức trong JavaScript](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) (so sánh cú pháp truyền thống và cú pháp viết tắt mới)
- [Danh sách các phương thức tích hợp JavaScript](/en-US/docs/Web/JavaScript/Reference)
- Các thuật ngữ liên quan:
  - {{Glossary("function")}}
  - {{Glossary("object")}}
  - {{Glossary("property")}}
  - {{Glossary("static method")}}
