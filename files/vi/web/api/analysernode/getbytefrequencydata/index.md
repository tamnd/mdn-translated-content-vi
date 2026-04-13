---
title: "AnalyserNode: phương thức getByteFrequencyData()"
short-title: getByteFrequencyData()
slug: Web/API/AnalyserNode/getByteFrequencyData
page-type: web-api-instance-method
browser-compat: api.AnalyserNode.getByteFrequencyData
---

{{APIRef("Web Audio API")}}

Phương thức **`getByteFrequencyData()`** của giao diện {{domxref("AnalyserNode")}} sao chép dữ liệu tần số hiện tại vào một mảng {{jsxref("Uint8Array")}} (mảng byte không dấu) được truyền vào.

Dữ liệu tần số được tạo thành từ các số nguyên trên thang từ 0 đến 255.

Mỗi phần tử trong mảng biểu diễn giá trị decibel của một tần số cụ thể. Các tần số được trải đều tuyến tính từ 0 đến một nửa tần số lấy mẫu. Ví dụ, với tần số lấy mẫu `48000`, phần tử cuối cùng của mảng sẽ biểu diễn giá trị decibel cho `24000` Hz.

Nếu mảng có ít phần tử hơn {{domxref("AnalyserNode.frequencyBinCount")}}, các phần tử thừa sẽ bị bỏ qua. Nếu mảng có nhiều phần tử hơn mức cần thiết, các phần tử thừa sẽ bị bỏ qua.

## Cú pháp

```js-nolint
getByteFrequencyData(array)
```

### Tham số

- `array`
  - : Mảng {{jsxref("Uint8Array")}} mà dữ liệu miền tần số sẽ được sao chép vào.
    Nếu mảng có ít phần tử hơn {{domxref("AnalyserNode.frequencyBinCount")}}, các phần tử thừa sẽ bị bỏ qua. Nếu mảng có nhiều phần tử hơn mức cần thiết, các phần tử thừa sẽ bị bỏ qua.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo `AnalyserNode`, rồi dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu tần số và vẽ đầu ra kiểu "winamp bar graph" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết đoạn mã liên quan).

```js
const audioCtx = new AudioContext();

// Tạo nguồn âm thanh
// Ở đây chúng ta dùng một tệp âm thanh, nhưng cũng có thể là đầu vào từ microphone, v.v.
const audioEle = new Audio();
audioEle.src = "my-audio.mp3"; // Chèn tên tệp tại đây
audioEle.autoplay = true;
audioEle.preload = "auto";
const audioSourceNode = audioCtx.createMediaElementSource(audioEle);

// Tạo nút phân tích
const analyserNode = audioCtx.createAnalyser();
analyserNode.fftSize = 256;
const bufferLength = analyserNode.frequencyBinCount;
const dataArray = new Float32Array(bufferLength);

// Thiết lập mạng nút âm thanh
audioSourceNode.connect(analyserNode);
analyserNode.connect(audioCtx.destination);

// Tạo canvas 2D
const canvas = document.createElement("canvas");
canvas.style.position = "absolute";
canvas.style.top = "0";
canvas.style.left = "0";
canvas.width = window.innerWidth;
canvas.height = window.innerHeight;
document.body.appendChild(canvas);
const canvasCtx = canvas.getContext("2d");
canvasCtx.clearRect(0, 0, canvas.width, canvas.height);

function draw() {
  // Lên lịch cho lần vẽ lại tiếp theo
  requestAnimationFrame(draw);

  // Lấy dữ liệu phổ
  analyserNode.getFloatFrequencyData(dataArray);

  // Vẽ nền đen
  canvasCtx.fillStyle = "rgb(0 0 0)";
  canvasCtx.fillRect(0, 0, canvas.width, canvas.height);

  // Vẽ phổ
  const barWidth = (canvas.width / bufferLength) * 2.5;
  let posX = 0;
  for (let i = 0; i < bufferLength; i++) {
    const barHeight = (dataArray[i] + 140) * 2;
    canvasCtx.fillStyle = `rgb(${Math.floor(barHeight + 100)} 50 50)`;
    canvasCtx.fillRect(
      posX,
      canvas.height - barHeight / 2,
      barWidth,
      barHeight / 2,
    );
    posX += barWidth + 1;
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
