---
title: "Window: thuộc tính documentPictureInPicture"
short-title: documentPictureInPicture
slug: Web/API/Window/documentPictureInPicture
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Window.documentPictureInPicture
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

The **`documentPictureInPicture`** read-only property of the
{{domxref("Window")}} interface returns a reference to the {{domxref("DocumentPictureInPicture")}} object for the current document context.

## Giá trị

A {{domxref("DocumentPictureInPicture")}} object instance.

## Ví dụ

```js
const videoPlayer = document.getElementById("player");

// …

// Open a Picture-in-Picture window.
await window.documentPictureInPicture.requestWindow({
  width: videoPlayer.clientWidth,
  height: videoPlayer.clientHeight,
});

// …
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}}
- [Using the Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using)
