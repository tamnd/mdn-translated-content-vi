---
title: "MediaSource: endOfStream() method"
short-title: endOfStream()
slug: Web/API/MediaSource/endOfStream
page-type: web-api-instance-method
browser-compat: api.MediaSource.endOfStream
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`endOfStream()`** của giao diện {{domxref("MediaSource")}} báo hiệu kết thúc của luồng.

## Cú pháp

```js-nolint
endOfStream()
endOfStream(endOfStreamError)
```

### Tham số

- `endOfStreamError` {{optional_inline}}
  - : Một chuỗi đại diện cho lỗi cần ném ra khi đến cuối luồng. Các giá trị có thể là:
    - `network`
      - : Kết thúc phát lại và báo hiệu rằng đã xảy ra lỗi mạng. Điều này có thể được dùng để tạo bộ xử lý lỗi tùy chỉnh liên quan đến luồng media. Ví dụ: bạn có thể có một hàm xử lý các yêu cầu media chunk, tách biệt với các yêu cầu mạng khác. Khi bạn thực hiện yêu cầu {{domxref("Window/fetch", "fetch()")}} cho một media chunk và nhận được lỗi mạng, bạn có thể muốn gọi `endOfStream('network')`, hiển thị thông báo mô tả trong giao diện, và có thể thử lại yêu cầu mạng ngay lập tức hoặc chờ đến khi mạng hoạt động trở lại.
    - `decode`
      - : Kết thúc phát lại và báo hiệu rằng đã xảy ra lỗi giải mã. Điều này có thể được dùng để cho biết rằng đã xảy ra lỗi phân tích cú pháp khi lấy dữ liệu media; có thể dữ liệu bị hỏng, hoặc được mã hóa bằng codec mà trình duyệt không biết cách giải mã.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("MediaSource.readyState")}} không bằng `open`, hoặc một hoặc nhiều đối tượng {{domxref("SourceBuffer")}} trong {{domxref("MediaSource.sourceBuffers")}} đang được cập nhật (tức là thuộc tính {{domxref("SourceBuffer.updating")}} của chúng là `true`).

## Ví dụ

Đoạn code sau từ một ví dụ do Nick Desaulniers viết ([xem demo trực tiếp đầy đủ](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html), hoặc [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
const assetURL = "frag_bunny.mp4";
// Need to be specific for Blink regarding codecs
// ./mp4info frag_bunny.mp4 | grep Codec
const mimeCodec = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"';

let mediaSource;

if ("MediaSource" in window && MediaSource.isTypeSupported(mimeCodec)) {
  mediaSource = getMediaSource();
  console.log(mediaSource.readyState); // closed
  video.src = URL.createObjectURL(mediaSource);
  mediaSource.addEventListener("sourceopen", sourceOpen);
} else {
  console.error("Unsupported MIME type or codec: ", mimeCodec);
}

function sourceOpen() {
  console.log(this.readyState); // open
  const sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
  fetchAB(assetURL, (buf) => {
    sourceBuffer.addEventListener("updateend", () => {
      mediaSource.endOfStream();
      video.play();
      console.log(mediaSource.readyState); // ended
    });
    sourceBuffer.appendBuffer(buf);
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SourceBuffer")}}
- {{domxref("SourceBufferList")}}
