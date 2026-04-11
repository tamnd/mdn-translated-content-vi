---
title: "MediaSource: readyState property"
short-title: readyState
slug: Web/API/MediaSource/readyState
page-type: web-api-instance-property
browser-compat: api.MediaSource.readyState
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`readyState`** của giao diện {{domxref("MediaSource")}} trả về một enum biểu thị trạng thái của `MediaSource` hiện tại. Ba giá trị có thể là:

- `closed`: Nguồn hiện không được gắn vào media element.
- `open`: Nguồn được gắn vào media element và sẵn sàng nhận các đối tượng {{domxref("SourceBuffer")}}.
- `ended`: Nguồn được gắn vào media element nhưng luồng đã kết thúc thông qua lời gọi {{domxref("MediaSource.endOfStream()")}}.

## Giá trị

Một chuỗi.

## Ví dụ

Đoạn code sau từ một ví dụ do Nick Desaulniers viết ([xem demo trực tiếp đầy đủ](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html), hoặc [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
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
