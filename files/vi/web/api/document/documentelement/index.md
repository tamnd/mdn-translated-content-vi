---
title: "Document: thuộc tính documentElement"
short-title: documentElement
slug: Web/API/Document/documentElement
page-type: web-api-instance-property
browser-compat: api.Document.documentElement
---

{{ApiRef("DOM")}}

Thuộc tính chỉ đọc **`documentElement`** của giao diện {{domxref("Document")}} trả về {{domxref("Element")}} là phần tử gốc của {{domxref("document")}} (ví dụ: phần tử {{HTMLElement("html")}} đối với tài liệu HTML).

## Giá trị

Một đối tượng {{domxref("Element")}}.

## Ví dụ

```js
const rootElement = document.documentElement;
const firstTier = rootElement.childNodes;
// firstTier là NodeList chứa các phần tử con trực tiếp của phần tử gốc
// chẳng hạn như <head> và <body>

for (const child of firstTier) {
  // thực hiện thao tác với từng phần tử con trực tiếp của phần tử gốc
}
```

## Ghi chú

Đối với bất kỳ tài liệu HTML nào không rỗng, `documentElement` sẽ luôn là một phần tử {{HTMLElement("html")}}. Đối với bất kỳ tài liệu XML nào không rỗng, `documentElement` sẽ luôn là phần tử gốc của tài liệu đó.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
