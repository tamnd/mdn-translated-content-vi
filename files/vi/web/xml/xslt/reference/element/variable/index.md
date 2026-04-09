---
title: <xsl:variable>
slug: Web/XML/XSLT/Reference/Element/variable
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:variable>` khai báo một biến toàn cục hoặc cục bộ trong stylesheet và gán cho nó một giá trị. Vì XSLT không cho phép tác động phụ, một khi giá trị của biến đã được xác lập, nó sẽ giữ nguyên cho đến khi biến ra khỏi phạm vi.

## Syntax

```xml
<xsl:variable name=NAME select=EXPRESSION >
  TEMPLATE
</xsl:variable>
```

### Required Attributes

- `name`
  - : Đặt tên cho biến.

### Optional Attributes

- `select`
  - : Xác định giá trị của biến thông qua một biểu thức XPath. Nếu phần tử chứa một template, thuộc tính này sẽ bị bỏ qua.

### Type

Cấp cao nhất hoặc instruction. Nếu xuất hiện như một phần tử cấp cao nhất, biến có phạm vi toàn cục và có thể được truy cập trong toàn bộ tài liệu. Nếu xuất hiện bên trong một template, biến có phạm vi cục bộ và chỉ có thể được truy cập trong template mà nó xuất hiện.

## Specifications

XSLT, section 11.

## Gecko support

Được hỗ trợ.
