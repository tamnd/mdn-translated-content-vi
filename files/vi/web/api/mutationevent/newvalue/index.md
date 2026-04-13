---
title: "MutationEvent: thuộc tính newValue"
short-title: newValue
slug: Web/API/MutationEvent/newValue
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MutationEvent.newValue
---

{{APIRef("UI Events")}}{{Deprecated_Header}}{{non-standard_header}}

Thuộc tính chỉ đọc **`newValue`** của giao diện {{domxref("MutationEvent")}} trả về một chuỗi. Trong các sự kiện `DOMAttrModified`, nó đại diện cho giá trị mới của nút {{domxref("Attr")}}. Trong các sự kiện `DOMCharacterDataModified`, nó chứa giá trị mới của nút {{domxref("CharacterData")}}. Trong tất cả các trường hợp khác, trả về chuỗi rỗng (`""`).

## Giá trị

Một chuỗi.

## Ví dụ

```js
element.addEventListener("DOMAttrModified", (event) => {
  console.log(event.newValue);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
