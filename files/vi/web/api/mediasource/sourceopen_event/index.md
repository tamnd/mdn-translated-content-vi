---
title: "MediaSource: sourceopen event"
short-title: sourceopen
slug: Web/API/MediaSource/sourceopen_event
page-type: web-api-event
browser-compat: api.MediaSource.sourceopen_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`sourceopen`** được phát ra khi {{domxref("MediaSource.readyState", "readyState")}} của đối tượng {{domxref("MediaSource")}} thay đổi thành `"open"`.
Điều này cho biết `MediaSource` sẵn sàng nhận dữ liệu từ các đối tượng {{domxref("SourceBuffer")}}. Điều này có thể xảy ra khi đối tượng `MediaSource` được gắn lần đầu vào một media element, hoặc khi {{domxref("MediaSource.readyState", "readyState")}} thay đổi từ `"ended"` trở lại `"open"`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js
addEventListener("sourceopen", (event) => {});

onsourceopen = (event) => {};
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Xử lý sự kiện sourceopen

Ví dụ này thiết lập một {{domxref("MediaSource")}}, kết nối nó với một video element, và lắng nghe sự kiện `sourceopen`. Khi sự kiện được phát ra, nó thêm một {{domxref("SourceBuffer")}} để xử lý dữ liệu video, lấy dữ liệu, thêm vào buffer, và cuối cùng thu hồi URL đối tượng khi nguồn kết thúc.

```js
const video = document.getElementById("myVideo");
const mediaSource = new MediaSource();

video.src = URL.createObjectURL(mediaSource);

mediaSource.addEventListener("sourceopen", (event) => {
  console.log("MediaSource sourceopen:", event);
  // Add source buffers and begin adding media data.
  const sourceBuffer = mediaSource.addSourceBuffer(
    'video/mp4; codecs="avc1.42E01E"',
  );
  fetch("video-data.mp4")
    .then((response) => response.arrayBuffer())
    .then((data) => {
      sourceBuffer.appendBuffer(data);
    });
});

mediaSource.addEventListener("sourceended", () => {
  URL.revokeObjectURL(video.src);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
