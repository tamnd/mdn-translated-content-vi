---
title: "ManagedSourceBuffer: sự kiện bufferedchange"
short-title: bufferedchange
slug: Web/API/ManagedSourceBuffer/bufferedchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ManagedSourceBuffer.bufferedchange_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Sự kiện **`bufferedchange`** của giao diện {{domxref("ManagedSourceBuffer")}} được kích hoạt khi vùng đệm của `ManagedSourceBuffer` thay đổi. Điều này có thể xảy ra sau khi gọi {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}}, {{domxref("SourceBuffer.remove", "remove()")}}, {{domxref("MediaSource.endOfStream", "endOfStream()")}}, hoặc do tác nhân người dùng chạy thuật toán dọn dẹp bộ nhớ.

Sự kiện này rất quan trọng đối với các ứng dụng sử dụng {{domxref("ManagedMediaSource")}}, vì tác nhân người dùng có thể xóa nội dung đã đệm bất kỳ lúc nào. Bằng cách lắng nghe sự kiện này, các ứng dụng có thể phát hiện khi dữ liệu đệm bị xóa và phản ứng bằng cách tải các phân đoạn thay thế để tránh phát lại bị gián đoạn.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("bufferedchange", (event) => {});

onbufferedchange = (event) => {};
```

## Kiểu sự kiện

Một {{domxref("BufferedChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("BufferedChangeEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("BufferedChangeEvent.addedRanges", "addedRanges")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("TimeRanges")}} đại diện cho các phạm vi thời gian được thêm vào bộ đệm.
- {{domxref("BufferedChangeEvent.removedRanges", "removedRanges")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("TimeRanges")}} đại diện cho các phạm vi thời gian bị xóa khỏi bộ đệm.

## Ví dụ

### Theo dõi các thay đổi vùng đệm

Ví dụ này thiết lập một {{domxref("ManagedMediaSource")}}, thêm bộ đệm nguồn, tải tệp MP4 phân mảnh, và lắng nghe sự kiện `bufferedchange` để ghi lại mọi thay đổi về vùng đệm.

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

  source.addEventListener("sourceopen", async () => {
    const sourceBuffer = source.addSourceBuffer(mediaType);

    sourceBuffer.addEventListener("bufferedchange", (event) => {
      for (let i = 0; i < event.addedRanges.length; i++) {
        console.log(
          `Added: ${event.addedRanges.start(i)}s - ${event.addedRanges.end(i)}s`,
        );
      }
      for (let i = 0; i < event.removedRanges.length; i++) {
        console.log(
          `Removed: ${event.removedRanges.start(i)}s - ${event.removedRanges.end(i)}s`,
        );
      }
    });

    const response = await fetch(videoUrl);
    const data = await response.arrayBuffer();
    sourceBuffer.appendBuffer(data);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BufferedChangeEvent")}}
- {{domxref("ManagedMediaSource")}}
- {{domxref("ManagedSourceBuffer")}}
- {{domxref("SourceBuffer")}}
