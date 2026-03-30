---
title: Kiểu nguyên thủy
slug: Glossary/Primitive
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong {{Glossary("JavaScript")}}, **giá trị nguyên thủy** (primitive value, primitive data type) là dữ liệu không phải là {{Glossary("object")}} (đối tượng) và không có {{glossary("method","phương thức")}} hay {{Glossary("property/javascript", "thuộc tính")}}. Có 7 kiểu dữ liệu nguyên thủy:

- {{Glossary("string")}}
- {{Glossary("number")}}
- {{Glossary("bigint")}}
- {{Glossary("boolean")}}
- {{Glossary("undefined")}}
- [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)
- {{Glossary("null")}}

Hầu hết các giá trị nguyên thủy được biểu diễn trực tiếp ở cấp thấp nhất của việc triển khai ngôn ngữ.

Tất cả các giá trị nguyên thủy đều _bất biến_ (immutable), tức là chúng không thể bị thay đổi. Điều quan trọng là không nhầm lẫn bản thân giá trị nguyên thủy với một biến được gán giá trị nguyên thủy. Biến có thể được gán lại một giá trị mới, nhưng giá trị hiện có không thể bị thay đổi theo cách mà đối tượng, mảng và hàm có thể bị thay đổi. Ngôn ngữ không cung cấp tiện ích để thay đổi giá trị nguyên thủy.

Các giá trị nguyên thủy không có phương thức nhưng vẫn hoạt động như thể chúng có. Khi các thuộc tính được truy cập trên giá trị nguyên thủy, JavaScript _tự động đóng hộp_ (auto-boxes) giá trị vào một đối tượng bọc (wrapper object) và truy cập thuộc tính trên đối tượng đó. Ví dụ, `"foo".includes("f")` ngầm tạo một đối tượng bọc [`String`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) và gọi `String.prototype.includes()` trên đối tượng đó. Hành vi tự động đóng hộp này không thể quan sát được trong mã JavaScript nhưng là một mô hình tư duy tốt cho nhiều hành vi khác nhau — ví dụ, tại sao việc "thay đổi" giá trị nguyên thủy không hoạt động (vì `str.foo = 1` không gán vào thuộc tính `foo` của chính `str`, mà vào một đối tượng bọc tạm thời).

## Xem thêm

- [Kiểu dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures)
- [Primitive data type](https://en.wikipedia.org/wiki/Primitive_data_type) (Wikipedia)
- Các thuật ngữ liên quan:
  - {{Glossary("JavaScript")}}
  - {{Glossary("string")}}
  - {{Glossary("number")}}
  - {{Glossary("bigint")}}
  - {{Glossary("boolean")}}
  - {{Glossary("null")}}
  - {{Glossary("undefined")}}
  - [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)
