---
title: "HTMLMediaElement: thuộc tính seeking"
short-title: seeking
slug: Web/API/HTMLMediaElement/seeking
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.seeking
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`seeking`** của giao diện {{domxref("HTMLMediaElement")}} là Boolean cho biết tài nguyên, {{htmlelement("audio")}} hay {{htmlelement("video")}}, đang trong quá trình tìm kiếm vị trí mới.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const el = document.querySelector("video");
console.log(el.seeking); // true or false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("HTMLMediaElement.seeking_event", "seeking")}}
- Sự kiện {{domxref("HTMLMediaElement.seeked_event", "seeked")}}
- {{domxref("HTMLVideoElement")}}
- {{domxref("HTMLAudioElement")}}
