---
title: "VideoTrackGenerator: VideoTrackGenerator() constructor"
short-title: VideoTrackGenerator()
slug: Web/API/VideoTrackGenerator/VideoTrackGenerator
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.VideoTrackGenerator.VideoTrackGenerator
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}

Hàm khởi tạo **`VideoTrackGenerator()`** tạo một đối tượng {{domxref("VideoTrackGenerator")}} mới tiêu thụ một luồng khung hình phương tiện và hiển thị một {{domxref("MediaStreamTrack")}}.

## Cú pháp

```js-nolint
new VideoTrackGenerator()
```

## Ví dụ

Trong ví dụ sau, một `VideoTrackGenerator` video mới được tạo.

```js
const trackGenerator = new VideoTrackGenerator();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Insertable streams for MediaStreamTrack](https://developer.chrome.com/docs/capabilities/web-apis/mediastreamtrack-insertable-media-processing)
