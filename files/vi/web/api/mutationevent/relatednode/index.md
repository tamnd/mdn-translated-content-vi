---
title: "MutationEvent: thuộc tính relatedNode"
short-title: relatedNode
slug: Web/API/MutationEvent/relatedNode
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MutationEvent.relatedNode
---

{{APIRef("UI Events")}}{{Deprecated_Header}}{{non-standard_header}}

Thuộc tính chỉ đọc **`relatedNode`** của giao diện {{domxref("MutationEvent")}} trả về một chuỗi cho biết nút liên quan đến sự kiện, như nút được thay đổi bên trong cây con cho `DOMSubtreeModified`.

## Giá trị

Một chuỗi.

## Ví dụ

```js
element.addEventListener("DOMSubtreeModified", (event) => {
  console.log(event.relatedNode);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
