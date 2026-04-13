---
title: "BaseAudioContext: phương thức createBiquadFilter()"
short-title: createBiquadFilter()
slug: Web/API/BaseAudioContext/createBiquadFilter
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createBiquadFilter
---

{{ APIRef("Web Audio API") }}

Phương thức `createBiquadFilter()` của giao diện {{ domxref("BaseAudioContext") }}
tạo một {{ domxref("BiquadFilterNode") }}, biểu diễn một bộ lọc bậc hai có thể cấu hình thành nhiều kiểu bộ lọc thông dụng khác nhau.

> [!NOTE]
> Hàm dựng {{domxref("BiquadFilterNode.BiquadFilterNode", "BiquadFilterNode()")}} là cách được
> khuyến nghị để tạo một {{domxref("BiquadFilterNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createBiquadFilter()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("BiquadFilterNode")}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản của một AudioContext để tạo một node bộ lọc Biquad.
Để xem ví dụ/thông tin ứng dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết phần mã liên quan).

```js
const audioCtx = new AudioContext();

// Thiết lập các audio node khác nhau mà ứng dụng sẽ dùng
const analyser = audioCtx.createAnalyser();
const distortion = audioCtx.createWaveShaper();
const gainNode = audioCtx.createGain();
const biquadFilter = audioCtx.createBiquadFilter();
const convolver = audioCtx.createConvolver();

// Kết nối các node lại với nhau

source = audioCtx.createMediaStreamSource(stream);
source.connect(analyser);
analyser.connect(distortion);
distortion.connect(biquadFilter);
biquadFilter.connect(convolver);
convolver.connect(gainNode);
gainNode.connect(audioCtx.destination);

// Điều chỉnh bộ lọc Biquad

biquadFilter.type = "lowshelf";
biquadFilter.frequency.setValueAtTime(1000, audioCtx.currentTime);
biquadFilter.gain.setValueAtTime(25, audioCtx.currentTime);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
