---
title: "MediaSource: sourceclose event"
short-title: sourceclose
slug: Web/API/MediaSource/sourceclose_event
page-type: web-api-event
browser-compat: api.MediaSource.sourceclose_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`sourceclose`** được phát ra khi {{domxref("MediaSource.readyState", "readyState")}} của đối tượng {{domxref("MediaSource")}} thay đổi thành `"closed"`. Điều này cho biết `MediaSource` đã bị tách khỏi media element.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("sourceclose", (event) => { })

onsourceclose = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Xử lý sự kiện sourceclose

Ví dụ này minh họa cách tách một media element khỏi `MediaSource` và xử lý sự kiện `sourceclose` để quản lý tài nguyên đúng cách. Code thiết lập một {{domxref("MediaSource")}}, gắn nó vào một video element, và lắng nghe sự kiện `sourceclose`. Khi sự kiện được phát ra, nó thực hiện các tác vụ dọn dẹp (`revokeObjectURL`).

```js
const video = document.getElementById("myVideo");
const mediaSource = new MediaSource();

video.src = URL.createObjectURL(mediaSource);

mediaSource.addEventListener("sourceopen", (event) => {
  const sourceBuffer = mediaSource.addSourceBuffer(
    'video/mp4; codecs="avc1.42E01E"',
  );
  fetch("video-data.mp4")
    .then((response) => response.arrayBuffer())
    .then((data) => {
      sourceBuffer.appendBuffer(data);
    });
});

function detachMediaSource() {
  video.src = null; // Detach the MediaSource
}

mediaSource.addEventListener("sourceclose", (event) => {
  console.log("MediaSource sourceclose:", event);
  // Perform cleanup tasks here, e.g., release resources, update UI
  URL.revokeObjectURL(video.src); // Clean up the object URL
});

// Call detachMediaSource() when appropriate, e.g., on a button click
document
  .getElementById("detachButton")
  .addEventListener("click", detachMediaSource);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
