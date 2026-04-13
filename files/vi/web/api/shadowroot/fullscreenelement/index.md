---
title: "ShadowRoot: thuộc tính fullscreenElement"
short-title: fullscreenElement
slug: Web/API/ShadowRoot/fullscreenElement
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.fullscreenElement
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`fullscreenElement`** của giao diện {{domxref("ShadowRoot")}} trả về phần tử bên trong cây shadow hiện đang được hiển thị ở chế độ toàn màn hình.

## Giá trị

{{domxref('Element')}} hiện đang được hiển thị ở chế độ toàn màn hình, hoặc `null` nếu không có phần tử toàn màn hình.

## Ví dụ

```js
let customElem = document.querySelector("my-shadow-dom-element");
let shadow = customElem.shadowRoot;
let fullscreenElem = shadow.fullscreenElement;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.fullscreenElement")}}
