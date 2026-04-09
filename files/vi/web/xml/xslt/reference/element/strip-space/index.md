---
title: <xsl:strip-space>
slug: Web/XML/XSLT/Reference/Element/strip-space
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:strip-space>` xác định các phần tử trong tài liệu nguồn mà khoảng trắng nên được loại bỏ.

## Syntax

```xml
<xsl:strip-space elements=LIST-OF-ELEMENT-NAMES />
```

### Required Attributes

- `elements`
  - : Chỉ định một danh sách các phần tử trong tài liệu nguồn, được phân tách bằng khoảng trắng, mà các nút văn bản chỉ chứa khoảng trắng của chúng sẽ bị loại bỏ.

### Optional Attributes

Không có.

### Type

Cấp cao nhất, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Specifications

XSLT, section 3.4

## Gecko support

Được hỗ trợ.
