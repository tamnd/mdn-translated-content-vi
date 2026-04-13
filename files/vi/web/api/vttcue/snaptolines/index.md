---
title: "VTTCue: snapToLines property"
short-title: snapToLines
slug: Web/API/VTTCue/snapToLines
page-type: web-api-instance-property
browser-compat: api.VTTCue.snapToLines
---

{{APIRef("WebVTT")}}

Thuộc tính **`snapToLines`** của giao diện {{domxref("VTTCue")}} là một {{jsxref("Boolean")}} cho biết thuộc tính {{domxref("VTTCue.line")}} là số nguyên dòng hay phần trăm kích thước video.

## Giá trị

Một {{jsxref("Boolean")}}.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `snapToLines` được đặt thành `true`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.snapToLines = true;
console.log(cue.snapToLines);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
