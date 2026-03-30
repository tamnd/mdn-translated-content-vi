---
title: Symbol
slug: Glossary/Symbol
page-type: glossary-definition
sidebar: glossarysidebar
---

**Symbol** (ký hiệu) là một kiểu dữ liệu đại diện cho các định danh duy nhất và không thể giả mạo. Đôi khi chúng được gọi là _atom_.

Vì symbol là duy nhất và không thể giả mạo, bạn chỉ có thể đọc giá trị thuộc tính liên kết với một symbol nếu bạn có tham chiếu đến định danh gốc.

Trong JavaScript, `symbol` là một trong các {{Glossary("primitive", "kiểu nguyên thủy")}} và có thể được tạo bằng phương thức factory [`Symbol()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol), mỗi lần trả về một symbol khác nhau. Chúng có thể được sử dụng làm khóa cho các đối tượng mà không bao giờ vô tình xung đột với các thuộc tính khác.

JavaScript cũng định nghĩa hai loại symbol khác: symbol nổi tiếng (well-known symbols) và symbol đã đăng ký (registered symbols). Đọc tài liệu tham khảo {{jsxref("Symbol")}} để biết thêm thông tin.

## Xem thêm

- [Kiểu dữ liệu](https://en.wikipedia.org/wiki/Data_type) trên Wikipedia
- [Symbol](<https://en.wikipedia.org/wiki/Symbol_(programming)>) trên Wikipedia
- Đối tượng toàn cục JavaScript {{jsxref("Symbol")}}
