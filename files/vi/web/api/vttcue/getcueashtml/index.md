---
title: "VTTCue: getCueAsHTML() method"
short-title: getCueAsHTML()
slug: Web/API/VTTCue/getCueAsHTML
page-type: web-api-instance-method
browser-compat: api.VTTCue.getCueAsHTML
---

{{APIRef("WebVTT")}}

Phương thức **`getCueAsHTML()`** của giao diện {{domxref("VTTCue")}} trả về một {{domxref("DocumentFragment")}} chứa nội dung của cue.

## Cú pháp

```js-nolint
getCueAsHTML()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("DocumentFragment")}}.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo. Giá trị dưới dạng document fragment sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
console.log(cue.getCueAsHTML());

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
