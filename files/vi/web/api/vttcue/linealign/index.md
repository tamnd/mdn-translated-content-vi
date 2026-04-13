---
title: "VTTCue: lineAlign property"
short-title: lineAlign
slug: Web/API/VTTCue/lineAlign
page-type: web-api-instance-property
browser-compat: api.VTTCue.lineAlign
---

{{APIRef("WebVTT")}}

Thuộc tính **`lineAlign`** của giao diện {{domxref("VTTCue")}} đại diện cho căn chỉnh của VTT cue này.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `"start"`
  - : Căn chỉnh về đầu.
- `"center"`
  - : Căn chỉnh giữa.
- `"end"`
  - : Căn chỉnh về cuối.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `lineAlign` được đặt thành `"center"`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.lineAlign = "center";
console.log(cue.lineAlign);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
