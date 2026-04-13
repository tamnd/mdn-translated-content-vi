---
title: ManagedMediaSource
slug: Web/API/ManagedMediaSource
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ManagedMediaSource
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Giao diện **`ManagedMediaSource`** của {{domxref("Media Source Extensions API", "Media Source Extensions API", "", "nocode")}} là một {{domxref("MediaSource")}} quản lý tích cực nội dung bộ nhớ của nó. Khác với `MediaSource` thông thường, tác nhân người dùng có thể loại bỏ nội dung khỏi các đối tượng {{domxref("ManagedSourceBuffer")}} của nó bất cứ lúc nào, vì lý do như giới hạn bộ nhớ hoặc phần cứng. Điều này làm cho nó phù hợp với các kịch bản phát trực tuyến tiết kiệm năng lượng, nơi tác nhân người dùng cần kiểm soát nhiều hơn đối với dữ liệu phương tiện được đệm.

Khi {{domxref("MediaSource.addSourceBuffer", "addSourceBuffer()")}} được gọi trên `ManagedMediaSource`, nó tạo ra các đối tượng {{domxref("ManagedSourceBuffer")}} (thay vì các đối tượng {{domxref("SourceBuffer")}}), kích hoạt sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}} để thông báo cho ứng dụng khi các phạm vi được đệm bị sửa đổi bởi tác nhân người dùng.

> [!NOTE]
> Trên Safari, `ManagedMediaSource` chỉ kích hoạt khi tính năng phát lại từ xa bị tắt rõ ràng trên phần tử phương tiện (bằng cách đặt {{domxref("HTMLMediaElement.disableRemotePlayback")}} thành `true`), hoặc khi cung cấp một nguồn AirPlay thay thế (ví dụ: phần tử HLS {{htmlelement("source")}}). Nếu không có cả hai, sự kiện {{domxref("MediaSource.sourceopen_event", "sourceopen")}} sẽ không được kích hoạt.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("ManagedMediaSource.ManagedMediaSource", "ManagedMediaSource()")}} {{experimental_inline}}
  - : Tạo và trả về một phiên bản đối tượng `ManagedMediaSource` mới không có bộ đệm nguồn liên kết.

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("MediaSource")}}._

- {{domxref("ManagedMediaSource.streaming")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một boolean cho biết liệu đối tượng `ManagedMediaSource` có đang phát trực tuyến hay không. Khi là `true`, ứng dụng nên tích cực tải và nối dữ liệu phương tiện. Khi là `false`, ứng dụng có thể dừng tải dữ liệu mới.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha, {{domxref("MediaSource")}}._

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha, {{domxref("MediaSource")}}._

- {{domxref("ManagedMediaSource.startstreaming_event", "startstreaming")}} {{experimental_inline}}
  - : Được kích hoạt khi thuộc tính {{domxref("ManagedMediaSource.streaming", "streaming")}} của `ManagedMediaSource` thay đổi từ `false` thành `true`, nghĩa là nguồn phương tiện đã bắt đầu phát trực tuyến.
- {{domxref("ManagedMediaSource.endstreaming_event", "endstreaming")}} {{experimental_inline}}
  - : Được kích hoạt khi thuộc tính {{domxref("ManagedMediaSource.streaming", "streaming")}} của `ManagedMediaSource` thay đổi từ `true` thành `false`, nghĩa là nguồn phương tiện đã dừng phát trực tuyến.

## Ví dụ

### Thiết lập nguồn phương tiện được quản lý

Ví dụ sau thiết lập một `ManagedMediaSource`, kết nối nó với phần tử {{htmlelement("video")}}, và lắng nghe các sự kiện {{domxref("ManagedMediaSource.startstreaming_event", "startstreaming")}} và {{domxref("ManagedMediaSource.endstreaming_event", "endstreaming")}} để kiểm soát khi nào dữ liệu phương tiện được tải. Các sự kiện {{domxref("ManagedSourceBuffer.bufferedchange_event", "bufferedchange")}} được ghi lại bên dưới video.

```js
const videoUrl =
  "https://mdn.github.io/shared-assets/videos/flower-fragmented.mp4";
const mediaType = 'video/mp4; codecs="avc1.64001F, mp4a.40.2"';
const video = document.querySelector("video");

if (!window.ManagedMediaSource?.isTypeSupported(mediaType)) {
  console.log("ManagedMediaSource is not supported in this browser.");
} else {
  const source = new ManagedMediaSource();
  video.disableRemotePlayback = true;
  video.src = URL.createObjectURL(source);

  source.addEventListener("sourceopen", () => {
    const sourceBuffer = source.addSourceBuffer(mediaType);

    sourceBuffer.addEventListener("bufferedchange", (event) => {
      for (let i = 0; i < event.addedRanges.length; i++) {
        console.log(
          `Buffered: ${event.addedRanges.start(i).toFixed(2)}s – ${event.addedRanges.end(i).toFixed(2)}s`,
        );
      }
    });

    source.addEventListener("startstreaming", async () => {
      console.log("startstreaming — fetching media data…");
      const response = await fetch(videoUrl);
      const data = await response.arrayBuffer();
      sourceBuffer.appendBuffer(data);
    });

    source.addEventListener("endstreaming", () => {
      console.log("endstreaming — enough data buffered");
    });
  });
}
```

{{EmbedGHLiveSample("dom-examples/media-source-extensions/managed-media-source/", '100%', 470)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("ManagedSourceBuffer")}}
- {{domxref("BufferedChangeEvent")}}
- {{domxref("SourceBuffer")}}
