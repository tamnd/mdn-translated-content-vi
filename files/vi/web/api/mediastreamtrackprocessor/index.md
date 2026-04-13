---
title: MediaStreamTrackProcessor
slug: Web/API/MediaStreamTrackProcessor
page-type: web-api-interface
browser-compat: api.MediaStreamTrackProcessor
---

{{APIRef("Insertable Streams for MediaStreamTrack API")}}{{AvailableInWorkers("dedicated")}}

> [!WARNING]
> Các trình duyệt khác nhau về ngữ cảnh toàn cục nào họ hiển thị giao diện này (ví dụ: chỉ window trong một số trình duyệt và chỉ dedicated worker trong các trình duyệt khác), khiến chúng không tương thích. Hãy lưu ý điều này khi so sánh hỗ trợ.

Giao diện **`MediaStreamTrackProcessor`** của [Insertable Streams for MediaStreamTrack API](/en-US/docs/Web/API/Insertable_Streams_for_MediaStreamTrack_API) tiêu thụ nguồn của đối tượng video {{domxref("MediaStreamTrack")}} và tạo ra một luồng các đối tượng {{domxref("VideoFrame")}}.

## Hàm khởi tạo

- {{domxref("MediaStreamTrackProcessor.MediaStreamTrackProcessor", "MediaStreamTrackProcessor()")}}
  - : Tạo một đối tượng `MediaStreamTrackProcessor` mới.
- {{domxref("MediaStreamTrackProcessor.MediaStreamTrackProcessor", "window.MediaStreamTrackProcessor()")}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Tạo một đối tượng `MediaStreamTrackProcessor` mới trên {{Glossary("main thread")}} có thể xử lý cả video và âm thanh.

## Thuộc tính phiên bản

- {{domxref("MediaStreamTrackProcessor.readable")}}
  - : Trả về một {{domxref("ReadableStream")}}.

## Ví dụ

Ví dụ sau lấy từ bài viết [Unbundling MediaStreamTrackProcessor and VideoTrackGenerator](https://blog.mozilla.org/webrtc/unbundling-mediastreamtrackprocessor-and-videotrackgenerator/). Nó [truyền](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects) {{domxref("MediaStreamTrack")}} camera sang worker để xử lý. Worker tạo một pipeline áp dụng bộ lọc tông sepia cho các khung video và phản chiếu chúng. Pipeline kết thúc trong một {{domxref("VideoTrackGenerator")}} có {{domxref("MediaStreamTrack")}} được truyền lại và phát. Phương tiện hiện chảy theo thời gian thực qua quá trình biến đổi bên ngoài {{Glossary("main thread")}}.

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

- {{domxref("VideoTrackGenerator")}}
- [Insertable streams for MediaStreamTrack](https://developer.chrome.com/docs/capabilities/web-apis/mediastreamtrack-insertable-media-processing) trên developer.chrome.com
  > [!NOTE]
  > Bài viết này được viết trước khi API bị giới hạn chỉ cho worker và video. Hãy cẩn thận với việc sử dụng phiên bản không chuẩn của `MediaStreamTrackProcessor` trong bài viết vì nó chặn trên {{Glossary("main thread")}}.
