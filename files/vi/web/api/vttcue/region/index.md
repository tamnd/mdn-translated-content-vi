---
title: "VTTCue: region property"
short-title: region
slug: Web/API/VTTCue/region
page-type: web-api-instance-property
browser-compat: api.VTTCue.region
---

{{APIRef("WebVTT")}}

Thuộc tính **`region`** của giao diện {{domxref("VTTCue")}} trả về và đặt {{domxref("VTTRegion")}} mà cue này thuộc về.

## Giá trị

Một đối tượng {{domxref("VTTRegion")}}.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `region` được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
console.log(cue.region);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
