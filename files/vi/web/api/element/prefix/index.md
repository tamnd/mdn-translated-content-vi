---
title: "Element: prefix property"
short-title: prefix
slug: Web/API/Element/prefix
page-type: web-api-instance-property
browser-compat: api.Element.prefix
---

{{APIRef("DOM")}}

Thuộc tính **`Element.prefix`** là thuộc tính chỉ đọc trả về the
namespace prefix of the specified element, or `null` if no prefix is
specified.

## Giá trị

Một chuỗi.

## Ví dụ

Các giá trị sau logs "x" to the console.

```xml
<x:div onclick="console.log(this.prefix)"/>
```

## Notes

This will only work when a namespace-aware parser is used, i.e., when a document is
served with an XML MIME type. This will not work for HTML documents.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.namespaceURI")}}
- {{domxref("Element.localName")}}
- {{domxref("Attr.prefix")}}
