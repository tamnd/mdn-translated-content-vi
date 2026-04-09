---
title: "BaseAudioContext: phương thức createWaveShaper()"
short-title: createWaveShaper()
slug: Web/API/BaseAudioContext/createWaveShaper
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createWaveShaper
---

{{ APIRef("Web Audio API") }}

Phương thức `createWaveShaper()` của giao diện {{ domxref("BaseAudioContext") }}
tạo một {{ domxref("WaveShaperNode") }}, biểu diễn một dạng méo phi tuyến.
Nó được dùng để áp dụng các hiệu ứng méo lên âm thanh của bạn.

> [!NOTE]
> Hàm dựng {{domxref("WaveShaperNode.WaveShaperNode", "WaveShaperNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("WaveShaperNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createWaveShaper()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("WaveShaperNode")}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản một AudioContext để tạo một wave shaper node.
Để xem ví dụ/thông tin ứng dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js) để biết phần mã liên quan).

> [!NOTE]
> Các hàm sigmoid thường được dùng cho đường cong méo
> vì những đặc tính tự nhiên của chúng. Ví dụ, hình chữ S của chúng giúp tạo ra kết quả nghe mượt hơn.
> Chúng tôi tìm thấy đoạn mã đường cong méo bên dưới trên [Stack Overflow](https://stackoverflow.com/questions/22312841/waveshaper-node-in-webaudio-how-to-emulate-distortion).

```js
const audioCtx = new AudioContext();
const distortion = audioCtx.createWaveShaper();

// …

function makeDistortionCurve(amount) {
  const k = typeof amount === "number" ? amount : 50;
  const numSamples = 44100;
  const curve = new Float32Array(numSamples);
  const deg = Math.PI / 180;

  for (let i = 0; i < numSamples; i++) {
    const x = (i * 2) / numSamples - 1;
    curve[i] = ((3 + k) * x * 20 * deg) / (Math.PI + k * Math.abs(x));
  }
  return curve;
}

// …

distortion.curve = makeDistortionCurve(400);
distortion.oversample = "4x";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
