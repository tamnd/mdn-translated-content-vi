---
title: UTF-16
slug: Glossary/UTF-16
page-type: glossary-definition
sidebar: glossarysidebar
---

UTF-16 là tiêu chuẩn {{glossary("character encoding", "mã hóa ký tự")}} cho {{glossary("Unicode")}}. Nó mã hóa mỗi {{glossary("code point", "code point")}} Unicode bằng một hoặc hai {{glossary("code unit", "code unit")}}. Mỗi code unit có giá trị 16 bit.

Các code point có giá trị nhỏ hơn 2<sup>16</sup> được mã hóa thành một code unit đơn có giá trị số bằng giá trị của code point. Các code point này tạo thành [Basic Multilingual Plane (BMP)](<https://en.wikipedia.org/wiki/Plane_(Unicode)#Basic_Multilingual_Plane>), và bao gồm hầu hết các ký tự phổ biến, bao gồm chữ La tinh, tiếng Hy Lạp, tiếng Cyrillic và nhiều ký tự Đông Á.

Ví dụ, ký tự La tinh "A" được gán code point `U+0041` trong Unicode, và trong UTF-16 được biểu diễn thành code unit đơn `41`.

Các code point có giá trị lớn hơn 2<sup>16</sup> được mã hóa bằng cặp code unit, được gọi là _cặp thay thế_ (surrogate pair). Các giá trị được dùng cho cặp thay thế không được dùng cho các code point Unicode, để tránh nhầm lẫn.

Ví dụ, ký tự biểu tượng cảm xúc "🦊" (Fox Face) được gán code point `U+1F98A` trong Unicode, và trong UTF-16 được biểu diễn thành cặp thay thế `d83e dd8a`.

## UTF-16 trong JavaScript

Các chuỗi trong JavaScript được biểu diễn bằng UTF-16, và nhiều {{jsxref("String")}} API hoạt động trên code unit, không phải code point. Ví dụ, {{jsxref("String.length")}} trả về `2` cho một chuỗi chứa một ký tự Unicode đơn không nằm trong BMP:

```js
const string = "🦊"; // U+1F98A
console.log(string.length); // 2
```

Phương thức {{jsxref("String.charCodeAt()")}} trả về code unit tại chỉ số đã cho, và phương thức {{jsxref("String.codePointAt()")}} trả về code point tại chỉ số đã cho:

```js
const string = "🦊"; // U+1F98A

console.log(string.charCodeAt(0).toString(16)); // d83e
console.log(string.charCodeAt(1).toString(16)); // dd8a

console.log(string.codePointAt(0).toString(16)); // 1f98a
```

Xem [ký tự UTF-16, code point Unicode và cụm grapheme](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) để tìm hiểu thêm về làm việc với chuỗi UTF-16 trong JavaScript.

## UTF-16 và UTF-8

{{glossary("UTF-8")}} là một bảng mã thay thế cho Unicode, sử dụng một đến bốn byte cho mỗi code point Unicode. UTF-8 là bảng mã phổ biến hơn nhiều cho tài liệu trên Web so với UTF-16.

## UTF-16 và UCS-2

UCS-2 là một bảng mã lỗi thời cho Unicode. Nó giống với UTF-16, ngoại trừ việc nó không hỗ trợ cặp thay thế, vì vậy không thể mã hóa các code point nằm ngoài BMP.

## Xem thêm

- [Ký tự UTF-16, code point Unicode và cụm grapheme](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters)
- {{glossary("UTF-8")}}
- [UTF-16](https://en.wikipedia.org/wiki/UTF-16) trên Wikipedia
