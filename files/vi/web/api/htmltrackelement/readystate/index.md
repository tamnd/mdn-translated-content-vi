---
title: "HTMLTrackElement: thuộc tính readyState"
short-title: readyState
slug: Web/API/HTMLTrackElement/readyState
page-type: web-api-instance-property
browser-compat: api.HTMLTrackElement.readyState
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`readyState`** của giao diện {{domxref("HTMLTrackElement")}} trả về một số đại diện cho trạng thái sẵn sàng của text track của phần tử {{HTMLElement("track")}}:

0. NONE: Trạng thái chưa tải text track.
1. LOADING: Trạng thái đang tải text track.
2. LOADED: Trạng thái đã tải text track.
3. ERROR: Trạng thái tải text track thất bại.

## Giá trị

Một số; `0`, `1`, `2` hoặc `3`.

## Ví dụ

```js
const trackElement = document.getElementById("exampleTrack");
console.log(trackElement.readyState); // 0, 1, 2, hoặc 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTrackElement")}}
- {{domxref("HTMLMediaElement.readyState")}}
- {{HTMLElement("track")}}
