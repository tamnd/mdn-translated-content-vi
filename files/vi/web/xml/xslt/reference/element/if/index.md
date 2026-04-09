---
title: <xsl:if>
slug: Web/XML/XSLT/Reference/Element/if
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:if>` chứa một thuộc tính test và một template. Nếu test đánh giá thành true, template sẽ được xử lý. Theo cách này, nó tương tự như câu lệnh if trong các ngôn ngữ khác. Tuy nhiên, để đạt được chức năng của câu lệnh if-then-else, hãy dùng phần tử `<xsl:choose>` với một phần tử con `<xsl:when>` và một phần tử con `<xsl:otherwise>`.

## Cú pháp

```xml
<xsl:if test=EXPRESSION>
  TEMPLATE
</xsl:if>
```

### Thuộc tính bắt buộc

- `test`
  - : Chứa một biểu thức XPath có thể được đánh giá (nếu cần thì dùng các quy tắc được định nghĩa cho `boolean( )`) thành một giá trị Boolean. Nếu giá trị là true, template sẽ được xử lý; nếu không, sẽ không có hành động nào được thực hiện.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Chỉ thị, xuất hiện bên trong một template.

## Đặc tả

XSL section 9.1.

## Hỗ trợ Gecko

Được hỗ trợ
