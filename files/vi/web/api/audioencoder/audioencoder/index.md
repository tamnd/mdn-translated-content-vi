---
title: "AudioEncoder: bộ khởi tạo AudioEncoder()"
short-title: AudioEncoder()
slug: Web/API/AudioEncoder/AudioEncoder
page-type: web-api-constructor
browser-compat: api.AudioEncoder.AudioEncoder
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Bộ khởi tạo **`AudioEncoder()`** tạo một đối tượng {{domxref("AudioEncoder")}} mới với callback `init.output` được cung cấp làm callback đầu ra, callback `init.error` được cung cấp làm callback lỗi, và {{domxref("AudioEncoder.state")}} được đặt thành `"unconfigured"`.

## Cú pháp

```js-nolint
new AudioEncoder(init)
```

### Tham số

- `init`
  - : Một đối tượng chứa hai callback bắt buộc.
    - `output`
      - : Một callback nhận đối tượng {{domxref("EncodedAudioChunk")}} làm đối số thứ nhất, và một đối tượng metadata tùy chọn làm đối số thứ hai. Đối tượng metadata có một thành viên là `decoderConfig`, với giá trị là một đối tượng chứa:
        - `codec`
          - : Một chuỗi chứa [chuỗi codec hợp lệ](https://w3c.github.io/webcodecs/codec_registry.html#audio-codec-registry).
        - `sampleRate`
          - : Một số nguyên biểu diễn số lượng mẫu khung trên giây.
        - `numberOfChannels`
          - : Một số nguyên biểu diễn số lượng kênh âm thanh.
        - `description` {{optional_inline}}
          - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa một chuỗi byte đặc thù cho codec, thường được gọi là extradata.
    - `error`
      - : Một callback nhận đối tượng {{jsxref("Error")}} làm đối số duy nhất.

## Ví dụ

Trong ví dụ sau, một `AudioEncoder` được tạo với hai hàm callback bắt buộc, một để xử lý chunk âm thanh đã mã hóa và hàm còn lại để xử lý lỗi.

```js
const audioEncoder = new AudioEncoder({
  output: processAudio,
  error: onEncoderError,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
