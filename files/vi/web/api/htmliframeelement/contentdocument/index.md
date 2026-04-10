---
title: "HTMLIFrameElement: thuộc tính contentDocument"
short-title: contentDocument
slug: Web/API/HTMLIFrameElement/contentDocument
page-type: web-api-instance-property
browser-compat: api.HTMLIFrameElement.contentDocument
---

{{APIRef("HTML DOM")}}

Nếu iframe và tài liệu cha của iframe có [cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy), trả về một [`Document`](/en-US/docs/Web/API/Document) (tức là tài liệu đang hoạt động trong ngữ cảnh duyệt web lồng ghép của khung nội tuyến), ngược lại trả về `null`.

## Ví dụ về contentDocument

```js
const iframeDocument = document.querySelector("iframe").contentDocument;

iframeDocument.body.style.backgroundColor = "blue";
// Dòng này sẽ chuyển iframe thành màu xanh dương.
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
