---
title: "BiquadFilterNode: thuộc tính frequency"
short-title: frequency
slug: Web/API/BiquadFilterNode/frequency
page-type: web-api-instance-property
browser-compat: api.BiquadFilterNode.frequency
---

{{ APIRef("Web Audio API") }}

Thuộc tính `frequency` của giao diện {{ domxref("BiquadFilterNode") }} là một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) — một số thực kép biểu diễn tần số trong thuật toán lọc hiện tại, được đo bằng hertz (Hz).

Giá trị mặc định của nó là `350`, với phạm vi danh định từ `10` đến [tần số Nyquist](https://en.wikipedia.org/wiki/Nyquist_frequency) — tức bằng một nửa tốc độ lấy mẫu.

## Giá trị

Một {{domxref("AudioParam")}}.

> [!NOTE]
> Mặc dù `AudioParam` được trả về là chỉ đọc, giá trị mà nó biểu diễn thì không phải.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản của một AudioContext để tạo một nút bộ lọc Biquad.
Để xem ví dụ hoạt động hoàn chỉnh, hãy xem bản minh họa [voice-change-o-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi (đồng thời xem cả [mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic)).

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
