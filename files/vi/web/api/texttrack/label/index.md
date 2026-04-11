---
title: "TextTrack: label property"
short-title: label
slug: Web/API/TextTrack/label
page-type: web-api-instance-property
browser-compat: api.TextTrack.label
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("TextTrack")}} trả về nhãn có thể đọc được cho text track, nếu có.

## Giá trị

Một chuỗi chứa `label`, hoặc chuỗi rỗng.

## Ví dụ

Trong ví dụ sau, giá trị của `label` được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
console.log(track.label);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
