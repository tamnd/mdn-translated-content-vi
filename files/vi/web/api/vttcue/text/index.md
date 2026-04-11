---
title: "VTTCue: text property"
short-title: text
slug: Web/API/VTTCue/text
page-type: web-api-instance-property
browser-compat: api.VTTCue.text
---

{{APIRef("WebVTT")}}

Thuộc tính **`text`** của giao diện {{domxref("VTTCue")}} đại diện cho nội dung văn bản của cue.

## Giá trị

Một chuỗi chứa văn bản thô của cue.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `text` được đặt thành chuỗi `"new cue value"`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.text = "new cue value";
console.log(cue.text); // 'new cue value';

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
