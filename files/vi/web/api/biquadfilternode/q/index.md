---
title: "BiquadFilterNode: thuộc tính Q"
short-title: Q
slug: Web/API/BiquadFilterNode/Q
page-type: web-api-instance-property
browser-compat: api.BiquadFilterNode.Q
---

{{ APIRef("Web Audio API") }}

Thuộc tính `Q` của giao diện {{ domxref("BiquadFilterNode") }} là một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate), một số thực kép biểu diễn [hệ số Q](https://en.wikipedia.org/wiki/Q_factor), hay _quality factor_.

## Giá trị

Một {{domxref("AudioParam")}}. {{domxref("AudioParam/defaultValue", "defaultValue")}} của nó là `1`, và {{domxref("AudioParam/minValue", "minValue")}} cùng {{domxref("AudioParam/maxValue", "maxValue")}} của nó là ±(2<sup>128</sup> - 2<sup>104</sup>), hay xấp xỉ ±3.403e38. Đây là phạm vi của các số dấu chấm động đơn chính xác.

Phạm vi giá trị thực tế của nó phụ thuộc vào {{domxref("BiquadFilterNode/type", "type")}} của bộ lọc:

- Đối với `lowpass` và `highpass`, giá trị `Q` được diễn giải theo dB. Với các bộ lọc này, phạm vi giá trị là [-Q, Q], trong đó Q là giá trị lớn nhất sao cho 10<sup>Q/20</sup> không bị tràn vượt quá giới hạn nêu trên. Giá trị này xấp xỉ 770.63678.
- Với `bandpass`, `notch`, `allpass` và `peaking`, giá trị `Q` liên quan đến băng thông của bộ lọc và nên là số dương, nhưng không có giới hạn tối đa nghiêm ngặt nào ngoài giới hạn đã nêu ở trên.
- Nó không được dùng cho các bộ lọc `lowshelf` và `highshelf`.

> [!NOTE]
> Mặc dù `AudioParam` được trả về là chỉ đọc, giá trị mà nó biểu diễn thì không phải.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản của một AudioContext để tạo một nút bộ lọc Biquad.
Để xem ví dụ/thông tin đầy đủ hơn, hãy tham khảo bản minh họa [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [các dòng 108–193 trong app.js](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết phần mã liên quan).

```js
const audioCtx = new AudioContext();

// Set up the different audio nodes we will use for the app
const analyser = audioCtx.createAnalyser();
const distortion = audioCtx.createWaveShaper();
const gainNode = audioCtx.createGain();
const biquadFilter = audioCtx.createBiquadFilter();
const convolver = audioCtx.createConvolver();

// Connect the nodes together

source = audioCtx.createMediaStreamSource(stream);
source.connect(analyser);
analyser.connect(distortion);
distortion.connect(biquadFilter);
biquadFilter.connect(convolver);
convolver.connect(gainNode);
gainNode.connect(audioCtx.destination);

// Manipulate the Biquad filter

biquadFilter.type = "lowshelf";
biquadFilter.frequency.value = 1000;
biquadFilter.gain.value = 25;

biquadFilter.type = "peaking";
biquadFilter.frequency.value = 1000;
biquadFilter.Q.value = 100;
biquadFilter.gain.value = 25;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
