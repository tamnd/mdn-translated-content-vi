---
title: Binding
slug: Glossary/Binding
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong lập trình, **binding** (ràng buộc) là sự liên kết của một {{glossary("identifier", "định danh")}} với một giá trị. Không phải tất cả các ràng buộc đều là {{glossary("variable", "biến")}} — ví dụ, {{glossary("parameter", "tham số")}} hàm và ràng buộc được tạo bởi khối {{jsxref("Statements/try...catch", "catch (e)")}} không phải là "biến" theo nghĩa chặt chẽ. Ngoài ra, một số ràng buộc được tạo ra ngầm định bởi ngôn ngữ — ví dụ, {{jsxref("Operators/this", "this")}} và [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) trong JavaScript.

Một ràng buộc là {{glossary("mutable", "có thể thay đổi")}} nếu nó có thể được gán lại, và {{glossary("immutable", "bất biến")}} nếu không; điều này _không_ có nghĩa là giá trị nó giữ là bất biến.

Một ràng buộc thường được liên kết với một {{glossary("scope", "phạm vi")}}. Một số ngôn ngữ cho phép tạo lại ràng buộc (còn gọi là khai báo lại) trong cùng một phạm vi, trong khi các ngôn ngữ khác không cho phép; trong JavaScript, việc ràng buộc có thể được khai báo lại hay không phụ thuộc vào cấu trúc được sử dụng để tạo ràng buộc.

## Xem thêm

- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/class", "class")}}
