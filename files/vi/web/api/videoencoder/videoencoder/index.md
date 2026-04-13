---
title: "VideoEncoder: VideoEncoder() constructor"
short-title: VideoEncoder()
slug: Web/API/VideoEncoder/VideoEncoder
page-type: web-api-constructor
browser-compat: api.VideoEncoder.VideoEncoder
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Hàm khởi tạo **`VideoEncoder()`** tạo một đối tượng {{domxref("VideoEncoder")}} mới với callback `options.output` được cung cấp được gán làm callback đầu ra, callback `options.error` được cung cấp làm callback lỗi, và đặt {{domxref("VideoEncoder.state")}} thành `"unconfigured"`.

## Cú pháp

```js-nolint
new VideoEncoder(options)
```

### Tham số

- `options`
  - : Một đối tượng chứa hai callback bắt buộc.
    - `output`
      - : Một callback nhận một đối tượng {{domxref("EncodedVideoChunk")}} làm tham số đầu tiên, và một đối tượng metadata tùy chọn làm tham số thứ hai. Đối tượng metadata có ba thành viên:
        - `decoderConfig` {{Optional_Inline}}
          - : Một đối tượng chứa:
            - `codec`
              - : Một chuỗi chứa [chuỗi codec hợp lệ](https://w3c.github.io/webcodecs/codec_registry.html#video-codec-registry).
            - `description` {{Optional_Inline}}
              - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa một chuỗi các byte đặc thù cho codec, thường được gọi là "extradata".
            - `codedWidth` {{Optional_Inline}}
              - : Một số nguyên biểu thị chiều rộng của {{domxref("VideoFrame")}} tính bằng pixel, có thể bao gồm vùng đệm không hiển thị, trước khi xem xét các điều chỉnh tỉ lệ.
            - `codedHeight` {{Optional_Inline}}
              - : Một số nguyên biểu thị chiều cao của {{domxref("VideoFrame")}} tính bằng pixel, có thể bao gồm vùng đệm không hiển thị, trước khi xem xét các điều chỉnh tỉ lệ.
            - `displayAspectWidth` {{Optional_Inline}}
              - : Một số nguyên biểu thị chiều ngang của {{glossary("aspect ratio", "tỉ lệ khung hình")}} của {{domxref("VideoFrame")}} khi hiển thị.
            - `displayAspectHeight` {{Optional_Inline}}
              - : Một số nguyên biểu thị chiều dọc của tỉ lệ khung hình của {{domxref("VideoFrame")}} khi hiển thị.
            - `colorSpace` {{Optional_Inline}}
              - : Một đối tượng bạn truyền vào hàm khởi tạo {{domxref("VideoColorSpace")}} làm tham số `init`, cấu hình {{domxref("VideoFrame.colorSpace")}} cho các {{domxref("VideoFrame","VideoFrames")}} liên quan đến đối tượng `decoderConfig` này. Nếu `colorSpace` tồn tại, các giá trị được cung cấp sẽ ghi đè bất kỳ giá trị nào trong luồng bit.
            - `hardwareAcceleration` {{Optional_Inline}}
              - : Một chuỗi cấu hình tăng tốc phần cứng cho codec này. Mặc định là `"no-preference"`. Các tùy chọn bao gồm:
                - `"no-preference"`
                - `"prefer-hardware"`
                - `"prefer-software"`
            - `optimizeForLatency` {{Optional_Inline}}
              - : Một giá trị boolean biểu thị liệu bộ giải mã được chọn có nên được cấu hình để giảm thiểu số lượng {{domxref("EncodedVideoChunk","EncodedVideoChunks")}} phải được giải mã trước khi xuất ra {{domxref("VideoFrame")}} hay không.
        - `svc` {{Optional_Inline}}
          - : Một đối tượng tùy chọn chỉ có một thành viên: `temporalLayerId`, là một số xác định [lớp thời gian](https://w3c.github.io/webcodecs/#temporal-layer) cho {{domxref("EncodedVideoChunk")}} liên quan.
        - `alphaSideData` {{Optional_Inline}}
          - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa dữ liệu kênh alpha bổ sung của {{domxref("EncodedVideoChunk")}}.
    - `error`
      - : Một callback nhận một đối tượng {{jsxref("Error")}} làm tham số duy nhất.

## Ví dụ

Trong ví dụ sau, một `VideoEncoder` được tạo với hai hàm callback bắt buộc: một để xử lý khung đã mã hóa và một để xử lý lỗi.

```js
const videoEncoder = new VideoEncoder({
  output(chunk, metadata) {
    console.log(chunk.timestamp);
    console.log(chunk.byteLength);
    console.log(JSON.stringify(metadata));
  },
  error(error) {
    console.log(error);
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
