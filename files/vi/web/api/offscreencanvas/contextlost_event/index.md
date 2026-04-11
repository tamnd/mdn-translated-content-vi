---
title: OffscreenCanvas: contextlost event
slug: Web/API/OffscreenCanvas/contextlost_event
page-type: web-api-event
browser-compat: api.OffscreenCanvas.contextlost_event
---

{{APIRef("Canvas API")}}

Sự kiện **`contextlost`** được kích hoạt khi trình duyệt phát hiện ngữ cảnh {{domxref("OffscreenCanvasRenderingContext2D")}} bị mất.

## Loại sự kiện

{{domxref("Event")}}

## Ví dụ

```js
offscreenCanvas.addEventListener("contextlost", (event) => {
  console.log("Ngữ cảnh đã bị mất");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
