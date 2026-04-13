---
title: "VideoTrackGenerator: muted property"
short-title: muted
slug: Web/API/VideoTrackGenerator/muted
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.VideoTrackGenerator.muted
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}

Thuộc tính Boolean **`muted`** của giao diện {{domxref("VideoTrackGenerator")}} có thể được sử dụng để tạm thời dừng hoặc tiếp tục tạo khung hình video trong track đầu ra.

## Giá trị

Một giá trị boolean.

## Ví dụ

Để tạm dừng tạo khung hình video:

```js
videoTrackGenerator.muted = true;
```

Để tiếp tục tạo khung hình video:

```js
videoTrackGenerator.muted = false;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
