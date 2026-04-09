---
title: key
slug: Web/XML/XPath/Reference/Functions/key
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `key` trả về một node-set gồm các nút có giá trị đã cho cho khóa đã cho.

## Cú pháp

```plain
key( keyname, value )
```

### Tham số

- `keyname`
  - : Một chuỗi chứa tên của phần tử [`xsl:key`](/en-US/docs/Web/XML/XSLT/Reference/Element/key) sẽ được dùng.
- `value`
  - : Node-set trả về sẽ chứa mọi nút có giá trị này cho khóa đã cho.

### Giá trị trả về

Một node-set.

## Mô tả

- Phần tử [`xsl:key`](/en-US/docs/Web/XML/XSLT/Reference/Element/key) xác định thuộc tính nào trên những phần tử nào sẽ được dùng để khớp khóa.

Hàm này là một bổ sung riêng của XSLT cho XPath. Nó không thuộc thư viện hàm cốt lõi của XPath.

## Đặc tả

[XSLT 1.0 12.2](https://www.w3.org/TR/xslt-10/#function-key)

## Hỗ trợ Gecko

Được hỗ trợ.
