---
title: "VideoEncoder: encode() method"
short-title: encode()
slug: Web/API/VideoEncoder/encode
page-type: web-api-instance-method
browser-compat: api.VideoEncoder.encode
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`encode()`** của giao diện {{domxref("VideoEncoder")}} mã hóa bất đồng bộ một {{domxref("VideoFrame")}}.
Dữ liệu đã mã hóa ({{domxref("EncodedVideoChunk")}}) hoặc lỗi sẽ được trả về thông qua các callback được cung cấp cho hàm khởi tạo {{domxref("VideoEncoder")}}.

## Cú pháp

```js-nolint
encode(frame)
encode(frame, options)
```

### Tham số

- `frame`
  - : Một đối tượng {{domxref("VideoFrame")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các thành viên sau:
    - `keyFrame` {{optional_inline}}
      - : Một {{jsxref("boolean")}}, mặc định là `false`, cho tác nhân người dùng quyền linh hoạt để quyết định liệu khung hình này có nên được mã hóa như một khung hình chính hay không. Nếu là `true`, điều này cho biết khung hình đã cho phải được mã hóa như một khung hình chính.
    - `vp9` {{optional_inline}}
      - : Tùy chọn mã hóa cho codec [VP9](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#vp9).
        - `quantizer`
          - : Giá trị quantizer khung hình từ 0 đến 63. Chỉ có hiệu lực nếu {{domxref("VideoEncoder")}} được cấu hình với chế độ tốc độ bit `quantizer`.
    - `av1` {{optional_inline}}
      - : Tùy chọn mã hóa cho codec [AV1](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#av1).
        - `quantizer`
          - : Giá trị quantizer khung hình từ 0 đến 63. Chỉ có hiệu lực nếu {{domxref("VideoEncoder")}} được cấu hình với chế độ tốc độ bit `quantizer`.
    - `avc` {{optional_inline}}
      - : Tùy chọn mã hóa cho codec [AVC (H.264)](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#avc_h.264).
        - `quantizer`
          - : Giá trị quantizer khung hình từ 0 đến 51. Chỉ có hiệu lực nếu {{domxref("VideoEncoder")}} được cấu hình với chế độ tốc độ bit `quantizer`.
    - `hevc` {{optional_inline}}
      - : Tùy chọn mã hóa cho codec [HEVC (H.265)](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#hevc_h.265).
        - `quantizer`
          - : Giá trị quantizer khung hình từ 0 đến 51. Chỉ có hiệu lực nếu {{domxref("VideoEncoder")}} được cấu hình với chế độ tốc độ bit `quantizer`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("VideoEncoder.state","state")}} không phải là `"configured"`.
- `DataError` {{domxref("DOMException")}}
  - : Được ném nếu góc xoay và lật của đối tượng `frame` đã cho không khớp với góc xoay và lật của {{domxref("VideoFrame")}} đầu tiên được truyền vào `encode()` (gọi là "hướng hiện hoạt").

## Ví dụ

Trong ví dụ sau, `encode` được truyền một `VideoFrame` cùng tham số options cho biết khung hình này phải được coi là khung hình chính.

```js
encoder.encode(frame, { keyFrame: true });
```

Đặt giá trị QP theo từng khung hình để mã hóa các khung hình riêng lẻ.

```js
const encoder = new VideoEncoder(init);
const encoderConfig = {
  codec: "vp09.00.10.08",
  width: 800,
  height: 600,
  bitrateMode: "quantizer",
  framerate: 30,
  latencyMode: "realtime",
};
encoder.configure(encoderConfig);

const encodeOptions = { keyFrame: false };
const qp = calculateQp(codec, frame);

if (codec.includes("vp09")) {
  encodeOptions.vp9 = { quantizer: qp };
} else if (codec.includes("av01")) {
  encodeOptions.av1 = { quantizer: qp };
} else if (codec.includes("avc")) {
  encodeOptions.avc = { quantizer: qp };
} else if (codec.includes("hvc1") || codec.includes("hev1")) {
  encodeOptions.hevc = { quantizer: qp };
}

encoder.encode(frame, encodeOptions);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
