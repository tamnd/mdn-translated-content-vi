---
title: "ProcessingInstruction: thuộc tính sheet"
short-title: sheet
slug: Web/API/ProcessingInstruction/sheet
page-type: web-api-instance-property
browser-compat: api.ProcessingInstruction.sheet
---

{{ApiRef("DOM")}}

Thuộc tính **`sheet`** chỉ đọc của giao diện {{domxref("ProcessingInstruction")}}
chứa bảng kiểu được liên kết với `ProcessingInstruction`.

Chỉ thị xử lý `xml-stylesheet` được sử dụng để liên kết một bảng kiểu trong tệp XML.

## Giá trị

Đối tượng {{DOMxref("Stylesheet")}} được liên kết, hoặc `null` nếu không có.

## Ví dụ

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/css" href="rule.css"?>
…
```

Thuộc tính `sheet` của chỉ thị xử lý sẽ trả về đối tượng {{domxref("StyleSheet")}} mô tả `rule.css`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [DOM API](/en-US/docs/Web/API/Document_Object_Model)
