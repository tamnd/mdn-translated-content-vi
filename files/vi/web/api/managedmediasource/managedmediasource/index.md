---
title: "ManagedMediaSource: hàm khởi tạo ManagedMediaSource()"
short-title: ManagedMediaSource()
slug: Web/API/ManagedMediaSource/ManagedMediaSource
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.ManagedMediaSource.ManagedMediaSource
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Hàm khởi tạo **`ManagedMediaSource()`** của giao diện {{domxref("ManagedMediaSource")}} tạo và trả về một đối tượng `ManagedMediaSource` mới mà không có bộ đệm nguồn nào được liên kết.

## Cú pháp

```js-nolint
new ManagedMediaSource()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("ManagedMediaSource")}} mới.

## Ví dụ

### Tạo ManagedMediaSource và gắn vào phần tử video

Ví dụ dưới đây tạo một `ManagedMediaSource` mới, gắn nó vào phần tử {{htmlelement("video")}}, và sử dụng sự kiện {{domxref("ManagedMediaSource.startstreaming_event", "startstreaming")}} để bắt đầu tải dữ liệu media.

```js
const videoUrl =
  "https://mdn.github.io/shared-assets/videos/flower-fragmented.mp4";
const mediaType = 'video/mp4; codecs="avc1.64001F, mp4a.40.2"';

if (ManagedMediaSource.isTypeSupported(mediaType)) {
  const source = new ManagedMediaSource();
  const video = document.createElement("video");

  video.controls = true;
  video.disableRemotePlayback = true;
  video.src = URL.createObjectURL(source);
  document.body.appendChild(video);

  source.addEventListener("sourceopen", () => {
    const sourceBuffer = source.addSourceBuffer(mediaType);

    source.addEventListener("startstreaming", async () => {
      console.log("startstreaming — fetching media data");
      const response = await fetch(videoUrl);
      const data = await response.arrayBuffer();
      sourceBuffer.appendBuffer(data);
    });
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ManagedMediaSource")}}
- {{domxref("ManagedSourceBuffer")}}
- {{domxref("MediaSource.MediaSource", "MediaSource()")}}
