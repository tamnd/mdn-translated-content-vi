---
title: "ManagedMediaSource: sự kiện endstreaming"
short-title: endstreaming
slug: Web/API/ManagedMediaSource/endstreaming_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ManagedMediaSource.endstreaming_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Sự kiện **`endstreaming`** của giao diện {{domxref("ManagedMediaSource")}} được kích hoạt khi thuộc tính {{domxref("ManagedMediaSource.streaming", "streaming")}} thay đổi từ `true` sang `false`. Điều này cho thấy tác nhân người dùng đã có đủ dữ liệu được đệm để đảm bảo phát lại không bị gián đoạn, và ứng dụng có thể dừng tải các phân đoạn media mới.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("endstreaming", (event) => {});

onendstreaming = (event) => {};
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Tạm dừng tải dữ liệu khi nhận sự kiện endstreaming

Ví dụ này tạo một {{domxref("ManagedMediaSource")}}, gắn nó vào phần tử {{htmlelement("video")}}, và sử dụng các sự kiện `startstreaming` và `endstreaming` để kiểm soát thời điểm tải các phân đoạn media.

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

  let shouldFetch = false;

  source.addEventListener("sourceopen", () => {
    const sourceBuffer = source.addSourceBuffer(mediaType);

    source.addEventListener("startstreaming", async () => {
      console.log("startstreaming — fetching media data");
      shouldFetch = true;
      const response = await fetch(videoUrl);
      const data = await response.arrayBuffer();
      if (shouldFetch) {
        sourceBuffer.appendBuffer(data);
      }
    });

    source.addEventListener("endstreaming", () => {
      console.log("endstreaming — enough data buffered");
      shouldFetch = false;
    });
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("ManagedMediaSource.startstreaming_event", "startstreaming")}}
- {{domxref("ManagedMediaSource.streaming")}}
- {{domxref("ManagedMediaSource")}}
- {{domxref("MediaSource")}}
