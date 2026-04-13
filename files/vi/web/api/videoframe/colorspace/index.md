---
title: "VideoFrame: colorSpace property"
short-title: colorSpace
slug: Web/API/VideoFrame/colorSpace
page-type: web-api-instance-property
browser-compat: api.VideoFrame.colorSpace
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`colorSpace`** của giao diện {{domxref("VideoFrame")}} trả về một đối tượng {{domxref("VideoColorSpace")}} đại diện cho không gian màu của video.

## Giá trị

Một đối tượng {{domxref("VideoColorSpace")}}.

## Ví dụ

Ví dụ sau in `colorSpace` ra console.

```js
const cnv = document.createElement("canvas");
// draw something on the canvas
// …
const videoFrame = new VideoFrame(cnv, { timestamp: 0 });
console.log(videoFrame.colorSpace);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
