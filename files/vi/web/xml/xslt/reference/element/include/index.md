---
title: <xsl:include>
slug: Web/XML/XSLT/Reference/Element/include
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:include>` gộp nội dung của một stylesheet với một stylesheet khác. Không giống như `<xsl:import>`, nội dung của stylesheet được bao gồm có chính xác cùng độ ưu tiên với nội dung của stylesheet bao gồm nó.

## Cú pháp

```xml
<xsl:include href=URI />
```

### Thuộc tính bắt buộc

- `href`
  - : Chỉ định URI của stylesheet cần bao gồm.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Phần tử cấp cao nhất, có thể xuất hiện ở bất kỳ thứ tự nào như một phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Đặc tả

XSLT, phần 2.6.1.

## Hỗ trợ Gecko

Được hỗ trợ.
