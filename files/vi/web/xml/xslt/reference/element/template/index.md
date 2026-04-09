---
title: <xsl:template>
slug: Web/XML/XSLT/Reference/Element/template
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:template>` xác định một template tạo ra đầu ra. Phần tử này phải có либо thuộc tính match hoặc thuộc tính name được đặt.

## Syntax

```xml
<xsl:template
  match=PATTERN
  name=NAME
  mode=NAME
  priority=NUMBER>
  <xsl:param> [optional]
  TEMPLATE
</xsl:template>
```

### Required Attributes

Không có.

### Optional Attributes

- `match`
  - : Chỉ định một pattern xác định các phần tử mà template này sẽ được dùng cho. Đây là thuộc tính bắt buộc nếu không có thuộc tính `name`.
- `name`
  - : Chỉ định tên cho template này, qua đó nó có thể được gọi bằng phần tử `<xsl:call-template>`.
- `mode`
  - : Chỉ định một chế độ cụ thể cho template này, có thể được khớp bởi một thuộc tính của phần tử `<xsl:apply-templates>`. Điều này hữu ích khi xử lý cùng một thông tin theo nhiều cách khác nhau.
- `priority`
  - : Chỉ định mức ưu tiên số cho template này. Đây có thể là bất kỳ số nào khác `Infinity`. Bộ xử lý dùng số này khi có nhiều hơn một template khớp cùng một nút.

### Type

Cấp cao nhất, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Specifications

XSLT, section 5.3.

## Gecko support

Được hỗ trợ.
