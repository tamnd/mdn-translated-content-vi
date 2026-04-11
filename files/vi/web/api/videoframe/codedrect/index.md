---
title: "VideoFrame: codedRect property"
short-title: codedRect
slug: Web/API/VideoFrame/codedRect
page-type: web-api-instance-property
browser-compat: api.VideoFrame.codedRect
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`codedRect`** của giao diện {{domxref("VideoFrame")}} trả về một {{domxref("DOMRectReadOnly")}} với chiều rộng và chiều cao khớp với {{domxref("VideoFrame.codedWidth")}} và {{domxref("VideoFrame.codedHeight")}}.

## Giá trị

Một {{domxref("DOMRectReadOnly")}}.

## Ví dụ

Ví dụ sau in `codedRect` ra console.

```js
console.log(VideoFrame.codedRect);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
