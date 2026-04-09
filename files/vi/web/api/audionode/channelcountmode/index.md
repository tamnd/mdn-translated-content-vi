---
title: "AudioNode: thuộc tính channelCountMode"
short-title: channelCountMode
slug: Web/API/AudioNode/channelCountMode
page-type: web-api-instance-property
browser-compat: api.AudioNode.channelCountMode
---

{{ APIRef("Web Audio API") }}

Thuộc tính `channelCountMode` của giao diện {{ domxref("AudioNode") }} biểu diễn một giá trị liệt kê mô tả cách các kênh phải được khớp giữa đầu vào và đầu ra của nút.

## Giá trị

Các giá trị có thể có của giá trị liệt kê `channelCountMode`, cùng ý nghĩa của chúng, là:

- `max`
  - : Số lượng kênh bằng với số lượng kênh lớn nhất trong tất cả các kết nối.
    Trong trường hợp này, `channelCount` bị bỏ qua và chỉ có up-mixing xảy ra.

    Các lớp con AudioNode sau mặc định dùng giá trị này: {{domxref("GainNode")}}, {{domxref("DelayNode")}}, {{domxref("ScriptProcessorNode")}}, {{domxref("BiquadFilterNode")}}, {{domxref("WaveShaperNode")}}.

- `clamped-max`
  - : Số lượng kênh bằng với số lượng kênh lớn nhất trong tất cả các kết nối, nhưng bị chặn theo giá trị của `channelCount`.

    Các lớp con AudioNode sau mặc định dùng giá trị này: {{domxref("PannerNode")}}, {{domxref("ConvolverNode")}}, {{domxref("DynamicsCompressorNode")}}

- `explicit`
  - : Số lượng kênh được xác định bởi giá trị của `channelCount`.

    Các lớp con AudioNode sau mặc định dùng giá trị này: {{domxref("AudioDestinationNode")}}, {{domxref("AnalyserNode")}}, {{domxref("ChannelSplitterNode")}}, {{domxref("ChannelMergerNode")}}

> [!NOTE]
> Trong các phiên bản cũ hơn của đặc tả, giá trị mặc định của {{domxref("ChannelSplitterNode")}} là `max`.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode);
gainNode.connect(audioCtx.destination);

oscillator.channelCountMode = "explicit";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
