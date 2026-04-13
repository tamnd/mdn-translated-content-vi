---
title: "MediaStreamTrackGenerator: thuộc tính writable"
short-title: writable
slug: Web/API/MediaStreamTrackGenerator/writable
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.MediaStreamTrackGenerator.writable
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}{{Non-standard_Header}}

Thuộc tính **`writable`** của giao diện {{domxref("MediaStreamTrackGenerator")}} trả về một {{domxref("WritableStream")}}. Điều này cho phép ghi các khung phương tiện vào `MediaStreamTrackGenerator`. Các khung có thể là âm thanh hoặc video. Loại được xác định bởi loại `MediaStreamTrackGenerator` được tạo.

## Giá trị

Một {{domxref("WritableStream")}}.

## Ví dụ

Trong ví dụ sau, các khung video được biến đổi rồi ghi vào {{domxref("WritableStream")}} được truy cập bằng `MediaStreamTrackGenerator.writable`.

```js
const trackProcessor = new MediaStreamTrackProcessor({ track: videoTrack });
const trackGenerator = new MediaStreamTrackGenerator({ kind: "video" });

/* */

trackProcessor.readable
  .pipeThrough(transformer)
  .pipeTo(trackGenerator.writable);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
