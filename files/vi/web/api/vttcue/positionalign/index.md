---
title: "VTTCue: positionAlign property"
short-title: positionAlign
slug: Web/API/VTTCue/positionAlign
page-type: web-api-instance-property
browser-compat: api.VTTCue.positionAlign
---

{{APIRef("WebVTT")}}

Thuộc tính **`positionAlign`** của giao diện {{domxref("VTTCue")}} được dùng để xác định điểm neo của {{domxref("VTTCue.position")}}.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `"line-left"`
  - : Căn chỉnh trái dòng.
- `"center"`
  - : Căn chỉnh giữa.
- `"line-right"`
  - : Căn chỉnh phải dòng.
- `"auto"`
  - : Căn chỉnh tự động, phụ thuộc vào căn chỉnh văn bản của cue, được hiểu như sau:
    - **line-left:** nếu căn chỉnh văn bản là left, cue dùng ngôn ngữ LTR và căn chỉnh văn bản là start, hoặc cue dùng ngôn ngữ RTL và căn chỉnh văn bản là end.
    - **line-right:** nếu căn chỉnh văn bản là right, cue dùng ngôn ngữ RTL và căn chỉnh văn bản là start, hoặc cue dùng ngôn ngữ LTR và căn chỉnh văn bản là end.
    - **center:** nếu không có vị trí căn chỉnh văn bản nào được đặt.

## Ví dụ

Trong ví dụ sau, một {{domxref("VTTCue")}} mới được tạo, sau đó giá trị của `positionAlign` được đặt thành `"line-right"`. Giá trị sau đó được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";

let cue = new VTTCue(0, 0.9, "Hildy!");
cue.positionAlign = "line-right";
console.log(cue.positionAlign);

track.addCue(cue);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
