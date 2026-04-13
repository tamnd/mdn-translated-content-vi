---
title: "BufferedChangeEvent: thuộc tính removedRanges"
short-title: removedRanges
slug: Web/API/BufferedChangeEvent/removedRanges
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BufferedChangeEvent.removedRanges
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`removedRanges`** của giao diện {{domxref("BufferedChangeEvent")}} trả về một đối tượng {{domxref("TimeRanges")}} biểu diễn các khoảng thời gian đã bị xóa khỏi {{domxref("ManagedSourceBuffer")}} liên kết. Đây là các khoảng bị xóa giữa các sự kiện `updatestart` và `updateend` gần nhất, trong lần chạy gần đây nhất của thuật toán loại bỏ coded frame hoặc đẩy coded frame ra ngoài, hoặc là hệ quả của việc user agent chạy thuật toán dọn dẹp bộ nhớ.

## Giá trị

Một đối tượng {{domxref("TimeRanges")}}.

## Ví dụ

### Ghi nhật ký các khoảng bị xóa khi bộ đệm thay đổi

Ví dụ này tạo một {{domxref("ManagedMediaSource")}}, gắn nó với một phần tử {{htmlelement("video")}}, tìm nạp một tệp MP4 phân mảnh, rồi xóa một phần dữ liệu đã đệm. Trình xử lý sự kiện `bufferedchange` sẽ ghi nhật ký mọi khoảng thời gian bị xóa.

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

  source.addEventListener("sourceopen", async () => {
    const sourceBuffer = source.addSourceBuffer(mediaType);

    sourceBuffer.addEventListener("bufferedchange", (event) => {
      const removed = event.removedRanges;
      for (let i = 0; i < removed.length; i++) {
        console.log(`Removed range: ${removed.start(i)}s - ${removed.end(i)}s`);
      }
    });

    const response = await fetch(videoUrl);
    const data = await response.arrayBuffer();
    sourceBuffer.appendBuffer(data);

    // Sau khi thêm xong, xóa 5 giây đầu tiên để kích hoạt removedRanges
    sourceBuffer.addEventListener(
      "updateend",
      () => {
        sourceBuffer.remove(0, 5);
      },
      { once: true },
    );
  });
}
```

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BufferedChangeEvent.addedRanges")}}
- Sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}}
- {{domxref("ManagedSourceBuffer")}}
- {{domxref("TimeRanges")}}
