---
title: Escape character
slug: Glossary/Escape_character
page-type: glossary-definition
sidebar: glossarysidebar
---

**Ký tự thoát** (escape character) là {{glossary("character","ký tự")}} khiến một hoặc nhiều ký tự theo sau nó được hiểu theo nghĩa khác. Điều này tạo thành **chuỗi thoát** (escape sequence), thường được sử dụng để đại diện cho một ký tự có nghĩa thay thế khi được in theo nghĩa đen, chẳng hạn như ký tự nháy kép trong chuỗi ký tự. Chuỗi thoát cũng có thể có các cách sử dụng khác, đặc biệt là trong [biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Regular_expressions#escape_sequences).

- Trong JavaScript, [regex](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_escape), [chuỗi ký tự](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#string_literals) và [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers), chúng ta có thể sử dụng dấu gạch chéo ngược (`\`) để thoát các ký tự như `\'`, `\"`, `\u0026`, v.v.
- Trong định danh CSS, chúng ta có thể sử dụng dấu gạch chéo ngược (`\`) để thoát các ký tự như `\\`, `\n`, `\26`, v.v.
- Trong nội dung văn bản HTML và giá trị thuộc tính, chúng ta có thể sử dụng {{glossary("character reference","tham chiếu ký tự")}} như `&lt;`, `&#60;`, hoặc `&#x3C;`.
- Trong {{glossary("URL","URL")}}, chúng ta có thể sử dụng dấu phần trăm (`%`) để thoát các ký tự như `%20`, `%3C`, `%3E`, v.v.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Character")}}
  - {{glossary("Character reference")}}
  - {{glossary("Code point")}}
- [Escape character](https://en.wikipedia.org/wiki/Escape_character) trên Wikipedia
