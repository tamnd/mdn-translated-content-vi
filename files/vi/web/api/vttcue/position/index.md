---
title: "VTTCue: position property"
short-title: position
slug: Web/API/VTTCue/position
page-type: web-api-instance-property
browser-compat: api.VTTCue.position
---

{{APIRef("WebVTT")}}

Thuộc tính **`position`** của giao diện {{domxref("VTTCue")}} đại diện cho độ thụt lề của cue trong dòng.

## Giá trị

Một số, hoặc `"auto"` đại diện cho độ thụt lề của cue trong dòng.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `position` được đặt thành `2`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.position = "2";
console.log(cue.position);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
