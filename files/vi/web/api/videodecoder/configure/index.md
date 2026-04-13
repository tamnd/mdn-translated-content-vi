---
title: "VideoDecoder: phương thức configure()"
short-title: configure()
slug: Web/API/VideoDecoder/configure
page-type: web-api-instance-method
browser-compat: api.VideoDecoder.configure
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`configure()`** của giao diện {{domxref("VideoDecoder")}} thêm một thông điệp điều khiển vào hàng đợi để cấu hình bộ giải mã video cho việc giải mã các đoạn.

## Cú pháp

```js-nolint
configure(config)
```

### Tham số

- `config`
  - : Một đối tượng chứa các thành viên sau:
    - `codec`
      - : Một chuỗi chứa [chuỗi codec hợp lệ](https://w3c.github.io/webcodecs/codec_registry.html#video-codec-registry). Xem [tham số "codecs"](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#codec_options_by_container) để biết chi tiết về cách xây dựng chuỗi codec.
    - `description` {{optional_inline}}
      - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} chứa một chuỗi byte đặc thù của codec, thường được gọi là extradata.
    - `codedWidth` {{optional_inline}}
      - : Một số nguyên biểu thị chiều rộng của {{domxref("VideoFrame")}} tính bằng pixel, bao gồm cả phần đệm không hiển thị, trước khi điều chỉnh tỉ lệ.
    - `codedHeight` {{optional_inline}}
      - : Một số nguyên biểu thị chiều cao của {{domxref("VideoFrame")}} tính bằng pixel, bao gồm cả phần đệm không hiển thị, trước khi điều chỉnh tỉ lệ.
    - `displayAspectWidth` {{optional_inline}}
      - : Một số nguyên biểu thị kích thước ngang của {{domxref("VideoFrame")}} tính bằng pixel khi hiển thị.
    - `displayAspectHeight` {{optional_inline}}
      - : Một số nguyên biểu thị kích thước dọc của {{domxref("VideoFrame")}} tính bằng pixel khi hiển thị.
    - `colorSpace` {{optional_inline}}
      - : Một đối tượng biểu thị {{domxref("VideoColorSpace")}}, chứa các thành viên sau:
        - `primaries`
          - : Một chuỗi biểu thị {{glossary("gamut")}} màu của mẫu video. Một trong các giá trị:
            - `"bt709"`
            - `"bt470bg"`
            - `"smpte170m"`
        - `transfer`
          - : Một chuỗi biểu thị đặc tính truyền dẫn. Một trong các giá trị:
            - `"bt709"`
            - `"smpte170m"`
            - `"iec61966-2-1"`
        - `matrix`
          - : Một chuỗi biểu thị hệ số ma trận. Một trong các giá trị:
            - `"rgb"`
            - `"bt709"`
            - `"bt470bg"`
            - `"smpte170m"`
    - `hardwareAcceleration` {{optional_inline}}
      - : Gợi ý về phương thức tăng tốc phần cứng sẽ sử dụng. Một trong các giá trị:
        - `"no-preference"`
        - `"prefer-hardware"`
        - `"prefer-software"`
    - `optimizeForLatency` {{optional_inline}}
      - : Một giá trị boolean. Nếu là `true`, đây là gợi ý rằng bộ giải mã được chọn nên được tối ưu hóa để giảm thiểu số lượng đối tượng {{domxref("EncodedVideoChunk")}} cần giải mã trước khi xuất {{domxref("VideoFrame")}}.
    - `flip` {{optional_inline}}
      - : Một giá trị boolean. Nếu là `true`, lật ngang được áp dụng. Mặc định là `false`.
    - `rotation` {{optional_inline}}
      - : Một số nguyên biểu thị góc xoay (0, 90, 180 hoặc 270) theo chiều kim đồng hồ tính bằng độ. Mặc định là `0`. Các số tùy ý (bao gồm số âm) được làm tròn đến góc phần tư tiếp theo.

> [!NOTE]
> Các mục đăng ký trong [WebCodecs Codec Registry](https://w3c.github.io/webcodecs/codec_registry.html#video-codec-registry) liên kết đến đặc tả mô tả liệu có và làm thế nào để điền thành viên `description` tùy chọn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `config` được cung cấp không hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("VideoDecoder.state","state")}} là `"closed"`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu `config` được cung cấp hợp lệ nhưng tác nhân người dùng không thể cung cấp codec có thể giải mã profile này.

## Ví dụ

Ví dụ sau đây tạo một {{domxref("VideoDecoder")}} mới và cấu hình nó với codec `"vp8"`, `codedWidth` là 640 pixel và `codedHeight` là 480 pixel.

```js
const init = {
  output: handleFrame,
  error(e) {
    console.log(e.message);
  },
};

const config = {
  codec: "vp8",
  codedWidth: 640,
  codedHeight: 480,
};

let decoder = new VideoDecoder(init);
decoder.configure(config);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VideoDecoder.isConfigSupported()")}}
- [Codec String Support Table](https://webcodecsfundamentals.org/datasets/codec-support-table/)
