---
title: "AnalyserNode: thuộc tính minDecibels"
short-title: minDecibels
slug: Web/API/AnalyserNode/minDecibels
page-type: web-api-instance-property
browser-compat: api.AnalyserNode.minDecibels
---

{{APIRef("Web Audio API")}}

Thuộc tính **`minDecibels`** của giao diện {{domxref("AnalyserNode")}} là một giá trị `double` biểu diễn giá trị công suất nhỏ nhất trong khoảng tỉ lệ cho dữ liệu phân tích FFT, để chuyển sang giá trị byte không dấu. Nói cách khác, thuộc tính này xác định giá trị nhỏ nhất của dải kết quả khi dùng `getByteFrequencyData()`.

## Giá trị

Một giá trị `double`, biểu diễn giá trị [decibel](https://en.wikipedia.org/wiki/Decibel) nhỏ nhất để tỉ lệ hóa dữ liệu phân tích FFT, trong đó `0` dB là âm thanh lớn nhất có thể, `-10` dB là một phần mười của mức đó, v.v. Giá trị mặc định là `-100` dB.

Khi lấy dữ liệu từ `getByteFrequencyData()`, mọi tần số có biên độ bằng hoặc thấp hơn `minDecibels` sẽ được trả về là `0`.

> [!NOTE]
> Nếu đặt một giá trị lớn hơn `AnalyserNode.maxDecibels`, một ngoại lệ `INDEX_SIZE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo `AnalyserNode`, rồi dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu tần số và vẽ đầu ra kiểu "winamp bar graph" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết đoạn mã liên quan).

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

  const barWidth = (WIDTH / bufferLength) * 2.5;
  let barHeight;
  let x = 0;

  for (let i = 0; i < bufferLength; i++) {
    barHeight = dataArray[i];

    canvasCtx.fillStyle = `rgb(${barHeight + 100} 50 50)`;
    canvasCtx.fillRect(x, HEIGHT - barHeight / 2, barWidth, barHeight / 2);

    x += barWidth + 1;
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
