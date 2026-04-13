---
title: "AudioDecoder: bộ dựng AudioDecoder()"
short-title: AudioDecoder()
slug: Web/API/AudioDecoder/AudioDecoder
page-type: web-api-constructor
browser-compat: api.AudioDecoder.AudioDecoder
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Bộ dựng **`AudioDecoder()`** tạo một đối tượng {{domxref("AudioDecoder")}} mới với callback `init.output` được cung cấp được gán làm callback đầu ra, callback `init.error` được cung cấp làm callback lỗi, và {{domxref("AudioDecoder.state")}} được đặt thành `"unconfigured"`.

## Cú pháp

```js-nolint
new AudioDecoder(init)
```

### Tham số

- `init`
  - : Một đối tượng dictionary chứa hai callback bắt buộc.
    - `output`
      - : Một callback nhận một đối số duy nhất là một đối tượng {{domxref("AudioData")}}.
    - `error`
      - : Một callback nhận một đối số duy nhất là lỗi đã được ném ra.

## Ví dụ

Trong ví dụ sau, một `AudioDecoder` được tạo với hai hàm callback bắt buộc: một hàm để xử lý đoạn dữ liệu đã giải mã và hàm còn lại để xử lý lỗi.

```js
const audioDecoder = new AudioDecoder({
  output: processAudio,
  error: onEncoderError,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
