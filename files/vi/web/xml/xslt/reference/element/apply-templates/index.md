---
title: <xsl:apply-templates>
slug: Web/XML/XSLT/Reference/Element/apply-templates
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:apply-templates>` chọn một tập hợp node trong cây đầu vào và chỉ thị cho processor áp dụng các template thích hợp lên chúng.

## Cú pháp

```xml
<xsl:apply-templates select=EXPRESSION mode=NAME>
  <xsl:with-param> [tùy chọn]
  <xsl:sort> [tùy chọn]
</xsl:apply-templates>
```

### Thuộc tính bắt buộc

Không có.

### Thuộc tính tùy chọn

- `select`
  - : Dùng một biểu thức XPath chỉ định các node cần xử lý. Dấu sao (`*`) chọn toàn bộ node-set. Nếu thuộc tính này không được đặt, tất cả node con của node hiện tại sẽ được chọn.
- `mode`
  - : Nếu có nhiều cách xử lý được định nghĩa cho cùng một node, thuộc tính này sẽ phân biệt giữa chúng.

### Loại

Instruction, xuất hiện bên trong một template.

## Thông số kỹ thuật

XSLT section 5.4.

## Hỗ trợ Gecko

Được hỗ trợ.
