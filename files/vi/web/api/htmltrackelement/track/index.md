---
title: "HTMLTrackElement: thuộc tính track"
short-title: track
slug: Web/API/HTMLTrackElement/track
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.track
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`track`** của giao diện {{domxref("HTMLTrackElement")}} trả về một đối tượng {{DOMxRef("TextTrack")}} tương ứng với text track của phần tử {{HTMLElement("track")}}.

## Giá trị

Một đối tượng {{DOMxRef("TextTrack")}}.

## Ví dụ

```js
const trackElement = document.getElementById("exampleTrack");
console.dir(trackElement.track);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement")}}
- {{domxref("textTrack")}}
- {{HTMLElement("track")}}
