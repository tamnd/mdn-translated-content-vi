---
title: Giới thiệu XML
slug: Web/XML/Guides/XML_introduction
page-type: guide
sidebar: xmlsidebar
---

XML (Extensible Markup Language) là một ngôn ngữ đánh dấu tương tự {{Glossary("HTML")}}, nhưng không có các thẻ định sẵn để dùng. Thay vào đó, bạn tự định nghĩa các thẻ của riêng mình, được thiết kế cụ thể cho nhu cầu của bạn. Đây là một cách mạnh mẽ để lưu trữ dữ liệu ở định dạng có thể lưu, tìm kiếm và chia sẻ. Quan trọng nhất, vì định dạng cơ bản của XML được chuẩn hóa, nếu bạn chia sẻ hoặc truyền XML giữa các hệ thống hoặc nền tảng, dù cục bộ hay qua internet, người nhận vẫn có thể phân tích dữ liệu nhờ cú pháp XML chuẩn hóa.

Có nhiều ngôn ngữ dựa trên XML, bao gồm [XHTML](/en-US/docs/Glossary/XHTML), [MathML](/en-US/docs/Web/MathML), [SVG](/en-US/docs/Web/SVG), [RSS](/en-US/docs/Glossary/RSS) và [RDF](/en-US/docs/Glossary/RDF). Bạn cũng có thể tự định nghĩa ngôn ngữ của riêng mình.

## Cấu trúc của tài liệu XML

Toàn bộ cấu trúc của XML và các ngôn ngữ dựa trên XML được xây dựng trên các {{Glossary("tag")}}.

### Khai báo XML

XML - khai báo không phải là một thẻ. Nó được dùng để truyền siêu dữ liệu của tài liệu.

```html
<?xml version="1.0" encoding="UTF-8"?>
```

#### Thuộc tính

- `version`
  - : Phiên bản XML dùng trong tài liệu này.
- `encoding`
  - : Mã hóa dùng trong tài liệu này.

### Chú thích

```html
<!-- Comment -->
```

## XML "đúng" (hợp lệ và well-formed)

### Quy tắc thiết kế đúng

Để một tài liệu XML là đúng, các điều kiện sau phải được thỏa mãn:

- Tài liệu phải well-formed.
- Tài liệu phải tuân theo mọi quy tắc cú pháp XML.
- Tài liệu phải tuân theo các quy tắc ngữ nghĩa, thường được đặt trong một XML schema hoặc DTD (**[Document Type Definition](/en-US/docs/Glossary/Doctype))**.

### Ví dụ

```xml
<?xml version="1.0" encoding="UTF-8"?>
<message>
    <warning>
        Hello World
    <!--missing </warning> -->
</message>
```

Bây giờ hãy xem một phiên bản đã sửa của cùng tài liệu đó:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<message>
    <warning>
         Hello World
    </warning>
</message>
```

Một tài liệu chứa một thẻ chưa được định nghĩa là không hợp lệ. Ví dụ, nếu chúng ta chưa bao giờ định nghĩa thẻ `<warning>`, tài liệu ở trên sẽ không hợp lệ.

Hầu hết trình duyệt đều cung cấp một trình gỡ lỗi có thể nhận diện các tài liệu XML được định dạng kém.

## Tham chiếu ký tự

Giống như HTML, XML cung cấp {{glossary("character reference", "các tham chiếu ký tự")}} để tham chiếu tới một số ký tự đặc biệt dành riêng (chẳng hạn dấu lớn hơn vốn được dùng cho thẻ). Có năm ký tự như vậy mà bạn nên biết:

| Entity     | Ký tự | Mô tả                                |
| ---------- | ----- | ------------------------------------ |
| &amp;lt;   | <     | Dấu nhỏ hơn                          |
| &amp;gt;   | >     | Dấu lớn hơn                          |
| &amp;amp;  | &     | Dấu và                               |
| &amp;quot; | "     | Một dấu ngoặc kép                    |
| &amp;apos; | '     | Một dấu nháy đơn (hoặc dấu nháy)     |

Mặc dù chỉ có 5 tham chiếu ký tự, hay thực thể, được khai báo, bạn vẫn có thể thêm nhiều hơn bằng cách dùng [Document Type Definition](/en-US/docs/Glossary/Doctype) của tài liệu. Ví dụ, để tạo một thực thể mới `&warning;`, bạn có thể làm như sau:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE body [
  <!ENTITY warning "Warning: Something bad happened... please refresh and try again.">
]>
<body>
  <message> &warning; </message>
</body>
```

Bạn cũng có thể dùng các tham chiếu ký tự dạng số để chỉ định ký tự đặc biệt; ví dụ, &#xA9; là ký hiệu "©".

## Hiển thị XML

XML thường được dùng cho mục đích mô tả, nhưng cũng có những cách để hiển thị dữ liệu XML. Nếu bạn không định nghĩa một cách cụ thể để XML được kết xuất, XML thô sẽ được hiển thị trong trình duyệt.

Một cách để tạo kiểu cho đầu ra XML là chỉ định [CSS](/en-US/docs/Web/CSS) để áp dụng cho tài liệu bằng chỉ thị xử lý `xml-stylesheet`.

```xml
<?xml-stylesheet type="text/css" href="stylesheet.css"?>
```

Cũng có một cách mạnh mẽ hơn để hiển thị XML: **Extensible Stylesheet Language Transformations** ([XSLT](/en-US/docs/Web/XML/XSLT)) có thể được dùng để chuyển đổi XML sang các ngôn ngữ khác như HTML. Điều này làm cho XML trở nên cực kỳ linh hoạt.

```xml
<?xml-stylesheet type="text/xsl" href="transform.xsl"?>
```

## Khuyến nghị

Bài viết này rõ ràng chỉ là một phần giới thiệu rất ngắn về XML là gì, với một vài ví dụ nhỏ và tài liệu tham khảo để bạn bắt đầu. Để biết thêm chi tiết về XML, bạn nên tìm kiếm trên web các bài viết chuyên sâu hơn.

Học HyperText Markup Language ([HTML](/en-US/docs/Web/HTML)) sẽ giúp bạn hiểu XML tốt hơn.

## Xem thêm

- [XML.com](https://www.xml.com/)
- [Extensible Markup Language (XML) @ W3.org](https://www.w3.org/XML/)
- [Using XML: A List Apart](https://alistapart.com/article/usingxml/)
