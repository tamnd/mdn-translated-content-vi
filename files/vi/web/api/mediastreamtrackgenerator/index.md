---
title: MediaStreamTrackGenerator
slug: Web/API/MediaStreamTrackGenerator
page-type: web-api-interface
status:
  - experimental
  - non-standard
browser-compat: api.MediaStreamTrackGenerator
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}{{Non-standard_Header}}

> [!NOTE]
> Hãy cân nhắc sử dụng {{domxref("VideoTrackGenerator")}} thay thế.

Giao diện **`MediaStreamTrackGenerator`** của [Insertable Streams for MediaStreamTrack API](/en-US/docs/Web/API/Insertable_Streams_for_MediaStreamTrack_API) tạo một {{domxref("WritableStream")}} hoạt động như nguồn {{domxref("MediaStreamTrack")}}. Đối tượng tiêu thụ một luồng các khung phương tiện làm đầu vào, có thể là khung âm thanh hoặc video.

## Hàm khởi tạo

- {{domxref("MediaStreamTrackGenerator.MediaStreamTrackGenerator", "MediaStreamTrackGenerator()")}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Tạo một đối tượng `MediaStreamTrackGenerator` mới, chấp nhận các đối tượng {{domxref("VideoFrame")}} hoặc {{domxref("AudioData")}}.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("MediaStreamTrack")}}._

- {{domxref("MediaStreamTrackGenerator.writable")}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Một {{domxref("WritableStream")}}.

## Phương thức phiên bản

_Giao diện này không triển khai bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ {{domxref("MediaStreamTrack")}}._

## Ví dụ

Ví dụ sau lấy từ bài viết [Insertable streams for MediaStreamTrack](https://developer.chrome.com/docs/capabilities/web-apis/mediastreamtrack-insertable-media-processing), và trình bày ứng dụng quét mã vạch, xử lý mã vạch và tô sáng chúng trước khi ghi các khung đã biến đổi vào writable stream của {{domxref("MediaStreamTrackGenerator.writable")}}.

```js
const stream = await getUserMedia({ video: true });
const videoTrack = stream.getVideoTracks()[0];

const trackProcessor = new MediaStreamTrackProcessor({ track: videoTrack });
const trackGenerator = new MediaStreamTrackGenerator({ kind: "video" });

const transformer = new TransformStream({
  async transform(videoFrame, controller) {
    const barcodes = await detectBarcodes(videoFrame);
    const newFrame = highlightBarcodes(videoFrame, barcodes);
    videoFrame.close();
    controller.enqueue(newFrame);
  },
});

trackProcessor.readable
  .pipeThrough(transformer)
  .pipeTo(trackGenerator.writable);
```

## Xem thêm

- {{domxref("VideoTrackGenerator")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
