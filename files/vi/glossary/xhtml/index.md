---
title: XHTML
slug: Glossary/XHTML
page-type: glossary-definition
sidebar: glossarysidebar
---

**XHTML** là thuật ngữ trước đây được sử dụng để mô tả các tài liệu [HTML](/en-US/docs/Web/HTML) được viết để tuân thủ các quy tắc cú pháp {{Glossary("XML")}}.

Ví dụ sau đây cho thấy một tài liệu HTML và tài liệu "XHTML" tương ứng, cùng với tiêu đề {{Glossary("HTTP")}} {{HTTPHeader("Content-Type")}} đi kèm mà chúng nên được phục vụ:

```html
<!-- Content-Type: text/html -->

<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>HTML</title>
  </head>
  <body>
    <p>Tôi là tài liệu HTML</p>
  </body>
</html>
```

```xml
<!-- Content-Type: application/xhtml+xml -->

<?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US">
  <head>
    <title>XHTML</title>
  </head>
  <body>
    <p>Tôi là tài liệu XHTML</p>
  </body>
</html>
```

Trong thực tế, rất ít tài liệu "XHTML" được phục vụ trên web với tiêu đề `Content-Type: application/xhtml+xml`. Thay vào đó, mặc dù các tài liệu được viết để tuân thủ các quy tắc cú pháp XML, chúng được phục vụ với tiêu đề `Content-Type: text/html` — vì vậy các trình duyệt phân tích các tài liệu đó bằng trình phân tích HTML thay vì trình phân tích XML.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("HTML")}}
  - {{Glossary("HTML5")}}
  - {{Glossary("SVG")}}
  - {{Glossary("MathML")}}
  - {{Glossary("XML")}}
