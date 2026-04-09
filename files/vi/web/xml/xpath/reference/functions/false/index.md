---
title: "false"
slug: Web/XML/XPath/Reference/Functions/false
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `false` trả về giá trị boolean false.

## Cú pháp

```plain
false()
```

### Giá trị trả về

Boolean `false`.

## Mô tả

Hàm này hữu ích trong phép so sánh:

```xml
<xsl:if test="boolean((1 &gt; 2) = false())">
  Biểu thức đánh giá là true
</xsl:if>
```

## Đặc tả

[XPath 1.0 4.3](https://www.w3.org/TR/xpath-10/#function-false)

## Hỗ trợ Gecko

Được hỗ trợ.
