---
title: "CanvasCaptureMediaStreamTrack: thuộc tính canvas"
short-title: canvas
slug: Web/API/CanvasCaptureMediaStreamTrack/canvas
page-type: web-api-instance-property
browser-compat: api.CanvasCaptureMediaStreamTrack.canvas
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính chỉ đọc **`canvas`** của giao diện {{domxref("CanvasCaptureMediaStreamTrack")}} trả về {{domxref("HTMLCanvasElement")}} mà từ đó các khung hình đang được ghi lại.

## Value

Một `HTMLCanvasElement` chỉ ra canvas là nguồn của các khung hình đang được ghi lại.

## Example

```js
// Find the canvas element to capture
const canvasElt = document.querySelector("canvas");

// Get the stream
const stream = canvasElt.captureStream(25); // 25 FPS

// Do things to the stream
// …

// Obtain the canvas associated with the stream
const canvas = stream.canvas;
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{domxref("HTMLCanvasElement.captureStream()")}} để tạo một luồng nhằm ghi lại
  một phần tử canvas nhất định.
- {{HTMLElement("canvas")}}
