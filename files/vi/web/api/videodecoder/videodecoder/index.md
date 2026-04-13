---
title: "VideoDecoder: hàm khởi tạo VideoDecoder()"
short-title: VideoDecoder()
slug: Web/API/VideoDecoder/VideoDecoder
page-type: web-api-constructor
browser-compat: api.VideoDecoder.VideoDecoder
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`VideoDecoder()`** tạo một đối tượng {{domxref("VideoDecoder")}} mới với callback `init.output` được cung cấp làm callback đầu ra, callback `init.error` được cung cấp làm callback lỗi, và {{domxref("VideoDecoder.state")}} được đặt thành `"unconfigured"`.

## Cú pháp

```js-nolint
new VideoDecoder(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa hai callback.
    - `output`
      - : Một callback nhận một đối tượng {{domxref("VideoFrame")}} làm đối số duy nhất của nó.
    - `error`
      - : Một callback nhận một đối tượng {{jsxref("Error")}} làm đối số duy nhất của nó.

## Ví dụ

Trong ví dụ sau đây, một `VideoDecoder` được tạo với hai hàm callback bắt buộc, một để xử lý khung đã giải mã và một để xử lý lỗi.

```js
const videoDecoder = new VideoDecoder({
  output: processVideo,
  error: onEncoderError,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
