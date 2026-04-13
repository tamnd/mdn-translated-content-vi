---
title: "ImageTrack: animated property"
short-title: animated
slug: Web/API/ImageTrack/animated
page-type: web-api-instance-property
browser-compat: api.ImageTrack.animated
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`animated`** của giao diện {{domxref("ImageTrack")}} trả về `true` nếu track được hoạt hình hóa và do đó có nhiều khung hình.

## Giá trị

Một {{jsxref("boolean")}}, nếu `true` đây là track hoạt hình.

## Ví dụ

Ví dụ sau in giá trị của `animated` vào bảng điều khiển.

```js
let track = imageDecoder.tracks.selectedTrack;
console.log(track.animated);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
