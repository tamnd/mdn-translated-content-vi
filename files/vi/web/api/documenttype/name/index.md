---
title: "DocumentType: thuộc tính name"
short-title: name
slug: Web/API/DocumentType/name
page-type: web-api-instance-property
browser-compat: api.DocumentType.name
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`name`** của {{domxref("DocumentType")}} trả về kiểu của tài liệu.

Với `DocumentType` tổng hợp, thuộc tính này phản ánh giá trị được truyền vào tham số của {{domxref("DOMImplementation.createDocumentType()")}}.

Với tài liệu HTML, trình duyệt luôn đặt giá trị này là `html`, bất kể `doctype` thực tế trong mã nguồn là gì.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const docType = document.implementation.createDocumentType("html", "", "");

console.log(docType.name); // Hiển thị `html`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
