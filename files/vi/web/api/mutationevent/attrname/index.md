---
title: "MutationEvent: thuộc tính attrName"
short-title: attrName
slug: Web/API/MutationEvent/attrName
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MutationEvent.attrName
---

{{APIRef("UI Events")}}{{Deprecated_Header}}{{non-standard_header}}

Thuộc tính chỉ đọc **`attrName`** của giao diện {{domxref("MutationEvent")}} trả về một chuỗi với tên của nút bị ảnh hưởng bởi sự kiện `DOMAttrModified`. Nó không có ý nghĩa cho các sự kiện khác và được đặt thành chuỗi rỗng (`""`).

## Giá trị

Một chuỗi.

## Ví dụ

```js
element.addEventListener("DOMAttrModified", (event) => {
  console.log(event.attrName);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
