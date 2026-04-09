---
title: <xsl:key>
slug: Web/XML/XSLT/Reference/Element/key
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:key>` khai báo một khóa có tên, có thể được dùng ở nơi khác trong stylesheet bằng hàm `key()`.

## Cú pháp

```xml
<xsl:key name=NAME match=EXPRESSION
  use=EXPRESSION />
```

### Thuộc tính bắt buộc

- `name`
  - : Chỉ định tên cho khóa này. Phải là một QName.
- `match`
  - : Xác định các node mà khóa này áp dụng cho.
- `use`
  - : Chỉ định một biểu thức XPath sẽ được dùng để xác định giá trị của khóa cho từng node áp dụng.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Phần tử cấp cao nhất, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Đặc tả

XSLT, phần 12.2.

## Hỗ trợ Gecko

Được hỗ trợ.
