---
title: "AudioEncoder: phương thức configure()"
short-title: configure()
slug: Web/API/AudioEncoder/configure
page-type: web-api-instance-method
browser-compat: api.AudioEncoder.configure
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`configure()`** của giao diện {{domxref("AudioEncoder")}} đưa một thông điệp điều khiển vào hàng đợi để cấu hình bộ mã hóa âm thanh cho việc mã hóa các chunk.

## Cú pháp

```js-nolint
configure(config)
```

### Tham số

- `config`
  - : Một đối tượng từ điển chứa các thành viên sau:
    - `codec`
      - : Một chuỗi chứa [chuỗi codec hợp lệ](https://w3c.github.io/webcodecs/codec_registry.html#audio-codec-registry). Xem [tham số "codecs"](/en-US/docs/Web/Media/Guides/Formats/codecs_parameter#codec_options_by_container) để biết chi tiết về cách tạo chuỗi codec.
    - `sampleRate`
      - : Một số nguyên biểu diễn số lượng mẫu khung trên giây.
    - `numberOfChannels`
      - : Một số nguyên biểu diễn số lượng kênh âm thanh.
    - `bitrate` {{optional_inline}}
      - : Một số nguyên biểu diễn bitrate.
    - `bitrateMode` {{optional_inline}}
      - : Một giá trị liệt kê xác định chế độ bitrate mà bộ mã hóa nên dùng. Các giá trị có thể là:
        - `"constant"`
          - : Buộc bộ mã hóa âm thanh duy trì cùng một bitrate, bất kể nội dung âm thanh là gì. Điều này hữu ích khi cần mức tiêu thụ băng thông có thể dự đoán trước.
        - `"variable"` (mặc định)
          - : Cho phép bộ mã hóa âm thanh tăng hoặc giảm bitrate tùy theo nội dung âm thanh đang được mã hóa, nhằm tiết kiệm băng thông/kích thước nhị phân trong khi vẫn duy trì chất lượng mục tiêu. Ví dụ, bộ mã hóa có thể giảm bitrate khi mã hóa khoảng lặng và quay lại bitrate đầy đủ khi mã hóa giọng nói.

        Các triển khai bộ mã hóa theo codec cụ thể có thể dùng thuật ngữ hơi khác nhau (ví dụ CBR so với VBR cho Opus), nhưng tất cả đều nên ánh xạ tới khái niệm tổng quát về bitrate "constant" so với "variable".

    - `opus` {{optional_inline}}
      - : Chỉ định các tùy chọn cấu hình codec dành riêng cho codec Opus. Giá trị của nó là một đối tượng `OpusEncoderConfig`, với các thuộc tính có thể có như sau:
        - `application` {{optional_inline}}
          - : Một giá trị liệt kê chỉ định kiểu ứng dụng mục tiêu của bộ mã hóa. Các giá trị có thể là:
            - `audio` (mặc định)
              - : Xử lý tín hiệu trung thực với đầu vào gốc.
            - `lowdelay`
              - : Khi xử lý tín hiệu, cấu hình độ trễ mã hóa thấp nhất có thể bằng cách tắt một số chế độ hoạt động nhất định.
            - `voip`
              - : Xử lý tín hiệu để cải thiện độ rõ của lời nói.
        - `complexity` {{optional_inline}}
          - : Một số xác định độ phức tạp tính toán của bộ mã hóa, dựa trên các khía cạnh được mô tả trong mục [RFC6716, 2.1.5. — Complexity](https://www.rfc-editor.org/rfc/rfc6716#section-2.1.5). Phạm vi hợp lệ là từ 0 đến 10, trong đó 10 biểu thị độ phức tạp cao nhất. Nếu không chỉ định, giá trị mặc định phụ thuộc nền tảng, và đặc tả khuyến nghị dùng 5 cho nền tảng di động, 9 cho mọi nền tảng khác.
        - `format` {{optional_inline}}
          - : Một giá trị liệt kê chỉ định định dạng mà bộ mã hóa nên xuất ra các {{domxref("EncodedAudioChunk")}}. Các giá trị có thể là:
            - `opus` (mặc định)
              - : Xuất các `EncodedAudioChunk` theo định dạng Opus. Trong trường hợp này, không cần metadata để giải mã luồng âm thanh đã mã hóa.
            - `ogg`
              - : Xuất các `EncodedAudioChunk` theo định dạng Ogg. Trong trường hợp này, không cần metadata để giải mã luồng âm thanh đã mã hóa. Metadata của luồng âm thanh đã mã hóa sẽ được cung cấp trong cấu hình bộ giải mã, thông qua thuộc tính [`description`](/en-US/docs/Web/API/AudioDecoder/configure#description) của đối tượng config được truyền vào {{domxref("AudioDecoder.configure()")}}.
        - `frameDuration` {{optional_inline}}
          - : Một số xác định thời lượng khung, tính bằng micro giây, của các `EncodedAudioChunk` do bộ mã hóa xuất ra. Nếu không chỉ định, `frameDuration` mặc định là `20000`.
        - `packetlossperc` {{optional_inline}}
          - : Một số xác định tỷ lệ phần trăm mất gói mà bộ mã hóa dự kiến. Phạm vi hợp lệ là từ 0 đến 100. Nếu không chỉ định, `packetlossperc` mặc định là `0`.
        - `signal` {{optional_inline}}
          - : Một giá trị liệt kê chỉ định giá trị mặc định cho loại tín hiệu âm thanh đang được mã hóa. Các giá trị có thể là:
            - `auto` (mặc định)
              - : Tín hiệu âm thanh không được chỉ định là một kiểu cụ thể.
            - `music`
              - : Tín hiệu âm thanh là nhạc.
            - `voice`
              - : Tín hiệu âm thanh là giọng nói hoặc lời nói.
        - `usedtx` {{optional_inline}}
          - : Một giá trị boolean chỉ định liệu bộ mã hóa có dùng Discontinuous Transmission (DTX) hay không, giúp giảm bitrate trong lúc im lặng hoặc có tạp âm nền. Khi DTX được bật, chỉ một khung được mã hóa mỗi 400 mili giây. Nếu không chỉ định, `usedtx` mặc định là `false`.
        - `useinbandfec` {{optional_inline}}
          - : Một giá trị boolean chỉ định liệu bộ mã hóa có cung cấp Opus in-band Forward Error Correction (FEC) hay không. Điều này dẫn tới việc các gói được xác định là chứa thông tin lời nói quan trọng về mặt cảm nhận, chẳng hạn như onset hoặc transient, sẽ được mã hóa lại ở bitrate thấp hơn và thêm vào một gói kế tiếp. Nếu không chỉ định, `useinbandfec` mặc định là `false`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `config` được cung cấp không hợp lệ.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("AudioEncoder.state", "state")}} là `"closed"`.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu `config` được cung cấp là hợp lệ nhưng user agent không thể cung cấp codec có thể mã hóa profile này.

## Ví dụ

### Ví dụ cấu hình cơ bản

Ví dụ sau tạo một {{domxref("AudioEncoder")}} mới và cấu hình nó với một số tùy chọn có sẵn.

```js
const init = {
  output: handleOutput,
  error(e) {
    console.log(e.message);
  },
};

let config = {
  codec: "mp3",
  sampleRate: 44100,
  numberOfChannels: 2,
  bitrate: 128_000, // 128 kbps
  bitrateMode: "constant",
};

let encoder = new AudioEncoder(init);
encoder.configure(config);
```

### Ví dụ cấu hình riêng cho Opus

Ví dụ sau tạo một {{domxref("AudioEncoder")}} mới và cấu hình nó với các tùy chọn dành riêng cho Opus.

```js
const init = {
  output: handleOutput,
  error(e) {
    console.log(e.message);
  },
};

let opusConfig = {
  application: "voip",
  complexity: 9,
  signal: "voice",
  usedtx: true,
};

let config = {
  codec: "opus",
  sampleRate: 44100,
  numberOfChannels: 2,
  bitrate: 128_000,
  opus: opusConfig,
};

let encoder = new AudioEncoder(init);
encoder.configure(config);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
