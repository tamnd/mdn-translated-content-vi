---
title: "TextTrackCue: id property"
short-title: id
slug: Web/API/TextTrackCue/id
page-type: web-api-instance-property
browser-compat: api.TextTrackCue.id
---

{{APIRef("WebVTT")}}

Thuộc tính **`id`** của giao diện {{domxref("TextTrackCue")}} trả về và đặt định danh cho cue này.

## Giá trị

Một chuỗi chứa ID của cue này.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới (kế thừa từ `TextTrackCue`) được tạo. Thuộc tính `id` sau đó được đặt thành "first", trước khi cue được thêm vào.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.id = "first";
track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
