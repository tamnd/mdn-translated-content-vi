---
title: "AnalyserNode: thuộc tính fftSize"
short-title: fftSize
slug: Web/API/AnalyserNode/fftSize
page-type: web-api-instance-property
browser-compat: api.AnalyserNode.fftSize
---

{{APIRef("Web Audio API")}}

Thuộc tính **`fftSize`** của giao diện {{domxref("AnalyserNode")}} là một giá trị `unsigned long` và biểu diễn kích thước cửa sổ tính bằng số mẫu được dùng khi thực hiện [Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform) (FFT) để lấy dữ liệu miền tần số.

## Giá trị

Một số nguyên không dấu, biểu diễn kích thước cửa sổ của FFT, tính bằng số mẫu. Giá trị lớn hơn sẽ cho nhiều chi tiết hơn trong miền tần số nhưng ít chi tiết hơn trong miền biên độ.

Phải là lũy thừa của 2 trong khoảng từ 2^5 đến 2^15, tức một trong các giá trị sau: `32`, `64`, `128`, `256`, `512`, `1024`, `2048`, `4096`, `8192`, `16384`, và `32768`. Mặc định là `2048`.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị đặt vào không phải là lũy thừa của 2 hoặc nằm ngoài phạm vi cho phép.

## Ví dụ

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo `AnalyserNode`, rồi dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu miền thời gian và vẽ đầu ra kiểu "dao động ký" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết đoạn mã liên quan).

```js
const audioCtx = new AudioContext();
const analyser = audioCtx.createAnalyser();

// …

analyser.fftSize = 2048;
const bufferLength = analyser.frequencyBinCount;
const dataArray = new Uint8Array(bufferLength);
analyser.getByteTimeDomainData(dataArray);

// vẽ một dao động ký của nguồn âm thanh hiện tại

function draw() {
  drawVisual = requestAnimationFrame(draw);

  analyser.getByteTimeDomainData(dataArray);

  canvasCtx.fillStyle = "rgb(200 200 200)";
  canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);

  canvasCtx.lineWidth = 2;
  canvasCtx.strokeStyle = "rgb(0 0 0)";

  canvasCtx.beginPath();

  const sliceWidth = (WIDTH * 1.0) / bufferLength;
  let x = 0;

  for (let i = 0; i < bufferLength; i++) {
    const v = dataArray[i] / 128.0;
    const y = (v * HEIGHT) / 2;

    if (i === 0) {
      canvasCtx.moveTo(x, y);
    } else {
      canvasCtx.lineTo(x, y);
    }

    x += sliceWidth;
  }

  canvasCtx.lineTo(canvas.width, canvas.height / 2);
  canvasCtx.stroke();
}

draw();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
