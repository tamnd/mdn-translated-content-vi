---
title: "OscillatorNode: hàm khởi tạo OscillatorNode()"
short-title: OscillatorNode()
slug: Web/API/OscillatorNode/OscillatorNode
page-type: web-api-constructor
browser-compat: api.OscillatorNode.OscillatorNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`OscillatorNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("OscillatorNode")}} mới, là một {{domxref("AudioNode")}} đại diện cho dạng sóng tuần hoàn, như sóng sine, tùy chọn đặt giá trị thuộc tính của nút khớp với các giá trị trong đối tượng được chỉ định.

Nếu các giá trị mặc định của các thuộc tính được chấp nhận, bạn có thể tùy chọn dùng phương thức factory {{domxref("BaseAudioContext.createOscillator()")}} thay thế; xem [Tạo AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
new OscillatorNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính chỉ định giá trị ban đầu cho các thuộc tính của oscillator node.
    Bất kỳ thuộc tính nào bị bỏ qua khỏi đối tượng sẽ nhận giá trị mặc định như được ghi lại.
    - `type`
      - : Hình dạng của sóng được tạo ra bởi nút. Các giá trị hợp lệ là
        `"sine"`, `"square"`, `"sawtooth"`,
        `"triangle"` và `"custom"`. Mặc định là
        `"sine"`.
    - `detune`
      - : Giá trị chỉnh âm (tính bằng cents) sẽ offset
        `frequency` theo lượng đã cho. Mặc định là 0.
    - `frequency`
      - : Tần số (tính bằng [hertz](https://en.wikipedia.org/wiki/Hertz)) của
        dạng sóng tuần hoàn. Mặc định là 440.
    - `periodicWave`
      - : Dạng sóng chu kỳ tùy ý được mô tả bởi đối tượng {{domxref("PeriodicWave")}}.
    - `channelCount`
      - : Đại diện cho một số nguyên dùng để xác định số kênh được dùng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối đến bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Việc sử dụng và định nghĩa chính xác phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Đại diện cho một giá trị liệt kê mô tả cách các kênh phải khớp giữa các đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)
    - `channelInterpretation`
      - : Đại diện cho một giá trị liệt kê mô tả ý nghĩa của các kênh. Việc giải thích này sẽ xác định cách [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) âm thanh sẽ xảy ra.
        Các giá trị có thể là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin bao gồm các giá trị mặc định.)

### Giá trị trả về

Một đối tượng {{domxref("OscillatorNode")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
