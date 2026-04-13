---
title: VideoTrackGenerator
slug: Web/API/VideoTrackGenerator
page-type: web-api-interface
status:
  - experimental
browser-compat: api.VideoTrackGenerator
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{SeeCompatTable}}{{AvailableInWorkers("dedicated")}}

Giao diện **`VideoTrackGenerator`** của [Insertable Streams for MediaStreamTrack API](/en-US/docs/Web/API/Insertable_Streams_for_MediaStreamTrack_API) có thuộc tính {{domxref("WritableStream")}} hoạt động như một nguồn {{domxref("MediaStreamTrack")}}, bằng cách tiêu thụ một luồng {{domxref("VideoFrame")}} làm đầu vào.

## Hàm khởi tạo

- {{domxref("VideoTrackGenerator.VideoTrackGenerator", "VideoTrackGenerator()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `VideoTrackGenerator` mới chấp nhận các đối tượng {{domxref("VideoFrame")}}.

## Thuộc tính phiên bản

- {{domxref("VideoTrackGenerator.muted")}} {{Experimental_Inline}}
  - : Thuộc tính Boolean để tạm thời dừng hoặc tiếp tục tạo khung hình video trong track đầu ra.
- {{domxref("VideoTrackGenerator.track")}} {{Experimental_Inline}}
  - : {{domxref("MediaStreamTrack")}} đầu ra.
- {{domxref("VideoTrackGenerator.writable")}} {{Experimental_Inline}}
  - : {{domxref("WritableStream")}} đầu vào.

## Ví dụ

Ví dụ sau đây từ bài viết [Unbundling MediaStreamTrackProcessor and VideoTrackGenerator](https://blog.mozilla.org/webrtc/unbundling-mediastreamtrackprocessor-and-videotrackgenerator/). Nó [chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) một camera {{domxref("MediaStreamTrack")}} đến một worker để xử lý. Worker tạo một pipeline áp dụng bộ lọc tông màu sepia cho các khung hình video và phản chiếu chúng. Pipeline kết thúc trong `VideoTrackGenerator` mà {{domxref("MediaStreamTrack")}} của nó được chuyển trở lại và phát. Phương tiện giờ đây chảy theo thời gian thực thông qua biến đổi bên ngoài {{Glossary("main thread")}}.

```js
const stream = await navigator.mediaDevices.getUserMedia({ video: true });
const [track] = stream.getVideoTracks();
const worker = new Worker("worker.js");
worker.postMessage({ track }, [track]);
const { data } = await new Promise((r) => {
  worker.onmessage = r;
});
video.srcObject = new MediaStream([data.track]);
```

worker.js:

```js
onmessage = async ({ data: { track } }) => {
  const vtg = new VideoTrackGenerator();
  self.postMessage({ track: vtg.track }, [vtg.track]);
  const { readable } = new MediaStreamTrackProcessor({ track });
  await readable
    .pipeThrough(new TransformStream({ transform }))
    .pipeTo(vtg.writable);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStreamTrackProcessor")}}
