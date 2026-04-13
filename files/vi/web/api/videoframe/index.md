---
title: VideoFrame
slug: Web/API/VideoFrame
page-type: web-api-interface
browser-compat: api.VideoFrame
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`VideoFrame`** của [Web Codecs API](/en-US/docs/Web/API/WebCodecs_API) đại diện cho một khung hình của video.

`VideoFrame` là một [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Mô tả

Một đối tượng `VideoFrame` có thể được tạo hoặc truy cập theo nhiều cách. {{domxref("MediaStreamTrackProcessor")}} chia một media track thành các đối tượng `VideoFrame` riêng lẻ.

`VideoFrame` là một nguồn ảnh và có hàm khởi tạo chấp nhận bất kỳ nguồn canvas nào khác (
một {{domxref("SVGImageElement")}},
một {{domxref("HTMLVideoElement")}},
một {{domxref("HTMLCanvasElement")}},
một {{domxref("ImageBitmap")}},
một {{domxref("OffscreenCanvas")}},
hoặc một `VideoFrame` khác).
Điều này có nghĩa là có thể tạo khung hình từ một phần tử ảnh hoặc video.

Hàm khởi tạo thứ hai cho phép tạo một `VideoFrame` từ biểu diễn pixel nhị phân của nó trong một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, hoặc một {{jsxref("DataView")}}.

Các khung hình đã tạo có thể được chuyển thành media track, ví dụ với giao diện {{domxref("MediaStreamTrackGenerator")}} tạo một media track từ luồng khung hình.

## Hàm khởi tạo

- {{domxref("VideoFrame.VideoFrame", "VideoFrame()")}}
  - : Tạo một đối tượng `VideoFrame` mới.

## Thuộc tính phiên bản

- {{domxref("VideoFrame.format")}} {{ReadOnlyInline}}
  - : Trả về định dạng pixel của `VideoFrame`.
- {{domxref("VideoFrame.codedWidth")}} {{ReadOnlyInline}}
  - : Trả về chiều rộng của `VideoFrame` tính bằng pixel, có thể bao gồm phần đệm không hiển thị, và trước khi xem xét các điều chỉnh tỷ lệ khung hình tiềm năng.
- {{domxref("VideoFrame.codedHeight")}} {{ReadOnlyInline}}
  - : Trả về chiều cao của `VideoFrame` tính bằng pixel, có thể bao gồm phần đệm không hiển thị, và trước khi xem xét các điều chỉnh tỷ lệ khung hình tiềm năng.
- {{domxref("VideoFrame.codedRect")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMRectReadOnly")}} với chiều rộng và chiều cao khớp với `codedWidth` và `codedHeight`.
- {{domxref("VideoFrame.visibleRect")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMRectReadOnly")}} mô tả hình chữ nhật hiển thị của các pixel cho `VideoFrame` này.
- {{domxref("VideoFrame.displayWidth")}} {{ReadOnlyInline}}
  - : Trả về chiều rộng của `VideoFrame` khi được hiển thị sau khi áp dụng điều chỉnh {{glossary("aspect ratio")}}.
- {{domxref("VideoFrame.displayHeight")}} {{ReadOnlyInline}}
  - : Trả về chiều cao của `VideoFrame` khi được hiển thị sau khi áp dụng điều chỉnh tỷ lệ khung hình.
- {{domxref("VideoFrame.duration")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên cho biết thời lượng của video tính bằng microsecond.
- {{domxref("VideoFrame.timestamp")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên cho biết dấu thời gian của video tính bằng microsecond.
- {{domxref("VideoFrame.colorSpace")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("VideoColorSpace")}}.
- {{domxref("VideoFrame.flip")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về liệu `VideoFrame` có bị phản chiếu theo chiều ngang hay không.
- {{domxref("VideoFrame.rotation")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về góc xoay (0, 90, 180, hoặc 270) tính bằng độ theo chiều kim đồng hồ được áp dụng cho `VideoFrame`. Các số tùy ý (bao gồm số âm) được làm tròn đến góc phần tư tiếp theo.

## Phương thức phiên bản

- {{domxref("VideoFrame.allocationSize()")}}
  - : Trả về số byte cần thiết để chứa `VideoFrame` được lọc theo các tùy chọn được truyền vào phương thức.
- {{domxref("VideoFrame.copyTo()")}}
  - : Sao chép nội dung của `VideoFrame` vào một `ArrayBuffer`.
- {{domxref("VideoFrame.clone()")}}
  - : Tạo một đối tượng `VideoFrame` mới tham chiếu đến cùng tài nguyên media với bản gốc.
- {{domxref("VideoFrame.close()")}}
  - : Xóa tất cả trạng thái và giải phóng tham chiếu đến tài nguyên media.

## Ví dụ

Trong ví dụ sau, các khung hình được trả về từ {{domxref("MediaStreamTrackProcessor")}}, sau đó được mã hóa. Xem ví dụ đầy đủ và tìm hiểu thêm trong bài viết [Video processing with WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs).

```js
let frameCounter = 0;

const track = stream.getVideoTracks()[0];
const mediaProcessor = new MediaStreamTrackProcessor(track);

const reader = mediaProcessor.readable.getReader();
while (true) {
  const result = await reader.read();
  if (result.done) break;

  let frame = result.value;
  if (encoder.encodeQueueSize > 2) {
    // Too many frames in flight, encoder is overwhelmed
    // let's drop this frame.
    frame.close();
  } else {
    frameCounter++;
    const insertKeyframe = frameCounter % 150 === 0;
    encoder.encode(frame, { keyFrame: insertKeyframe });
    frame.close();
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Video processing with WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs)
- [WebCodecs examples](https://w3c.github.io/webcodecs/samples/)
