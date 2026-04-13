---
title: "ImageTrack: repetitionCount property"
short-title: repetitionCount
slug: Web/API/ImageTrack/repetitionCount
page-type: web-api-instance-property
browser-compat: api.ImageTrack.repetitionCount
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`repetitionCount`** của giao diện {{domxref("ImageTrack")}} trả về số lần lặp lại của track này.

## Giá trị

Một số nguyên.

## Ví dụ

Ví dụ sau in giá trị của `repetitionCount` vào bảng điều khiển.

```js
let track = imageDecoder.tracks.selectedTrack;
console.log(track.repetitionCount);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
