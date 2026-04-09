---
title: <xsl:preserve-space>
slug: Web/XML/XSLT/Reference/Element/preserve-space
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:preserve-space>` xác định các phần tử trong tài liệu nguồn mà khoảng trắng nên được giữ lại. Nếu có nhiều hơn một phần tử, hãy tách các tên bằng một ký tự khoảng trắng. Giữ lại khoảng trắng là thiết lập mặc định, vì vậy phần tử này chỉ cần dùng để đối kháng lại một phần tử `<xsl:strip-space>`.

## Syntax

```xml
<xsl:preserve-space elements=LIST-OF-ELEMENT-NAMES />
```

### Required Attributes

- `elements`
  - : Chỉ định các phần tử mà khoảng trắng nên được giữ lại.

### Optional Attributes

Không có.

### Type

Top-level, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Specifications

XSLT, section 3.4

## Gecko support

Được hỗ trợ.
