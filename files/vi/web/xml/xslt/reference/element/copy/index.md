---
title: <xsl:copy>
slug: Web/XML/XSLT/Reference/Element/copy
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:copy>` chuyển một bản sao nông (node đó và bất kỳ node namespace nào đi kèm) của node hiện tại vào tài liệu đầu ra. Nó không sao chép bất kỳ node con hay thuộc tính nào của node hiện tại.

## Cú pháp

```xml
<xsl:copy use-attribute-sets=LIST-OF-NAMES>
  TEMPLATE
</xsl:copy>
```

### Thuộc tính bắt buộc

Không có.

### Thuộc tính tùy chọn

- `use-attribute-sets`
  - : Liệt kê các bộ thuộc tính sẽ được áp dụng cho node đầu ra, nếu đó là một element. Tên của các bộ này nên được phân tách bằng ký tự khoảng trắng.

### Kiểu

Chỉ thị, xuất hiện bên trong một template.

## Đặc tả

XSLT, section 7.5.

## Hỗ trợ Gecko

Được hỗ trợ.
