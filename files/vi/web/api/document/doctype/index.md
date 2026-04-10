---
title: "Document: thuộc tính doctype"
short-title: doctype
slug: Web/API/Document/doctype
page-type: web-api-instance-property
browser-compat: api.Document.doctype
---

{{ApiRef("DOM")}}

Thuộc tính chỉ đọc **`doctype`** của giao diện {{domxref("Document")}} là một đối tượng {{domxref("DocumentType")}} biểu thị {{glossary("Doctype", "Document Type Declaration (DTD)")}} được liên kết với tài liệu hiện tại.

## Giá trị

Một đối tượng {{domxref("DocumentType")}}.

## Ví dụ

```js
const doctypeObj = document.doctype;

console.log(`doctypeObj.name: ${doctypeObj.name}`);
console.log(`doctypeObj.internalSubset: ${doctypeObj.internalSubset}`);
console.log(`doctypeObj.publicId: ${doctypeObj.publicId}`);
console.log(`doctypeObj.systemId: ${doctypeObj.systemId}`);
```

## Ghi chú

Thuộc tính trả về `null` nếu không có DTD nào được liên kết với tài liệu hiện tại.

DOM level 2 không hỗ trợ chỉnh sửa phần khai báo loại tài liệu.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
