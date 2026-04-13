---
title: "TextTrackCue: track property"
short-title: track
slug: Web/API/TextTrackCue/track
page-type: web-api-instance-property
browser-compat: api.TextTrackCue.track
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`track`** của giao diện {{domxref("TextTrackCue")}} trả về đối tượng {{domxref("TextTrack")}} mà cue này thuộc về.

## Giá trị

Một đối tượng {{domxref("TextTrack")}}.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới (kế thừa từ `TextTrackCue`) được tạo, sau đó được thêm vào một track. Giá trị của `track` được in ra console.

```js
const video = document.querySelector("video");
const captionTrack = video.addTextTrack("captions", "Captions", "en");
captionTrack.mode = "showing";

const cue = new VTTCue(0, 0.9, "Hildy!");
captionTrack.addCue(cue);
console.log(cue.track); // a TextTrack object.
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
