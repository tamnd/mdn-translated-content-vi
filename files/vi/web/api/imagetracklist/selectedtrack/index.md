---
title: "ImageTrackList: selectedTrack property"
short-title: selectedTrack
slug: Web/API/ImageTrackList/selectedTrack
page-type: web-api-instance-property
browser-compat: api.ImageTrackList.selectedTrack
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`selectedTrack`** của giao diện {{domxref("ImageTrackList")}} trả về một đối tượng {{domxref("ImageTrack")}} đại diện cho track hiện đang được chọn.

## Giá trị

Một đối tượng {{domxref("ImageTrack")}}.

## Ví dụ

Ví dụ sau trả về `selectedTrack` rồi in vào bảng điều khiển.

```js
let track = imageDecoder.tracks.selectedTrack;
console.log(track);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
