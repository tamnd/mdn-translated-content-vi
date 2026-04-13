---
title: "VideoFrame: visibleRect property"
short-title: visibleRect
slug: Web/API/VideoFrame/visibleRect
page-type: web-api-instance-property
browser-compat: api.VideoFrame.visibleRect
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`visibleRect`** của giao diện {{domxref("VideoFrame")}} trả về một {{domxref("DOMRectReadOnly")}} mô tả hình chữ nhật hiển thị của các pixel cho `VideoFrame` này.

## Giá trị

Một {{domxref("DOMRectReadOnly")}}.

## Ví dụ

Ví dụ sau in `visibleRect` ra console.

```js
console.log(VideoFrame.visibleRect);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
