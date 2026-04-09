---
title: <xsl:choose>
slug: Web/XML/XSLT/Reference/Element/choose
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:choose>` định nghĩa một lựa chọn giữa một số phương án. Nó hoạt động giống như câu lệnh switch trong các ngôn ngữ thủ tục.

## Cú pháp

```xml
<xsl:choose>
  <xsl:when test="[whatever to test1]"></xsl:when>
  <xsl:when test="[whatever to test2]"></xsl:when>
  <xsl:otherwise></xsl:otherwise> [optional]
</xsl:choose>
```

### Thuộc tính bắt buộc

Không có.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Chỉ thị, xuất hiện cùng một template. Nó chứa một hoặc nhiều phần tử `<xsl:when>`, và tùy chọn, một phần tử `<xsl:otherwise>` cuối cùng.

## Đặc tả

XSLT, section 9.2.

## Hỗ trợ Gecko

Được hỗ trợ.
