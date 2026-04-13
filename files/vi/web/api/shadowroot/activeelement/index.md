---
title: "ShadowRoot: thuộc tính activeElement"
short-title: activeElement
slug: Web/API/ShadowRoot/activeElement
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.activeElement
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`activeElement`** của giao diện {{domxref("ShadowRoot")}} trả về phần tử bên trong cây shadow đang có tiêu điểm.

## Giá trị

{{domxref('Element')}} hiện đang có tiêu điểm, hoặc `null` nếu không có phần tử nào đang được focus.

## Ví dụ

```js
let customElem = document.querySelector("my-shadow-dom-element");
let shadow = customElem.shadowRoot;
let focusedElem = shadow.activeElement;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.activeElement")}}
