---
title: "AnalyserNode: bộ khởi tạo AnalyserNode()"
short-title: AnalyserNode()
slug: Web/API/AnalyserNode/AnalyserNode
page-type: web-api-constructor
browser-compat: api.AnalyserNode.AnalyserNode
---

{{APIRef("Web Audio API")}}

Bộ khởi tạo **`AnalyserNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo ra một thể hiện đối tượng {{domxref("AnalyserNode")}} mới.

## Cú pháp

```js-nolint
new AnalyserNode(context)
new AnalyserNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến {{domxref("AudioContext")}} hoặc {{domxref("OfflineAudioContext")}}.
- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau, tất cả đều là tùy chọn:
    - `fftSize`
      - : Kích thước khởi tạo mong muốn của [FFT](https://en.wikipedia.org/wiki/Fast_Fourier_transform) cho phép phân tích theo [miền tần số](https://en.wikipedia.org/wiki/Frequency_domain).
        Mặc định là `2048`.
    - `maxDecibels`
      - : Mức công suất tối đa khởi tạo mong muốn tính bằng [dB](https://en.wikipedia.org/wiki/Decibel) cho phép phân tích FFT.
        Mặc định là `-30`.
    - `minDecibels`
      - : Mức công suất tối thiểu khởi tạo mong muốn tính bằng dB cho phép phân tích FFT.
        Mặc định là `-100`.
    - `smoothingTimeConstant`
      - : Hằng số làm mượt khởi tạo mong muốn cho phép phân tích FFT. Mặc định là `0.8`.
    - `channelCount`
      - : Biểu diễn một số nguyên dùng để xác định có bao nhiêu kênh được dùng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) kết nối tới bất kỳ đầu vào nào của nút. (Xem thêm {{domxref("AudioNode.channelCount")}}.)
        Cách dùng và định nghĩa chính xác phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Biểu diễn một giá trị [liệt kê](/en-US/docs/Glossary/Enumerated) mô tả cách các kênh phải được đối sánh giữa đầu vào và đầu ra của nút. (Xem thêm {{domxref("AudioNode.channelCountMode")}}.)
    - `channelInterpretation`
      - : Biểu diễn một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này xác định cách quá trình [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) xảy ra.
        Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem thêm {{domxref("AudioNode.channelCountMode")}}.)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("BaseAudioContext.createAnalyser()")}}, phương thức tạo tương đương
