---
title: "MediaStreamTrackEvent: thuộc tính track"
short-title: track
slug: Web/API/MediaStreamTrackEvent/track
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrackEvent.track
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính chỉ đọc **`track`** của giao diện {{domxref("MediaStreamTrackEvent")}} trả về {{domxref("MediaStreamTrack")}} liên quan đến sự kiện này.

## Giá trị

Một đối tượng {{domxref("MediaStreamTrack")}}.

## Ví dụ

```js
const stream = new MediaStream();

stream.addEventListener("removetrack", (event) => {
  console.log(`${event.track.kind} track removed`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("MediaStream/addtrack_event", "addtrack")}} và {{domxref("MediaStream/removetrack_event", "removetrack")}}
- {{domxref("MediaStreamTrack")}}
