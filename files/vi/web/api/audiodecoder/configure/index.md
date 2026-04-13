---
title: "AudioDecoder: phương thức configure()"
short-title: configure()
slug: Web/API/AudioDecoder/configure
page-type: web-api-instance-method
browser-compat: api.AudioDecoder.configure
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`configure()`** của giao diện {{domxref("AudioDecoder")}} đưa một thông điệp điều khiển vào hàng đợi để cấu hình bộ giải mã âm thanh nhằm giải mã các đoạn dữ liệu.

## Cú pháp

```js-nolint
configure(config)
```

### Tham số

- `config`
  - : Một đối tượng dictionary chứa các thành viên sau:
    - `codec`
      - : Một chuỗi chứa [chuỗi codec hợp lệ](https://w3c.github.io/webcodecs/codec_registry.html#audio-codec-registry). Xem [tham số "codecs"](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#codec_options_by_container) để biết chi tiết về cách xây dựng chuỗi codec.
    - `sampleRate`
      - : Một số nguyên biểu diễn số mẫu khung trên giây.
    - `numberOfChannels`
      - : Một số nguyên biểu diễn số kênh âm thanh.
    - `description` {{optional_inline}}
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} chứa một chuỗi byte dành riêng cho codec, thường được gọi là extradata.

> [!NOTE]
> Các đăng ký trong [WebCodecs Codec Registry](https://w3c.github.io/webcodecs/codec_registry.html#audio-codec-registry) liên kết đến một đặc tả mô tả việc có nên điền và điền thành viên `description` tùy chọn như thế nào.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `config` được cung cấp không hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("AudioDecoder.state","state")}} là `"closed"`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `config` được cung cấp là hợp lệ nhưng user agent không thể cung cấp codec có thể giải mã cấu hình này.

## Ví dụ

Ví dụ sau cấu hình `audioDecoder` với codec `opus`.

```js
audioDecoder.configure({
  codec: "opus",
  sampleRate: 44100,
  numberOfChannels: 2,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
