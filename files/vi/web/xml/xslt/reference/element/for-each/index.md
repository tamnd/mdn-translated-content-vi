---
title: <xsl:for-each>
slug: Web/XML/XSLT/Reference/Element/for-each
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:for-each>` chọn một tập node và xử lý từng node theo cùng một cách. Nó thường được dùng để lặp qua một tập node hoặc để thay đổi node hiện tại. Nếu một hoặc nhiều phần tử `<xsl:sort>` xuất hiện làm con của phần tử này, việc sắp xếp sẽ diễn ra trước khi xử lý. Nếu không, các node được xử lý theo thứ tự tài liệu.

## Cú pháp

```xml
<xsl:for-each select=EXPRESSION>
  <xsl:sort> [optional]
  TEMPLATE
</xsl:for-each>
```

### Thuộc tính bắt buộc

- `select`
  - : Dùng một biểu thức XPath để chọn các node sẽ được xử lý.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Chỉ thị, xuất hiện bên trong một template.

## Đặc tả

XSLT, section 8.

## Hỗ trợ Gecko

Được hỗ trợ.
