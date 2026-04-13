---
title: "ImageTrackList: selectedIndex property"
short-title: selectedIndex
slug: Web/API/ImageTrackList/selectedIndex
page-type: web-api-instance-property
browser-compat: api.ImageTrackList.selectedIndex
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`selectedIndex`** của giao diện {{domxref("ImageTrackList")}} trả về `index` của track đang được chọn.

## Giá trị

Một số nguyên.

## Ví dụ

Ví dụ sau in giá trị của `selectedIndex` vào bảng điều khiển.

```js
let tracks = imageDecoder.tracks;
console.log(tracks.selectedIndex);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
