---
title: <xsl:message>
slug: Web/XML/XSLT/Reference/Element/message
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:message>` xuất ra một thông báo (tới JavaScript Console trong NS) và tùy chọn chấm dứt việc thực thi stylesheet. Nó có thể hữu ích cho việc gỡ lỗi.

## Cú pháp

```xml
<xsl:message terminate="yes" | "no" >
  TEMPLATE
</xsl:message>
```

### Thuộc tính bắt buộc

Không có.

### Thuộc tính tùy chọn

- `terminate`
  - : Đặt thành `yes` để cho biết việc thực thi nên bị chấm dứt. Giá trị mặc định là `no`, trong trường hợp đó thông báo được xuất ra và việc thực thi tiếp tục.

### Kiểu

Chỉ thị, xuất hiện bên trong một template.

## Đặc tả

XSLT, phần 13.

## Hỗ trợ Gecko

Được hỗ trợ.
