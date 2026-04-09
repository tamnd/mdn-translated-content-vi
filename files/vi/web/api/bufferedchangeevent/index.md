---
title: BufferedChangeEvent
slug: Web/API/BufferedChangeEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BufferedChangeEvent
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Giao diện **`BufferedChangeEvent`** của {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}} biểu diễn đối tượng sự kiện cho sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}} được kích hoạt trên một {{domxref("ManagedSourceBuffer")}}. Sự kiện này được kích hoạt bất cứ khi nào các khoảng đã đệm của `ManagedSourceBuffer` thay đổi, chẳng hạn do các lệnh gọi {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}}, {{domxref("SourceBuffer.remove", "remove()")}} hoặc {{domxref("MediaSource.endOfStream", "endOfStream()")}}, hoặc khi user agent chạy thuật toán dọn dẹp bộ nhớ.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("BufferedChangeEvent.BufferedChangeEvent", "BufferedChangeEvent()")}} {{experimental_inline}}
  - : Tạo và trả về một đối tượng `BufferedChangeEvent` mới.

## Thuộc tính thực thể

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("BufferedChangeEvent.addedRanges")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một đối tượng {{domxref("TimeRanges")}} biểu diễn các khoảng thời gian đã được thêm vào bộ đệm của {{domxref("ManagedSourceBuffer")}}.
- {{domxref("BufferedChangeEvent.removedRanges")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một đối tượng {{domxref("TimeRanges")}} biểu diễn các khoảng thời gian đã bị xóa khỏi bộ đệm của {{domxref("ManagedSourceBuffer")}}.

## Ví dụ

### Xử lý thay đổi các khoảng đã đệm

Ví dụ này tạo một {{domxref("ManagedMediaSource")}}, gắn nó với một phần tử {{htmlelement("video")}}, tìm nạp một tệp MP4 phân mảnh và lắng nghe sự kiện `bufferedchange`. Khi sự kiện được kích hoạt, ví dụ sẽ ghi nhật ký các khoảng thời gian đã được thêm vào.

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
      for (let i = 0; i < event.addedRanges.length; i++) {
        console.log(
          `Added range: ${event.addedRanges.start(i)} - ${event.addedRanges.end(i)}`,
        );
      }
    });

    const response = await fetch(videoUrl);
    const data = await response.arrayBuffer();
    sourceBuffer.appendBuffer(data);
  });
}
```

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ManagedMediaSource")}}
- {{domxref("ManagedSourceBuffer")}}
- {{domxref("MediaSource")}}
- {{domxref("SourceBuffer")}}
