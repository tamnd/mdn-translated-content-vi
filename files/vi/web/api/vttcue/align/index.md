---
title: "VTTCue: align property"
short-title: align
slug: Web/API/VTTCue/align
page-type: web-api-instance-property
browser-compat: api.VTTCue.align
---

{{APIRef("WebVTT")}}

Thuộc tính **`align`** của giao diện {{domxref("VTTCue")}} đại diện cho căn chỉnh của tất cả các dòng văn bản trong hộp văn bản.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `"start"`
  - : Căn chỉnh về đầu.
- `"center"`
  - : Căn chỉnh giữa.
- `"end"`
  - : Căn chỉnh về cuối.
- `"left"`
  - : Căn chỉnh trái.
- `"right"`
  - : Căn chỉnh phải.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `align` được đặt thành `"start"`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.align = "start";
console.log(cue.align);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
