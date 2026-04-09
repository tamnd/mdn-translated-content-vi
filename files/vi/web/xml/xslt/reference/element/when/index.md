---
title: <xsl:when>
slug: Web/XML/XSLT/Reference/Element/when
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:when>` luôn xuất hiện bên trong phần tử `<xsl:choose>`, hoạt động như một câu lệnh case.

## Syntax

```xml
<xsl:when test=EXPRESSION>
  TEMPLATE
</xsl:when>
```

### Required Attributes

- `test`
  - : Chỉ định một biểu thức boolean cần được đánh giá. Nếu true, nội dung của phần tử sẽ được xử lý; nếu false, chúng bị bỏ qua.

### Optional Attributes

Không có.

### Type

Subinstruction, luôn xuất hiện bên trong phần tử `<xsl:choose>`.

## Specifications

XSLT, section 9.2.

## Gecko support

Được hỗ trợ.
