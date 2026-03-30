---
title: Code point (Điểm mã)
slug: Glossary/Code_point
page-type: glossary-definition
sidebar: glossarysidebar
---

**Điểm mã** (code point) là một số được gán để biểu thị một ký tự trừu tượng trong một hệ thống biểu diễn văn bản (như Unicode). Trong Unicode, một điểm mã được biểu thị theo dạng "U+1234" trong đó "1234" là số được gán. Ví dụ, ký tự "A" được gán điểm mã U+0041.

Các dạng mã hóa ký tự, như {{glossary("UTF-8")}} và {{glossary("UTF-16")}}, xác định cách một điểm mã Unicode nên được mã hóa thành một chuỗi byte. Các dạng mã hóa khác nhau có thể mã hóa cùng một điểm mã thành các chuỗi byte khác nhau: ví dụ, ký tự Cyrillic "Ф", có điểm mã là U+0424, được mã hóa là `0xd0a4` trong UTF-8 và là `0x0424` trong UTF-16.

## Xem thêm

- [The Unicode Standard: Code Points and Characters](https://www.unicode.org/versions/Unicode14.0.0/ch02.pdf#G25564)
