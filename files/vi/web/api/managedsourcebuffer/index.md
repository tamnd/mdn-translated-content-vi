---
title: ManagedSourceBuffer
slug: Web/API/ManagedSourceBuffer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ManagedSourceBuffer
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Giao diện **`ManagedSourceBuffer`** của {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}} là một {{domxref("SourceBuffer")}} được tạo bởi {{domxref("ManagedMediaSource")}} khi gọi {{domxref("MediaSource.addSourceBuffer", "addSourceBuffer()")}}. Nó kế thừa tất cả các thuộc tính và phương thức của `SourceBuffer`, và ngoài ra còn kích hoạt sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}} mỗi khi vùng đệm thay đổi, kể cả khi tác nhân người dùng xóa nội dung như một phần của thuật toán dọn dẹp bộ nhớ.

Các ứng dụng nên lắng nghe sự kiện `bufferedchange` để theo dõi các thay đổi đối với dữ liệu đã đệm, vì `ManagedMediaSource` có thể xóa nội dung bất kỳ lúc nào do giới hạn bộ nhớ hoặc phần cứng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha {{domxref("SourceBuffer")}}._

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha {{domxref("SourceBuffer")}}._

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha {{domxref("SourceBuffer")}}._

- {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}} {{experimental_inline}}
  - : Được kích hoạt khi vùng đệm của `ManagedSourceBuffer` thay đổi, sau khi gọi {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}}, {{domxref("SourceBuffer.remove", "remove()")}}, {{domxref("MediaSource.endOfStream", "endOfStream()")}}, hoặc do tác nhân người dùng chạy thuật toán dọn dẹp bộ nhớ.

## Ví dụ

### Lắng nghe các thay đổi vùng đệm

Ví dụ này thiết lập một {{domxref("ManagedMediaSource")}}, thêm `ManagedSourceBuffer`, tải tệp MP4 phân mảnh, và lắng nghe sự kiện `bufferedchange` để ghi lại mọi thay đổi về vùng đệm.

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

- {{domxref("ManagedMediaSource")}}
- {{domxref("BufferedChangeEvent")}}
- {{domxref("SourceBuffer")}}
- {{domxref("MediaSource")}}
