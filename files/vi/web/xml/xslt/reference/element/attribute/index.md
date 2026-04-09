---
title: <xsl:attribute>
slug: Web/XML/XSLT/Reference/Element/attribute
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:attribute>` tạo một thuộc tính trong tài liệu đầu ra, sử dụng bất kỳ giá trị nào có thể truy cập được từ stylesheet. Phần tử này phải được định nghĩa trước bất kỳ phần tử tài liệu đầu ra nào khác bên trong phần tử tài liệu đầu ra mà nó thiết lập giá trị thuộc tính cho. Tuy nhiên, nó có thể đứng sau hoặc bên trong những phần tử không nằm trong đầu ra (như `<xsl:choose>` hoặc `<xsl:apply-templates>` v.v.).

## Cú pháp

```xml
<xsl:attribute name=NAME namespace=URI>
  TEMPLATE
</xsl:attribute>
```

### Thuộc tính bắt buộc

- `name`
  - : Chỉ định tên của thuộc tính cần được tạo trong tài liệu đầu ra. Tên phải là một QName hợp lệ.

### Thuộc tính tùy chọn

- `namespace`
  - : Xác định namespace URI cho thuộc tính này trong tài liệu đầu ra. Bạn không thể đặt prefix namespace liên quan bằng phần tử này.

### Loại

Instruction, xuất hiện bên trong một template hoặc một phần tử `<xsl:attribute-set>`.

## Thông số kỹ thuật

XSLT, section 7.1.3.

## Hỗ trợ Gecko

Được hỗ trợ.
