---
title: "DOMImplementation: createDocumentType() method"
short-title: createDocumentType()
slug: Web/API/DOMImplementation/createDocumentType
page-type: web-api-instance-method
browser-compat: api.DOMImplementation.createDocumentType
---

{{ ApiRef("DOM")}}

Phương thức **`DOMImplementation.createDocumentType()`** trả về một đối tượng {{domxref("DocumentType")}} có thể được sử dụng với {{domxref("DOMImplementation.createDocument")}} khi tạo tài liệu hoặc được đưa vào tài liệu thông qua các phương thức như {{domxref("Node.insertBefore()")}} hoặc {{domxref("Node.replaceChild()")}}.

## Cú pháp

```js-nolint
createDocumentType(name, publicId, systemId)
```

### Tham số

- `name`
  - : Một chuỗi chứa tên của doctype, như `html`. Tương ứng với thuộc tính {{domxref("DocumentType.name")}}.
- `publicId`
  - : Một chuỗi chứa định danh `PUBLIC`. Tương ứng với thuộc tính {{domxref("DocumentType.publicId")}}.
- `systemId`
  - : Một chuỗi chứa định danh `SYSTEM`. Tương ứng với thuộc tính {{domxref("DocumentType.systemId")}}.

### Giá trị trả về

Một [`DocumentType`](/en-US/docs/Web/API/DocumentType).

## Ví dụ

```js
const dt = document.implementation.createDocumentType(
  "svg",
  "-//W3C//DTD SVG 1.1//EN",
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd",
);
const d = document.implementation.createDocument(
  "http://www.w3.org/2000/svg",
  "svg:svg",
  dt,
);
console.log(d.doctype.publicId); // -//W3C//DTD SVG 1.1//EN
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DOMImplementation")}} mà nó thuộc về.
