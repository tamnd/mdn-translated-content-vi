---
title: "HTMLObjectElement: getSVGDocument() method"
short-title: getSVGDocument()
slug: Web/API/HTMLObjectElement/getSVGDocument
page-type: web-api-instance-method
browser-compat: api.HTMLObjectElement.getSVGDocument
---

{{APIRef("HTML DOM")}}

Phương thức **`getSVGDocument()`** của giao diện {{domxref("HTMLObjectElement")}} trả về đối tượng {{domxref("Document")}} của SVG nhúng.

## Cú pháp

```js-nolint
getSVGDocument()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("Document")}}.

## Ví dụ

```js
const svg = document.getElementById("el").getSVGDocument();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLIFrameElement.getSVGDocument")}}
- {{domxref("HTMLEmbedElement.getSVGDocument")}}
