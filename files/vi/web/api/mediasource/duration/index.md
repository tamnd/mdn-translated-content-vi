---
title: "MediaSource: duration property"
short-title: duration
slug: Web/API/MediaSource/duration
page-type: web-api-instance-property
browser-compat: api.MediaSource.duration
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`duration`** của giao diện {{domxref("MediaSource")}} lấy và đặt thời lượng của media hiện đang được trình bày.

## Giá trị

Một số thực (`double`). Giá trị mong đợi tính bằng giây.

### Ngoại lệ

Các ngoại lệ sau có thể được ném ra khi đặt giá trị mới cho thuộc tính này.

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném ra nếu có cố gắng đặt giá trị thời lượng âm hoặc `NaN`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("MediaSource.readyState")}} không bằng `open`, hoặc một hoặc nhiều đối tượng {{domxref("SourceBuffer")}} trong {{domxref("MediaSource.sourceBuffers")}} đang được cập nhật (tức là thuộc tính {{domxref("SourceBuffer.updating")}} của chúng là `true`).

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
      mediaSource.duration = 120;
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
