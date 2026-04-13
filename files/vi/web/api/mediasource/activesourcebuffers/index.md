---
title: "MediaSource: activeSourceBuffers property"
short-title: activeSourceBuffers
slug: Web/API/MediaSource/activeSourceBuffers
page-type: web-api-instance-property
browser-compat: api.MediaSource.activeSourceBuffers
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`activeSourceBuffers`** của giao diện {{domxref("MediaSource")}} trả về một đối tượng {{domxref("SourceBufferList")}} chứa một tập con các đối tượng {{domxref("SourceBuffer")}} nằm trong {{domxref("MediaSource.sourceBuffers", "sourceBuffers")}} - danh sách các đối tượng cung cấp track video đã chọn, các track âm thanh đã bật, và các track văn bản đang được hiển thị/ẩn.

## Giá trị

Một {{domxref("SourceBufferList")}} chứa các đối tượng {{domxref("SourceBuffer")}} cho mỗi track đang hoạt động.

## Ví dụ

Đoạn code sau dựa trên một ví dụ do Nick Desaulniers viết ([xem demo trực tiếp đầy đủ](https://nickdesaulniers.github.io/netfix/demo/bufferAll.html), hoặc [tải mã nguồn xuống](https://github.com/nickdesaulniers/netfix/blob/gh-pages/demo/bufferAll.html) để xem kỹ hơn). Hàm `getMediaSource()`, không được định nghĩa ở đây, trả về một `MediaSource`.

```js
const mediaSource = getMediaSource();

function sourceOpen() {
  console.log(mediaSource.readyState); // open
  const sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
  fetchAB(assetURL, (buf) => {
    sourceBuffer.addEventListener("updateend", () => {
      mediaSource.endOfStream();
      console.log(mediaSource.activeSourceBuffers);
      // will contain the source buffer that was added above,
      // as it is selected for playing in the video player
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
