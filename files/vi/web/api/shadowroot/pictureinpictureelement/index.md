---
title: "ShadowRoot: thuộc tính pictureInPictureElement"
short-title: pictureInPictureElement
slug: Web/API/ShadowRoot/pictureInPictureElement
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.pictureInPictureElement
---

{{APIRef("Picture-in-Picture API")}}

Thuộc tính chỉ đọc **`pictureInPictureElement`** của giao diện {{domxref("ShadowRoot")}} trả về {{domxref("Element")}} hiện đang được trình bày ở chế độ picture-in-picture trong cây shadow này, hoặc `null` nếu hiện tại không dùng chế độ picture-in-picture.

## Giá trị

Một tham chiếu đến đối tượng {{domxref("Element")}} hiện đang ở chế độ picture-in-picture.

Trả về `null` nếu cây shadow không có phần tử liên kết nào ở chế độ picture-in-picture. Ví dụ, không có phần tử picture-in-picture, hoặc phần tử đó không nằm trong cây shadow.

## Ví dụ

```js
let customElem = document.querySelector("my-shadow-dom-element");
let shadow = customElem.shadowRoot;
let pipElem = shadow.pictureInPictureElement;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.pictureInPictureElement")}}
