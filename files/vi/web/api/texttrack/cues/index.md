---
title: "TextTrack: cues property"
short-title: cues
slug: Web/API/TextTrack/cues
page-type: web-api-instance-property
browser-compat: api.TextTrack.cues
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`cues`** của giao diện {{domxref("TextTrack")}} trả về một đối tượng {{domxref("TextTrackCueList")}} chứa tất cả các cue của track.

## Giá trị

Một đối tượng {{domxref("TextTrackCueList")}}.

## Ví dụ

Trong ví dụ sau, hai cue được thêm vào text track của video bằng `addCue()`. Giá trị của `cues` được in ra console. Đối tượng {{domxref("TextTrackCueList")}} được trả về chứa hai cue.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
track.addCue(new VTTCue(0, 0.9, "Hildy!"));
track.addCue(new VTTCue(1, 1.4, "How are you?"));
console.log(track.cues);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
