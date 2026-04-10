---
title: "HTMLIFrameElement: phương thức getSVGDocument()"
short-title: getSVGDocument()
slug: Web/API/HTMLIFrameElement/getSVGDocument
page-type: web-api-instance-method
browser-compat: api.HTMLIFrameElement.getSVGDocument
---

{{APIRef("HTML DOM")}}

Phương thức **`getSVGDocument()`** của giao diện {{domxref("HTMLIFrameElement")}} trả về đối tượng {{domxref("Document")}} của SVG được nhúng.

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
const svgDoc = document.getElementById("el").getSVGDocument();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLEmbedElement.getSVGDocument")}}
- {{domxref("HTMLObjectElement.getSVGDocument")}}
