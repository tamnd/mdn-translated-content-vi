---
title: "BaseAudioContext: phương thức createAnalyser()"
short-title: createAnalyser()
slug: Web/API/BaseAudioContext/createAnalyser
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createAnalyser
---

{{APIRef("Web Audio API")}}

Phương thức `createAnalyser()` của giao diện
{{domxref("BaseAudioContext")}} tạo ra một {{domxref("AnalyserNode")}}, có thể
dùng để phơi bày dữ liệu âm thanh theo miền thời gian và tần số, cũng như tạo trực quan hóa dữ liệu.

> [!NOTE]
> Hàm dựng {{domxref("AnalyserNode.AnalyserNode", "AnalyserNode()")}} là cách được
> khuyến nghị để tạo một {{domxref("AnalyserNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

> [!NOTE]
> Để biết thêm về cách sử dụng node này, hãy xem trang
> {{domxref("AnalyserNode")}}.

## Cú pháp

```js-nolint
createAnalyser()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("AnalyserNode")}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản của một AudioContext để tạo một node phân tích, rồi dùng `requestAnimationFrame()` để lặp lại việc thu thập dữ liệu miền thời gian và vẽ đầu ra kiểu "dao động ký" của đầu vào âm thanh hiện tại. Để xem ví dụ/thông tin ứng dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi (xem
[app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết phần mã liên quan).

```js
const audioCtx = new AudioContext();
const analyser = audioCtx.createAnalyser();

// …

analyser.fftSize = 2048;
const bufferLength = analyser.frequencyBinCount;
const dataArray = new Uint8Array(bufferLength);
analyser.getByteTimeDomainData(dataArray);

// vẽ dao động ký của nguồn âm thanh hiện tại

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

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
