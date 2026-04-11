---
title: "VTTCue: size property"
short-title: size
slug: Web/API/VTTCue/size
page-type: web-api-instance-property
browser-compat: api.VTTCue.size
---

{{APIRef("WebVTT")}}

Thuộc tính **`size`** của giao diện {{domxref("VTTCue")}} đại diện cho kích thước của cue theo phần trăm kích thước video.

## Giá trị

Một số đại diện cho kích thước của cue theo phần trăm kích thước video.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `size` được đặt thành `50`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.size = 50;
console.log(cue.size);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
