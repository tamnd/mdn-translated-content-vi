---
title: "AnalyserNode: thuộc tính frequencyBinCount"
short-title: frequencyBinCount
slug: Web/API/AnalyserNode/frequencyBinCount
page-type: web-api-instance-property
browser-compat: api.AnalyserNode.frequencyBinCount
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`frequencyBinCount`** của giao diện {{domxref("AnalyserNode")}} chứa tổng số điểm dữ liệu có sẵn cho {{domxref("AudioContext")}} {{domxref("BaseAudioContext.sampleRate", "sampleRate")}}. Nó bằng một nửa giá trị của {{domxref("AnalyserNode.fftSize")}}. Chỉ số của hai phương thức có quan hệ tuyến tính với các tần số mà chúng biểu diễn, trong khoảng từ 0 đến [tần số Nyquist](https://en.wikipedia.org/wiki/Nyquist_frequency).

## Giá trị

Một số nguyên không dấu, bằng số giá trị mà {{domxref("AnalyserNode.getByteFrequencyData()")}} và {{domxref("AnalyserNode.getFloatFrequencyData()")}} sao chép vào `TypedArray` được cung cấp.

Vì lý do kỹ thuật liên quan đến cách [Fast Fourier transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) được định nghĩa, giá trị này luôn bằng một nửa giá trị của {{domxref("AnalyserNode.fftSize")}}. Vì vậy, nó sẽ là một trong các giá trị `16`, `32`, `64`, `128`, `256`, `512`, `1024`, `2048`, `4096`, `8192`, và `16384`.

## Ví dụ

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo `AnalyserNode`, rồi dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu tần số và vẽ đầu ra kiểu "winamp bar graph" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi.

```js
const audioCtx = new AudioContext();
const analyser = audioCtx.createAnalyser();
analyser.minDecibels = -90;
analyser.maxDecibels = -10;

// …

analyser.fftSize = 256;
const bufferLength = analyser.frequencyBinCount;
console.log(bufferLength);
const dataArray = new Uint8Array(bufferLength);

canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);

function draw() {
  drawVisual = requestAnimationFrame(draw);

  analyser.getByteFrequencyData(dataArray);

  canvasCtx.fillStyle = "rgb(0 0 0)";
  canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

  const barWidth = (WIDTH / bufferLength) * 2.5 - 1;
  let barHeight;
  let x = 0;

  for (let i = 0; i < bufferLength; i++) {
    barHeight = dataArray[i];

    canvasCtx.fillStyle = `rgb(${barHeight + 100} 50 50)`;
    canvasCtx.fillRect(x, HEIGHT - barHeight / 2, barWidth, barHeight / 2);

    x += barWidth;
  }
}

draw();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
