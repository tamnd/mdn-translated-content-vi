---
title: <xsl:param>
slug: Web/XML/XSLT/Reference/Element/param
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:param>` thiết lập một tham số bằng tên và, tùy chọn, một giá trị mặc định cho tham số đó. Khi được dùng như một phần tử cấp cao nhất, tham số là toàn cục. Khi được dùng bên trong phần tử `<xsl:template>`, tham số là cục bộ đối với template đó. Trong trường hợp này, nó phải là phần tử con đầu tiên của template.

## Syntax

```xml
<xsl:param name=NAME select=EXPRESSION>
  TEMPLATE
</xsl:param>
```

### Required Attributes

- `name`
  - : Đặt tên cho tham số. Thuộc tính này phải là một QName.

### Optional Attributes

- `select`
  - : Dùng một biểu thức XPath để cung cấp giá trị mặc định nếu không có giá trị nào được chỉ định.

### Type

Instruction, có thể xuất hiện như một phần tử cấp cao nhất hoặc bên trong một template.

## Specifications

XSLT, section 11.

## Gecko support

Được hỗ trợ.
