---
title: "TextTrack: language property"
short-title: language
slug: Web/API/TextTrack/language
page-type: web-api-instance-property
browser-compat: api.TextTrack.language
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`language`** của giao diện {{domxref("TextTrack")}} trả về ngôn ngữ của text track.

## Giá trị

Một chuỗi chứa mã định danh ngôn ngữ. Đây sẽ là {{glossary("BCP 47 language tag")}} hợp lệ, ví dụ `"en-US"` cho tiếng Anh Mỹ hoặc `"pt-BR"` cho tiếng Bồ Đào Nha Brazil.

## Ví dụ

Trong ví dụ sau, giá trị của `language` được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en-US");
track.mode = "showing";
console.log(track.language);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
