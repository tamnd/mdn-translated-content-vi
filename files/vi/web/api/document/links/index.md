---
title: "Document: thuộc tính links"
short-title: links
slug: Web/API/Document/links
page-type: web-api-instance-property
browser-compat: api.Document.links
---

{{ APIRef("DOM") }}

Thuộc tính chỉ đọc **`links`** của giao diện {{domxref("Document")}} trả về một bộ sưu tập gồm tất cả các phần tử {{HTMLElement("area")}} và {{HTMLElement("a")}} trong tài liệu có giá trị cho thuộc tính [href](/en-US/docs/Web/HTML/Reference/Elements/a#href).

## Giá trị

Một {{domxref("HTMLCollection")}}.

## Ví dụ

```js
for (const link of document.links) {
  const linkHref = document.createTextNode(link.href);
  const lineBreak = document.createElement("br");
  document.body.appendChild(linkHref);
  document.body.appendChild(lineBreak);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
