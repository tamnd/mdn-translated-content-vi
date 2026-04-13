---
title: "VTTCue: vertical property"
short-title: vertical
slug: Web/API/VTTCue/vertical
page-type: web-api-instance-property
browser-compat: api.VTTCue.vertical
---

{{APIRef("WebVTT")}}

Thuộc tính **`vertical`** của giao diện {{domxref("VTTCue")}} là một chuỗi đại diện cho hướng viết của cue.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `""` (chuỗi rỗng)
  - : Đại diện cho hướng viết ngang.
- `"rl"`
  - : Đại diện cho hướng viết dọc mở rộng sang trái.
- `"lr"`
  - : Đại diện cho hướng viết dọc mở rộng sang phải.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `vertical` được đặt thành `"rl"`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.vertical = "rl";
console.log(cue.vertical);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
