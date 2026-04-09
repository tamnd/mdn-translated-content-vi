---
title: "BiquadFilterNode: thuộc tính gain"
short-title: gain
slug: Web/API/BiquadFilterNode/gain
page-type: web-api-instance-property
browser-compat: api.BiquadFilterNode.gain
---

{{ APIRef("Web Audio API") }}

Thuộc tính `gain` của giao diện {{ domxref("BiquadFilterNode") }} là một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) — một số thực kép biểu diễn [gain](https://en.wikipedia.org/wiki/Gain) được dùng trong thuật toán lọc hiện tại.

Khi giá trị của nó dương, nó biểu diễn gain thực; khi âm, nó biểu diễn sự suy giảm.

Nó được biểu diễn theo dB, có giá trị mặc định là `0`, và có thể nhận giá trị trong phạm vi danh định từ `-40` đến `40`.

## Giá trị

Một {{domxref("AudioParam")}}.

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
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
