---
title: "HTMLTrackElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLTrackElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.src
---

{{APIRef("HTML DOM")}}

Thuộc tính **`src`** của giao diện {{domxref("HTMLTrackElement")}} phản ánh giá trị của thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/track#src) của phần tử {{HTMLElement("track")}}, cho biết URL của dữ liệu text track.

## Giá trị

Một chuỗi chứa URL của dữ liệu text track.

## Ví dụ

```js
const trackElement = document.getElementById("exampleTrack");
console.log(`URL của Track: ${trackElement.src}`);
trackElement.src = "newTrack.vtt";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement")}}
- {{HTMLElement("track")}}
