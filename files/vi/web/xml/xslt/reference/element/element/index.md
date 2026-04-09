---
title: <xsl:element>
slug: Web/XML/XSLT/Reference/Element/element
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:element>` tạo một element trong tài liệu đầu ra.

## Cú pháp

```xml
<xsl:element name=NAME namespace=URI use-attribute-sets=LIST-OF-NAMES >
  TEMPLATE
</xsl:element>
```

### Thuộc tính bắt buộc

- `name`
  - : Chỉ định tên mong muốn của element đầu ra. Tên phải là một QName hợp lệ.

### Thuộc tính tùy chọn

- `namespace`
  - : Chỉ định namespace của element đầu ra.
- `use-attribute-sets`
  - : Một danh sách tên [`attribute-set` element](/en-US/docs/Web/XML/XSLT/Reference/Element/attribute-set) được phân tách bằng khoảng trắng, sẽ được áp dụng cho element đầu ra của phần tử `element`. Các thuộc tính được áp dụng có thể bị ghi đè thông qua các phần tử `attribute` lồng nhau.

### Kiểu

Chỉ thị, xuất hiện bên trong một template.

## Đặc tả

XSLT, section 7.1.2.

## Hỗ trợ Gecko

Được hỗ trợ.
