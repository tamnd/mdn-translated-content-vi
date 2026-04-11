---
title: "MediaSource: sourceBuffers property"
short-title: sourceBuffers
slug: Web/API/MediaSource/sourceBuffers
page-type: web-api-instance-property
browser-compat: api.MediaSource.sourceBuffers
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`sourceBuffers`** của giao diện {{domxref("MediaSource")}} trả về một đối tượng {{domxref("SourceBufferList")}} chứa danh sách các đối tượng {{domxref("SourceBuffer")}} được liên kết với `MediaSource` này.

## Giá trị

Một {{domxref("SourceBufferList")}}.

## Ví dụ

Đoạn code sau dựa trên một ví dụ do Nick Desaulniers viết ([xem demo trực tiếp đầy đủ](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html), hoặc [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
const mediaSource = getMediaSource();

function sourceOpen() {
  console.log(this.readyState); // open
  const sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
  fetchAB(assetURL, (buf) => {
    sourceBuffer.addEventListener("updateend", () => {
      mediaSource.endOfStream();
      console.log(mediaSource.sourceBuffers); // will contain the source buffer that was added above
      video.play();
      console.log(mediaSource.readyState); // ended
    });
    sourceBuffer.appendBuffer(buf);
  });
}

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SourceBuffer")}}
- {{domxref("SourceBufferList")}}
