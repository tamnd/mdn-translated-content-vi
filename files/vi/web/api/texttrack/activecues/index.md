---
title: "TextTrack: activeCues property"
short-title: activeCues
slug: Web/API/TextTrack/activeCues
page-type: web-api-instance-property
browser-compat: api.TextTrack.activeCues
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`activeCues`** của giao diện {{domxref("TextTrack")}} trả về một đối tượng {{domxref("TextTrackCueList")}} liệt kê các cue hiện đang hoạt động.

## Giá trị

Một đối tượng {{domxref("TextTrackCueList")}}.

## Ví dụ

Ví dụ sau thêm một `TextTrack` mới vào video. `activeCues` được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
console.log(track.activeCues);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
