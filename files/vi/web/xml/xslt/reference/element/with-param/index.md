---
title: <xsl:with-param>
slug: Web/XML/XSLT/Reference/Element/with-param
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:with-param>` đặt giá trị cho một tham số để truyền vào một template.

## Syntax

```xml
<xsl:with-param name=NAME select=EXPRESSION>
  TEMPLATE
</xsl:with-param>
```

### Required Attributes

- `name`
  - : Đặt tên cho tham số này.

### Optional Attributes

- `select`
  - : Xác định giá trị của tham số thông qua một biểu thức XPath. Nếu phần tử chứa một template, thuộc tính này sẽ bị bỏ qua.

### Type

Subinstruction, luôn xuất hiện bên trong phần tử `<xsl:apply-templates>` hoặc `<xsl:call-template>`.

## Specifications

XSLT 11.6

## Gecko support

Được hỗ trợ.
