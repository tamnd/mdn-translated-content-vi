---
title: "VTTCue: line property"
short-title: line
slug: Web/API/VTTCue/line
page-type: web-api-instance-property
browser-compat: api.VTTCue.line
---

{{APIRef("WebVTT")}}

Thuộc tính **`line`** của giao diện {{domxref("VTTCue")}} đại diện cho dòng cue của WebVTT cue này.

## Giá trị

Một số, hoặc `"auto"` đại diện cho dòng cue của WebVTT cue này.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `line` được đặt thành `1`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.line = "1";
console.log(cue.line);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
