---
title: "AnalyserNode: phương thức getFloatTimeDomainData()"
short-title: getFloatTimeDomainData()
slug: Web/API/AnalyserNode/getFloatTimeDomainData
page-type: web-api-instance-method
browser-compat: api.AnalyserNode.getFloatTimeDomainData
---

{{APIRef("Web Audio API")}}

Phương thức **`getFloatTimeDomainData()`** của giao diện {{domxref("AnalyserNode")}} sao chép dữ liệu dạng sóng hiện tại, hay dữ liệu miền thời gian, vào một mảng {{jsxref("Float32Array")}} được truyền vào. Mỗi giá trị trong mảng là một _mẫu_, tức độ lớn của tín hiệu tại một thời điểm cụ thể.

Dạng sóng được biểu diễn dưới dạng dữ liệu PCM, có khoảng giá trị danh định từ -1.0 đến 1.0, nhưng các giá trị có thể vượt ra ngoài khoảng này, chẳng hạn khi down-mixing stereo sang mono.

## Cú pháp

```js-nolint
getFloatTimeDomainData(array)
```

### Tham số

- `array`
  - : Mảng {{jsxref("Float32Array")}} mà dữ liệu miền thời gian sẽ được sao chép vào.
    Nếu mảng có ít phần tử hơn {{domxref("AnalyserNode.fftSize")}}, các phần tử thừa sẽ bị bỏ qua. Nếu mảng có nhiều phần tử hơn mức cần thiết, các phần tử thừa sẽ bị bỏ qua.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo `AnalyserNode`, rồi dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu miền thời gian và vẽ đầu ra kiểu "dao động ký" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết đoạn mã liên quan).

```js
const audioCtx = new AudioContext();
const analyser = audioCtx.createAnalyser();

// …

analyser.fftSize = 1024;
const bufferLength = analyser.fftSize;
console.log(bufferLength);
const dataArray = new Float32Array(bufferLength);

canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);

function draw() {
  drawVisual = requestAnimationFrame(draw);
  analyser.getFloatTimeDomainData(dataArray);

  canvasCtx.fillStyle = "rgb(200 200 200)";
  canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);
  canvasCtx.lineWidth = 2;
  canvasCtx.strokeStyle = "rgb(0 0 0)";
  canvasCtx.beginPath();

  const sliceWidth = (WIDTH * 1.0) / bufferLength;
  let x = 0;

  for (let i = 0; i < bufferLength; i++) {
    const v = dataArray[i] * 200.0;
    const y = HEIGHT / 2 + v;

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
