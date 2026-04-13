---
title: "AnalyserNode: thuộc tính smoothingTimeConstant"
short-title: smoothingTimeConstant
slug: Web/API/AnalyserNode/smoothingTimeConstant
page-type: web-api-instance-property
browser-compat: api.AnalyserNode.smoothingTimeConstant
---

{{APIRef("Web Audio API")}}

Thuộc tính **`smoothingTimeConstant`** của giao diện {{domxref("AnalyserNode")}} là một giá trị `double` biểu diễn hằng số trung bình với khung phân tích gần nhất. Về cơ bản, nó là giá trị trung bình giữa bộ đệm hiện tại và bộ đệm gần nhất mà `AnalyserNode` đã xử lý, và tạo ra sự thay đổi giá trị mượt hơn theo thời gian.

## Giá trị

Một giá trị `double` trong khoảng từ `0` đến `1` (`0` nghĩa là không làm trung bình theo thời gian). Giá trị mặc định là `0.8`.

Nếu đặt là 0, sẽ không có quá trình trung bình nào được thực hiện; còn nếu đặt là 1 thì nghĩa là "chồng lấn rất nhiều giữa bộ đệm trước và bộ đệm hiện tại khi tính toán giá trị", điều này về cơ bản làm mượt các thay đổi giữa các lần gọi {{domxref("AnalyserNode.getFloatFrequencyData")}}/{{domxref("AnalyserNode.getByteFrequencyData")}}.

Về mặt kỹ thuật, chúng ta áp dụng một cửa sổ [Blackman window](https://webaudio.github.io/web-audio-api/#blackman-window) và làm mượt các giá trị theo thời gian. Giá trị mặc định là đủ tốt cho hầu hết trường hợp.

> [!NOTE]
> Nếu đặt một giá trị ngoài khoảng 0-1, một ngoại lệ `INDEX_SIZE_ERR` sẽ được ném ra.

## Ví dụ

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo `AnalyserNode`, rồi dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu tần số và vẽ đầu ra kiểu "winamp bar graph" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết đoạn mã liên quan).

Nếu bạn tò mò về hiệu ứng của `smoothingTimeConstant()`, hãy thử sao chép ví dụ trên và đặt `analyser.smoothingTimeConstant = 0;` thay thế. Bạn sẽ thấy các thay đổi giá trị trở nên giật hơn nhiều.

```js
const audioCtx = new AudioContext();
const analyser = audioCtx.createAnalyser();
analyser.minDecibels = -90;
analyser.maxDecibels = -10;
analyser.smoothingTimeConstant = 0.85;

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
