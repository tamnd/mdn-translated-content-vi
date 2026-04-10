---
title: "Document: thuộc tính documentURI"
short-title: documentURI
slug: Web/API/Document/documentURI
page-type: web-api-instance-property
browser-compat: api.Document.documentURI
---

{{ApiRef("DOM")}}

Thuộc tính chỉ đọc **`documentURI`** của giao diện {{domxref("Document")}} trả về vị trí của tài liệu dưới dạng một chuỗi.

## Giá trị

Một chuỗi.

## Ví dụ

### JavaScript

```js
document.getElementById("url").textContent = document.documentURI;
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

- Thuộc tính {{domxref("document.URL")}} trả về cùng giá trị.
