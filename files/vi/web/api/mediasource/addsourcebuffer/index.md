---
title: "MediaSource: addSourceBuffer() method"
short-title: addSourceBuffer()
slug: Web/API/MediaSource/addSourceBuffer
page-type: web-api-instance-method
browser-compat: api.MediaSource.addSourceBuffer
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`addSourceBuffer()`** của giao diện {{domxref("MediaSource")}} tạo một {{domxref("SourceBuffer")}} mới với {{Glossary("MIME type")}} đã cho và thêm nó vào danh sách {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}} của `MediaSource`. `SourceBuffer` mới cũng được trả về.

## Cú pháp

```js-nolint
addSourceBuffer(mimeType)
```

### Tham số

- `mimeType`
  - : Một chuỗi chỉ định MIME type của {{domxref("SourceBuffer")}} cần tạo và thêm vào {{domxref("MediaSource")}}.

### Giá trị trả về

Một đối tượng {{domxref("SourceBuffer")}} đại diện cho source buffer mới đã được tạo và thêm vào media source.

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném ra nếu giá trị chỉ định cho `mimeType` là một chuỗi rỗng thay vì một MIME type hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("MediaSource")}} không ở trạng thái `"open"` {{domxref("MediaSource.readyState", "readyState")}}.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu `mimeType` được chỉ định không được {{Glossary("user agent")}} hỗ trợ, hoặc không tương thích với các MIME type của các đối tượng {{domxref("SourceBuffer")}} khác đã có trong danh sách {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}} của media source.
- {{domxref("QuotaExceededError")}}
  - : Ném ra nếu tác nhân người dùng không thể xử lý thêm đối tượng `SourceBuffer`, hoặc việc tạo `SourceBuffer` mới với `mimeType` đã cho sẽ dẫn đến một [cấu hình `SourceBuffer` không được hỗ trợ](https://w3c.github.io/media-source/#sourcebuffer-configuration).

## Ví dụ

Đoạn code sau từ một ví dụ do Nick Desaulniers viết ([xem demo trực tiếp đầy đủ](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html), hoặc [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
const assetURL = "frag_bunny.mp4";
// Need to be specific for Blink regarding codecs
// ./mp4info frag_bunny.mp4 | grep Codec
const mimeCodec = 'video/mp4; codecs="avc1.42E01E, mp4a.40.2"';
const mediaSource = getMediaSource();

if ("MediaSource" in window && MediaSource.isTypeSupported(mimeCodec)) {
  console.log(mediaSource.readyState); // closed
  mediaSource.addEventListener("sourceopen", sourceOpen);
  video.src = URL.createObjectURL(mediaSource);
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
