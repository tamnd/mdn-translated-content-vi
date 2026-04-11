---
title: OffscreenCanvas: contextrestored event
slug: Web/API/OffscreenCanvas/contextrestored_event
page-type: web-api-event
browser-compat: api.OffscreenCanvas.contextrestored_event
---

{{APIRef("Canvas API")}}

Sự kiện **`contextrestored`** được kích hoạt khi trình duyệt khôi phục thành công ngữ cảnh {{domxref("OffscreenCanvasRenderingContext2D")}}.

## Loại sự kiện

{{domxref("Event")}}

## Ví dụ

```js
offscreenCanvas.addEventListener("contextrestored", (event) => {
  console.log("Ngữ cảnh đã được khôi phục");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
