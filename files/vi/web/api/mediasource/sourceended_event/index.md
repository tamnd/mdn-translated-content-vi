---
title: "MediaSource: sourceended event"
short-title: sourceended
slug: Web/API/MediaSource/sourceended_event
page-type: web-api-event
browser-compat: api.MediaSource.sourceended_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`sourceended`** được phát ra khi {{domxref("MediaSource.readyState", "readyState")}} của đối tượng {{domxref("MediaSource")}} thay đổi thành `"ended"`. Điều này cho biết ứng dụng đã hoàn tất việc gửi dữ liệu đến `MediaSource`. Khi ứng dụng đã hoàn tất việc thêm tất cả dữ liệu media vào các đối tượng {{domxref("SourceBuffer")}} liên kết với một `MediaSource`, nó gọi phương thức {{domxref("MediaSource.endOfStream()")}} trên `MediaSource`. Điều này khiến {{domxref("MediaSource.readyState", "readyState")}} chuyển sang `"ended"` và kích hoạt sự kiện `sourceended`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("sourceended", (event) => {})

onsourceended = (event) => {}
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Xử lý sự kiện sourceended

Ví dụ này minh họa cách thiết lập một video element để phát lại và xử lý sự kiện `sourceended` để quản lý tài nguyên đúng cách. Code thiết lập một {{domxref("MediaSource")}}, khởi tạo phát lại bằng cách lấy và đệm dữ liệu video, sau đó sử dụng sự kiện `sourceended` để thực hiện các tác vụ dọn dẹp như xóa các trình xử lý sự kiện và thông báo cho người dùng khi phát lại hoàn tất.

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
      sourceBuffer.addEventListener("updateend", () => {
        mediaSource.endOfStream();
      });
    });
});

mediaSource.addEventListener("sourceended", (event) => {
  console.log("MediaSource sourceended:", event);
  URL.revokeObjectURL(video.src);
  // Perform cleanup

  // Remove event listeners from SourceBuffer and MediaSource
  sourceBuffer.removeEventListener("updateend", () => {});
  mediaSource.removeEventListener("sourceopen", () => {});

  // Notify user (e.g., display a "Playback finished" message)
  const messageElement = document.createElement("p");
  messageElement.textContent = "Playback finished.";
  document.body.appendChild(messageElement);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

{{domxref("MediaSource.endOfStream()")}}
