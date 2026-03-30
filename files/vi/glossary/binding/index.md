---
title: Liên kết
slug: Glossary/Binding
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong lập trình, **liên kết** (binding) là sự liên kết của một {{glossary("identifier", "định danh")}} với một giá trị. Không phải tất cả các liên kết đều là {{glossary("variable", "biến")}} — ví dụ, {{glossary("parameter", "tham số")}} hàm và liên kết được tạo bởi khối {{jsxref("Statements/try...catch", "catch (e)")}} không phải là "biến" theo nghĩa chặt chẽ. Ngoài ra, một số liên kết được tạo ra ngầm định bởi ngôn ngữ — ví dụ, {{jsxref("Operators/this", "this")}} và [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) trong JavaScript.

Một liên kết là {{glossary("mutable", "có thể thay đổi")}} nếu nó có thể được gán lại, và {{glossary("immutable", "bất biến")}} nếu không; điều này _không_ có nghĩa là giá trị nó giữ là bất biến.

Một liên kết thường được liên kết với một {{glossary("scope", "phạm vi")}}. Một số ngôn ngữ cho phép tạo lại liên kết (còn gọi là khai báo lại) trong cùng một phạm vi, trong khi các ngôn ngữ khác không cho phép; trong JavaScript, việc liên kết có thể được khai báo lại hay không phụ thuộc vào cấu trúc được sử dụng để tạo liên kết.

## Xem thêm

- {{jsxref("Statements/var", "var")}}
- {{jsxref("Statements/let", "let")}}
- {{jsxref("Statements/const", "const")}}
- {{jsxref("Statements/function", "function")}}
- {{jsxref("Statements/class", "class")}}
