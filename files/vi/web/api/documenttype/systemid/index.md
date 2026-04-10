---
title: "DocumentType: thuộc tính systemId"
short-title: systemId
slug: Web/API/DocumentType/systemId
page-type: web-api-instance-property
browser-compat: api.DocumentType.systemId
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`systemId`** của {{domxref("DocumentType")}} trả về URL của DTD liên quan.

Với `DocumentType` tổng hợp, thuộc tính này phản ánh giá trị được truyền vào tham số của {{domxref("DOMImplementation.createDocumentType()")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const docType = document.implementation.createDocumentType(
  "svg",
  "",
  "http://www.w3.org/2000/svg",
);

console.log(docType.systemId); // Hiển thị "http://www.w3.org/2000/svg"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
