---
title: <xsl:copy-of>
slug: Web/XML/XSLT/Reference/Element/copy-of
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:copy-of>` tạo một bản sao sâu (bao gồm cả các node con) của bất cứ thứ gì mà thuộc tính select chỉ định vào tài liệu đầu ra.

## Cú pháp

```xml
<xsl:copy-of select=EXPRESSION />
```

### Thuộc tính bắt buộc

- `select`
  - : Dùng một biểu thức XPath chỉ định phần nào sẽ được sao chép.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Chỉ thị, xuất hiện bên trong một template.

## Đặc tả

XSLT, section 11.3.

## Hỗ trợ Gecko

Được hỗ trợ.
