---
title: "ImageTrackList: ready property"
short-title: ready
slug: Web/API/ImageTrackList/ready
page-type: web-api-instance-property
browser-compat: api.ImageTrackList.ready
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`ready`** của giao diện {{domxref("ImageTrackList")}} trả về một {{jsxref("Promise")}} phân giải khi `ImageTrackList` được điền đầy đủ với các {{domxref("ImageTrack","track")}}.

## Giá trị

Một {{jsxref("Promise")}} phân giải với {{jsxref("undefined")}}.

## Ví dụ

Ví dụ sau in giá trị của `ready` vào bảng điều khiển, giá trị này sẽ là `undefined` khi promise phân giải.

```js
let tracks = imageDecoder.tracks;
let ready = await tracks.ready;
console.log(ready);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
