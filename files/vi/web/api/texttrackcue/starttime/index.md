---
title: "TextTrackCue: startTime property"
short-title: startTime
slug: Web/API/TextTrackCue/startTime
page-type: web-api-instance-property
browser-compat: api.TextTrackCue.startTime
---

{{APIRef("WebVTT")}}

Thuộc tính **`startTime`** của giao diện {{domxref("TextTrackCue")}} trả về và đặt thời gian bắt đầu của cue.

## Giá trị

Một số đại diện cho thời gian bắt đầu, tính bằng giây.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới (kế thừa từ `TextTrackCue`) được tạo bắt đầu từ giây 0,1 và kết thúc vào giây 0,9. Thuộc tính `startTime` sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0.1, 0.9, "Hildy!");
console.log(cue.startTime); // 0.1
track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
