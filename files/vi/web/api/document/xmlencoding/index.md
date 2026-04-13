---
title: "Document: thuộc tính xmlEncoding"
short-title: xmlEncoding
slug: Web/API/Document/xmlEncoding
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.xmlEncoding
---

{{APIRef("DOM")}}{{deprecated_header}}

Trả về encoding như được xác định bởi XML declaration. Sẽ là `null` nếu không được chỉ định hoặc không xác định.

> [!WARNING]
> Không sử dụng thuộc tính này; nó đã bị xóa khỏi đặc tả DOM Level 4 và không còn được hỗ trợ trong Firefox 10.0.

Xét XML Declaration sau:

```xml
<?xml version="1.0" encoding="UTF-16"?>
```

Khi đó, kết quả sẽ là "UTF-16".

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
