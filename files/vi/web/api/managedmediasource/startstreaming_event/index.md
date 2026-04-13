---
title: "ManagedMediaSource: sự kiện startstreaming"
short-title: startstreaming
slug: Web/API/ManagedMediaSource/startstreaming_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ManagedMediaSource.startstreaming_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Sự kiện **`startstreaming`** của giao diện {{domxref("ManagedMediaSource")}} được kích hoạt khi thuộc tính {{domxref("ManagedMediaSource.streaming", "streaming")}} thay đổi từ `false` sang `true`. Điều này cho thấy tác nhân người dùng cần thêm dữ liệu để đảm bảo phát lại không bị gián đoạn, và ứng dụng nên bắt đầu tải và nối thêm các phân đoạn media.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("startstreaming", (event) => {});

onstartstreaming = (event) => {};
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Tải dữ liệu khi nhận sự kiện startstreaming

Ví dụ này tạo một {{domxref("ManagedMediaSource")}}, gắn nó vào phần tử {{htmlelement("video")}}, và sử dụng sự kiện `startstreaming` để bắt đầu tải và nối thêm dữ liệu media.

```js
const videoUrl =
  "https://mdn.github.io/shared-assets/videos/flower-fragmented.mp4";
const mediaType = 'video/mp4; codecs="avc1.64001F, mp4a.40.2"';

if (ManagedMediaSource.isTypeSupported(mediaType)) {
  const video = document.createElement("video");
  const source = new ManagedMediaSource();

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

- Sự kiện {{domxref("ManagedMediaSource.endstreaming_event", "endstreaming")}}
- {{domxref("ManagedMediaSource.streaming")}}
- {{domxref("ManagedMediaSource")}}
- {{domxref("MediaSource")}}
