---
title: "ImageTrack: selected property"
short-title: selected
slug: Web/API/ImageTrack/selected
page-type: web-api-instance-property
browser-compat: api.ImageTrack.selected
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`selected`** của giao diện {{domxref("ImageTrack")}} trả về `true` nếu track được chọn để giải mã.

## Giá trị

Một {{jsxref("boolean")}}, nếu `true` track được chọn để giải mã.

## Ví dụ

Ví dụ sau in giá trị của `selected` vào bảng điều khiển.

```js
let track = imageDecoder.tracks.selectedTrack;
console.log(track.selected); // this is the selected track so should return true.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
