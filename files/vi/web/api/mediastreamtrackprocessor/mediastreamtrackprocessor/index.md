---
title: "MediaStreamTrackProcessor: hàm khởi tạo MediaStreamTrackProcessor()"
short-title: MediaStreamTrackProcessor()
slug: Web/API/MediaStreamTrackProcessor/MediaStreamTrackProcessor
page-type: web-api-constructor
browser-compat: api.MediaStreamTrackProcessor.MediaStreamTrackProcessor
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}

Hàm khởi tạo **`MediaStreamTrackProcessor()`** tạo một đối tượng {{domxref("MediaStreamTrackProcessor")}} mới, tiêu thụ nguồn của đối tượng video {{domxref("MediaStreamTrack")}} và tạo ra một luồng các {{domxref("VideoFrame")}}.

## Cú pháp

```js-nolint
new MediaStreamTrackProcessor(options)
```

### Tham số

- `options`
  - : Một đối tượng có các thuộc tính sau:
    - `track`
      - : Một {{domxref("MediaStreamTrack")}}.
    - `maxBufferSize` {{optional_inline}}
      - : Số nguyên xác định số lượng khung phương tiện tối đa có thể được đệm.

## Ví dụ

Trong ví dụ sau, một `MediaStreamTrackProcessor` mới được tạo.

```js
const trackProcessor = new MediaStreamTrackProcessor({ track: videoTrack });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
