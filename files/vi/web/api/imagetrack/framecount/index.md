---
title: "ImageTrack: frameCount property"
short-title: frameCount
slug: Web/API/ImageTrack/frameCount
page-type: web-api-instance-property
browser-compat: api.ImageTrack.frameCount
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`frameCount`** của giao diện {{domxref("ImageTrack")}} trả về số lượng khung hình trong track.

## Giá trị

Một số nguyên.

## Ví dụ

Ví dụ sau in giá trị của `frameCount` vào bảng điều khiển.

```js
let track = imageDecoder.tracks.selectedTrack;
console.log(track.frameCount);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
