---
title: "DocumentType: phương thức replaceWith()"
short-title: replaceWith()
slug: Web/API/DocumentType/replaceWith
page-type: web-api-instance-method
browser-compat: api.DocumentType.replaceWith
---

{{APIRef("DOM")}}

Phương thức **`DocumentType.replaceWith()`** thay thế kiểu tài liệu bằng một tập hợp các nút đã cho.

## Cú pháp

```js-nolint
replaceWith(node1)
replaceWith(node1, node2)
replaceWith(node1, node2, /* …, */ nodeN)
```

### Tham số

- `node1`, ..., `nodeN`
  - : Một tập hợp các nút dùng để thay thế {{domxref("DocumentType")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi nút không thể được chèn tại điểm đã chỉ định trong cây phân cấp.

## Ví dụ

### Sử dụng `replaceWith()`

```js
let svgDt = document.implementation.createDocumentType(
  "svg:svg",
  "-//W3C//DTD SVG 1.1//EN",
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd",
);

document.doctype.replaceWith(svgDt);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.replaceWith()")}}
- {{domxref("Element.replaceWith()")}}
- {{domxref("CharacterData.replaceWith()")}}
