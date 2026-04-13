---
title: WebCodecs API
slug: Web/API/WebCodecs_API
page-type: web-api-overview
---

{{DefaultAPISidebar("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

**WebCodecs API** cung cấp cho nhà phát triển web quyền truy cập cấp thấp vào các khung hình riêng lẻ của luồng video và các đoạn âm thanh.
API này hữu ích cho các ứng dụng web cần kiểm soát hoàn toàn cách xử lý phương tiện,
chẳng hạn như trình chỉnh sửa video hoặc âm thanh, và hội nghị truyền hình.

## Khái niệm và cách dùng

Nhiều Web API sử dụng codec phương tiện bên trong.
Ví dụ, [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) và [WebRTC API](/en-US/docs/Web/API/WebRTC_API).
Tuy nhiên các API này không cho phép nhà phát triển làm việc với các khung hình riêng lẻ của luồng video và các đoạn âm thanh hoặc video được mã hóa chưa pha trộn.

Nhà phát triển web thường dùng WebAssembly để khắc phục hạn chế này
và làm việc với codec phương tiện trong trình duyệt.
Tuy nhiên điều này đòi hỏi băng thông bổ sung để tải xuống các codec đã có trong trình duyệt,
làm giảm hiệu suất và hiệu quả năng lượng, đồng thời tăng thêm gánh nặng phát triển.

WebCodecs API cung cấp quyền truy cập vào các codec đã có trong trình duyệt.
API cho phép truy cập vào các khung hình video thô, đoạn dữ liệu âm thanh, bộ giải mã hình ảnh, bộ mã hóa và giải mã âm thanh và video.

### Mô hình xử lý

WebCodecs API dùng [mô hình xử lý](https://w3c.github.io/webcodecs/#codec-processing-model-section) bất đồng bộ. Mỗi phiên bản
của bộ mã hóa hoặc giải mã duy trì một hàng đợi xử lý nội bộ, độc lập. Khi đưa vào hàng đợi một lượng lớn công việc, điều quan trọng là phải ghi nhớ mô hình này.

Các phương thức có tên `configure()`, `encode()`, `decode()`, và `flush()` hoạt động bất đồng bộ bằng cách thêm thông điệp điều khiển
vào cuối hàng đợi, trong khi các phương thức có tên `reset()` và `close()` đồng bộ hủy bỏ tất cả công việc đang chờ và xóa
hàng đợi xử lý. Sau `reset()`, có thể đưa thêm công việc vào hàng đợi sau khi gọi `configure()`, nhưng `close()` là thao tác vĩnh viễn.

Các phương thức có tên `flush()` có thể được dùng để chờ hoàn thành tất cả công việc đang chờ tại thời điểm `flush()` được gọi. Tuy nhiên,
thường chỉ nên gọi nó sau khi tất cả công việc mong muốn đã được đưa vào hàng đợi. Phương thức này không nhằm mục đích buộc tiến trình ở các khoảng thời gian đều đặn. Gọi nó không cần thiết sẽ ảnh hưởng đến chất lượng bộ mã hóa và khiến bộ giải mã yêu cầu đầu vào tiếp theo phải là khung hình chính.

### Tách kênh (Demuxing)

Hiện tại không có API để tách kênh container phương tiện. Nhà phát triển làm việc với phương tiện được đóng gói sẽ cần tự triển khai
hoặc dùng thư viện bên thứ ba. Ví dụ, [MP4Box.js](https://github.com/gpac/mp4box.js/) hoặc [jswebm](https://github.com/jscodec/jswebm) có thể được
dùng để tách kênh dữ liệu âm thanh và video thành các đối tượng {{domxref("EncodedAudioChunk")}} và {{domxref("EncodedVideoChunk")}} tương ứng.

## Giao diện

- {{domxref("AudioDecoder")}}
  - : Giải mã các đối tượng {{domxref("EncodedAudioChunk")}}.
- {{domxref("VideoDecoder")}}
  - : Giải mã các đối tượng {{domxref("EncodedVideoChunk")}}.
- {{domxref("AudioEncoder")}}
  - : Mã hóa các đối tượng {{domxref("AudioData")}}.
- {{domxref("VideoEncoder")}}
  - : Mã hóa các đối tượng {{domxref("VideoFrame")}}.
- {{domxref("EncodedAudioChunk")}}
  - : Đại diện cho các byte âm thanh được mã hóa theo codec cụ thể.
- {{domxref("EncodedVideoChunk")}}
  - : Đại diện cho các byte video được mã hóa theo codec cụ thể.
- {{domxref("AudioData")}}
  - : Đại diện cho dữ liệu âm thanh chưa mã hóa.
- {{domxref("VideoFrame")}}
  - : Đại diện cho một khung hình của dữ liệu video chưa mã hóa.
- {{domxref("VideoColorSpace")}}
  - : Đại diện cho không gian màu của một khung hình video.
- {{domxref("ImageDecoder")}}
  - : Giải nén và giải mã dữ liệu hình ảnh, cung cấp quyền truy cập vào chuỗi khung hình trong ảnh động.
- {{domxref("ImageTrackList")}}
  - : Đại diện cho danh sách các track có trong hình ảnh.
- {{domxref("ImageTrack")}}
  - : Đại diện cho một track hình ảnh riêng lẻ.

## Ví dụ

Trong ví dụ sau, các khung hình được trả về từ {{domxref("MediaStreamTrackProcessor")}}, sau đó được mã hóa.
Xem ví dụ đầy đủ và đọc thêm trong bài viết [Video processing with WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs).

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

## Xem thêm

- [Video processing with WebCodecs](https://developer.chrome.com/docs/web-platform/best-practices/webcodecs)
- [WebCodecs API Samples](https://w3c.github.io/webcodecs/samples/)
- [Real-Time Video Processing with WebCodecs and Streams: Processing Pipelines](https://webrtchacks.com/real-time-video-processing-with-webcodecs-and-streams-processing-pipelines-part-1/)
- [Video Frame Processing on the Web – WebAssembly, WebGPU, WebGL, WebCodecs, WebNN, and WebTransport](https://webrtchacks.com/video-frame-processing-on-the-web-webassembly-webgpu-webgl-webcodecs-webnn-and-webtransport/)
