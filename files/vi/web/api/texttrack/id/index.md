---
title: "TextTrack: id property"
short-title: id
slug: Web/API/TextTrack/id
page-type: web-api-instance-property
browser-compat: api.TextTrack.id
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("TextTrack")}} trả về ID của track nếu có.

## Giá trị

Một chuỗi chứa ID, hoặc chuỗi rỗng.

## Ví dụ

Trong ví dụ sau, giá trị của `id` được in ra console.

```js
const video = document.querySelector("video");
const track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
console.log(track.id);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
