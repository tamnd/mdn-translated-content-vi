---
title: CDATASection
slug: Web/API/CDATASection
page-type: web-api-interface
browser-compat: api.CDATASection
---

{{APIRef("DOM")}}

Giao diện **`CDATASection`** biểu diễn một phần CDATA có thể được dùng trong XML để chèn những đoạn văn bản mở rộng không cần escape.
Khi ở bên trong phần CDATA, các ký hiệu `<` và `&` không cần được escape như thông thường.

Trong XML, một phần CDATA có dạng:

```xml
<![CDATA[ … ]]>
```

Ví dụ:

```xml
<foo>
  Here is a CDATA section: <![CDATA[ < > & ]]> with all kinds of unescaped text.
</foo>
```

Chuỗi duy nhất không được phép xuất hiện trong một phần CDATA là chính chuỗi đóng của phần CDATA, `]]>`.

> [!NOTE]
> Không nên dùng các phần CDATA trong HTML. Chúng được xem là chú thích và sẽ không được hiển thị.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này không có thuộc tính riêng nào và triển khai các thuộc tính của kiểu cha
{{DOMxRef("Text")}}._

## Phương thức thể hiện

_Giao diện này không có phương thức riêng nào và triển khai các phương thức của kiểu cha
{{DOMxRef("Text")}}._

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.createCDATASection()")}}
