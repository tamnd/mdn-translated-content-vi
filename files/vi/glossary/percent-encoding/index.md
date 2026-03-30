---
title: Percent-encoding
slug: Glossary/Percent-encoding
page-type: glossary-definition
sidebar: glossarysidebar
---

**Percent-encoding** (mã hóa phần trăm) là cơ chế mã hóa các ký tự 8-bit có ý nghĩa đặc biệt trong ngữ cảnh của {{Glossary("URL", "URL")}}. Đôi khi còn được gọi là mã hóa URL. Cách mã hóa này bao gồm một phép thay thế: một ký tự '%' theo sau là biểu diễn thập lục phân của giá trị ASCII của ký tự được thay thế.

Các ký tự đặc biệt cần mã hóa là: `':'`, `'/'`, `'?'`, `'#'`, `'['`, `']'`, `'@'`, `'!'`, `'$'`, `'&'`, `"'"`, `'('`, `')'`, `'*'`, `'+'`, `','`, `';'`, `'='`, cũng như bản thân `'%'`. Các ký tự khác không cần mã hóa, mặc dù chúng có thể được mã hóa.

| Ký tự     | Mã hóa       |
| --------- | ------------ |
| `':'`     | `%3A`        |
| `'/'`     | `%2F`        |
| `'?'`     | `%3F`        |
| `'#'`     | `%23`        |
| `'['`     | `%5B`        |
| `']'`     | `%5D`        |
| `'@'`     | `%40`        |
| `'!'`     | `%21`        |
| `'$'`     | `%24`        |
| `'&'`     | `%26`        |
| `"'"`     | `%27`        |
| `'('`     | `%28`        |
| `')'`     | `%29`        |
| `'*'`     | `%2A`        |
| `'+'`     | `%2B`        |
| `','`     | `%2C`        |
| `';'`     | `%3B`        |
| `'='`     | `%3D`        |
| `'%'`     | `%25`        |
| `' '`     | `%20` or `+` |

Tùy thuộc vào ngữ cảnh, ký tự `' '` được dịch thành `'+'` (như trong phiên bản percent-encoding dùng trong thông điệp `application/x-www-form-urlencoded`), hoặc thành `'%20'` như trong URL.

## Xem thêm

- Định nghĩa của [percent-encoding](https://en.wikipedia.org/wiki/Percent-encoding) trên Wikipedia.
- {{RFC(3986)}}, mục 2.1, nơi cách mã hóa này được định nghĩa.
- [`encodeURI()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI) và [`encodeURIComponent()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) — các hàm để percent-encode URL
