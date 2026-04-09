---
title: <xsl:attribute-set>
slug: Web/XML/XSLT/Reference/Element/attribute-set
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:attribute-set>` tạo một tập thuộc tính có tên, sau đó có thể áp dụng toàn bộ tập đó cho tài liệu đầu ra, theo cách tương tự như các style có tên trong CSS.

## Cú pháp

```xml
<xsl:attribute-set name=NAME use-attribute-sets=LIST-OF-NAMES>
  <xsl:attribute>
</xsl:attribute-set>
```

### Thuộc tính bắt buộc

- `name`
  - : Chỉ định tên của tập thuộc tính. Tên phải là một QName hợp lệ.

### Thuộc tính tùy chọn

- `use-attribute-sets`
  - : Xây dựng một tập thuộc tính từ các tập thuộc tính khác. Tên của các tập được đóng góp phải được ngăn cách bằng khoảng trắng và không được trực tiếp hoặc gián tiếp tự lồng vào chính nó.

### Loại

Top-level, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Thông số kỹ thuật

XSLT, section 7.1.4.

## Hỗ trợ Gecko

Được hỗ trợ.
