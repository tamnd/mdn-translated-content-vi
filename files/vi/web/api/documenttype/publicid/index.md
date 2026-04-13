---
title: "DocumentType: thuộc tính publicId"
short-title: publicId
slug: Web/API/DocumentType/publicId
page-type: web-api-instance-property
browser-compat: api.DocumentType.publicId
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`publicId`** của {{domxref("DocumentType")}} trả về mã định danh hình thức của tài liệu.

Với `DocumentType` tổng hợp, thuộc tính này phản ánh giá trị được truyền vào tham số của {{domxref("DOMImplementation.createDocumentType()")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const docType = document.implementation.createDocumentType(
  "svg",
  "-//W3C//DTD SVG 1.1//EN",
  "http://www.w3.org/2000/svg",
);

console.log(docType.publicId); // Hiển thị "-//W3C//DTD SVG 1.1//EN"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
