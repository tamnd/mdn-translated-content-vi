---
title: "VideoEncoder: configure() method"
short-title: configure()
slug: Web/API/VideoEncoder/configure
page-type: web-api-instance-method
browser-compat: api.VideoEncoder.configure
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`configure()`** của giao diện {{domxref("VideoEncoder")}} thay đổi {{domxref("VideoEncoder.state", "state")}} của bộ mã hóa thành "configured" và chuẩn bị bất đồng bộ bộ mã hóa để chấp nhận các {{domxref("VideoEncoder")}} để mã hóa với các tham số đã chỉ định. Nếu bộ mã hóa không hỗ trợ các tham số đã chỉ định hoặc không thể khởi tạo vì lý do khác, một lỗi sẽ được báo cáo thông qua callback lỗi được cung cấp cho hàm khởi tạo {{domxref("VideoEncoder")}}.

Nếu {{domxref("VideoEncoder")}} đã được cấu hình trước đó, cấu hình mới sẽ không được áp dụng cho đến khi tất cả các tác vụ trước đó đã hoàn thành.

## Cú pháp

```js-nolint
configure(config)
```

### Tham số

- `config`
  - : Một đối tượng từ điển chứa các thành viên sau:
    - `codec`
      - : Một chuỗi chứa [chuỗi codec hợp lệ](https://w3c.github.io/webcodecs/codec_registry.html#video-codec-registry). Xem [tham số "codecs"](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#codec_options_by_container) để biết chi tiết về cách xây dựng chuỗi codec.
    - `width` {{optional_inline}}
      - : Một số nguyên biểu thị chiều rộng của mỗi {{domxref("EncodedVideoChunk")}} đầu ra tính bằng pixel, trước khi có bất kỳ điều chỉnh tỉ lệ nào.
    - `height` {{optional_inline}}
      - : Một số nguyên biểu thị chiều cao của mỗi {{domxref("EncodedVideoChunk")}} đầu ra tính bằng pixel, trước khi có bất kỳ điều chỉnh tỉ lệ nào.
    - `displayWidth` {{optional_inline}}
      - : Một số nguyên biểu thị chiều rộng hiển thị dự kiến của mỗi {{domxref("EncodedVideoChunk")}} đầu ra tính bằng pixel khi hiển thị.
    - `displayHeight` {{optional_inline}}
      - : Một số nguyên biểu thị chiều dọc của mỗi {{domxref("EncodedVideoChunk")}} đầu ra tính bằng pixel khi hiển thị.
    - `hardwareAcceleration`
      - : Một gợi ý cấu hình phương pháp tăng tốc phần cứng của codec này. Một trong các giá trị:
        - `"no-preference"`
        - `"prefer-hardware"`
        - `"prefer-software"`
    - `bitrate`
      - : Một số nguyên chứa tốc độ bit trung bình của video được mã hóa tính theo bit mỗi giây.
    - `framerate`
      - : Một số nguyên chứa tốc độ khung hình dự kiến tính theo khung hình mỗi giây.
    - `alpha`
      - : Một chuỗi cho biết liệu thành phần alpha của đầu vào `VideoFrame` có nên được giữ lại hay loại bỏ trước khi mã hóa. Một trong các giá trị:
        - `"discard"` (mặc định)
        - `"keep"`
    - `scalabilityMode`
      - : Một chuỗi chứa định danh chế độ khả năng mở rộng mã hóa như được định nghĩa trong [WebRTC](https://w3c.github.io/webrtc-svc/#scalabilitymodes*).
    - `bitrateMode` {{optional_inline}}
      - : Một chuỗi chứa chế độ tốc độ bit. Một trong các giá trị:
        - `"constant"`
          - : Bộ mã hóa sẽ nhắm đến tốc độ bit không đổi.
        - `"variable"` (mặc định)
          - : Bộ mã hóa sẽ nhắm đến tốc độ bit thay đổi, cho phép sử dụng nhiều không gian hơn cho các tín hiệu phức tạp và ít không gian hơn cho các tín hiệu ít phức tạp hơn.
        - `"quantizer"`
          - : Bộ mã hóa sẽ bỏ qua tùy chọn `bitrate` và thay vào đó sẽ sử dụng các giá trị quantizer dành riêng cho codec được chỉ định cho từng khung hình trong tham số `options` của {{domxref("VideoEncoder.encode()")}}.
    - `latencyMode` {{optional_inline}}
      - : Một chuỗi chứa giá trị cấu hình hành vi độ trễ của codec này. Một trong các giá trị:
        - `"quality"` (mặc định)
          - : Bộ mã hóa nên tối ưu hóa chất lượng mã hóa.
        - `"realtime"`
          - : Bộ mã hóa nên tối ưu hóa độ trễ thấp và thậm chí có thể bỏ khung hình để đảm bảo `framerate`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu `config` được cung cấp không hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu {{domxref("VideoEncoder.state","state")}} là `"closed"`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu `config` được cung cấp hợp lệ nhưng tác nhân người dùng không thể cung cấp codec có thể giải mã profile này.

## Ví dụ

Ví dụ sau tạo một {{domxref("VideoEncoder")}} mới và cấu hình nó với một số tùy chọn có sẵn.

```js
const init = {
  output: handleChunk,
  error(e) {
    console.log(e.message);
  },
};

let config = {
  codec: "vp8",
  width: 640,
  height: 480,
  bitrate: 2_000_000, // 2 Mbps
  framerate: 30,
};

let encoder = new VideoEncoder(init);
encoder.configure(config);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VideoEncoder.isConfigSupported()")}}
- [Bảng hỗ trợ chuỗi codec](https://webcodecsfundamentals.org/datasets/codec-support-table/)
