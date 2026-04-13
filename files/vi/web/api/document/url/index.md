---
title: "Document: thuộc tính URL"
short-title: URL
slug: Web/API/Document/URL
page-type: web-api-instance-property
browser-compat: api.Document.URL
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`URL`** của giao diện {{domxref("Document")}} trả về vị trí tài liệu dưới dạng chuỗi.

## Giá trị

Một chuỗi chứa URL của tài liệu.

## Ví dụ

### JavaScript

```js
document.getElementById("url").textContent = document.URL;
```

### HTML

```html
<p id="urlText">
  URL:<br />
  <span id="url">URL goes here</span>
</p>
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("document.documentURI")}} trả về cùng giá trị.
