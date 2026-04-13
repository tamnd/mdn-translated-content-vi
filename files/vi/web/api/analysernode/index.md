---
title: AnalyserNode
slug: Web/API/AnalyserNode
page-type: web-api-interface
browser-compat: api.AnalyserNode
---

{{APIRef("Web Audio API")}}

Giao diện **`AnalyserNode`** biểu diễn một nút có thể cung cấp thông tin phân tích tần số và miền thời gian theo thời gian thực. Đây là một {{domxref("AudioNode")}} truyền luồng âm thanh từ đầu vào đến đầu ra mà không thay đổi, nhưng cho phép bạn lấy dữ liệu được tạo ra, xử lý nó, và tạo các hình ảnh trực quan cho âm thanh.

`AnalyserNode` có đúng một đầu vào và một đầu ra. Nút vẫn hoạt động ngay cả khi đầu ra không được kết nối.

![Không làm thay đổi luồng âm thanh, nút cho phép lấy dữ liệu tần số và miền thời gian gắn với nó bằng FFT.](fttaudiodata_en.svg)

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>1</code> (nhưng có thể để không kết nối)</td>
    </tr>
    <tr>
      <th scope="row">Chế độ số kênh</th>
      <td><code>"max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Bộ khởi tạo

- {{domxref("AnalyserNode.AnalyserNode", "AnalyserNode()")}}
  - : Tạo một thể hiện mới của đối tượng `AnalyserNode`.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ lớp cha {{domxref("AudioNode")}}._

- {{domxref("AnalyserNode.fftSize")}}
  - : Một giá trị `unsigned long` biểu diễn kích thước của FFT ([Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform)) dùng để xác định miền tần số.
- {{domxref("AnalyserNode.frequencyBinCount")}} {{ReadOnlyInline}}
  - : Một giá trị `unsigned long` bằng một nửa kích thước FFT. Về cơ bản, đây là số lượng giá trị dữ liệu mà bạn có thể dùng cho phần hiển thị trực quan.
- {{domxref("AnalyserNode.minDecibels")}}
  - : Một giá trị `double` biểu diễn giá trị công suất nhỏ nhất trong khoảng tỉ lệ cho dữ liệu phân tích FFT, để chuyển sang giá trị byte không dấu. Nói cách khác, thuộc tính này xác định giá trị nhỏ nhất của dải kết quả khi dùng `getByteFrequencyData()`.
- {{domxref("AnalyserNode.maxDecibels")}}
  - : Một giá trị `double` biểu diễn giá trị công suất lớn nhất trong khoảng tỉ lệ cho dữ liệu phân tích FFT, để chuyển sang giá trị byte không dấu. Nói cách khác, thuộc tính này xác định giá trị lớn nhất của dải kết quả khi dùng `getByteFrequencyData()`.
- {{domxref("AnalyserNode.smoothingTimeConstant")}}
  - : Một giá trị `double` biểu diễn hằng số trung bình với khung phân tích gần nhất. Nói cách khác, nó giúp các thay đổi giá trị theo thời gian trở nên mượt hơn.

## Phương thức thể hiện

_Kế thừa các phương thức từ lớp cha {{domxref("AudioNode")}}._

- {{domxref("AnalyserNode.getFloatFrequencyData()")}}
  - : Sao chép dữ liệu tần số hiện tại vào một mảng {{jsxref("Float32Array")}} được truyền vào.
- {{domxref("AnalyserNode.getByteFrequencyData()")}}
  - : Sao chép dữ liệu tần số hiện tại vào một mảng {{jsxref("Uint8Array")}} (mảng byte không dấu) được truyền vào.
- {{domxref("AnalyserNode.getFloatTimeDomainData()")}}
  - : Sao chép dạng sóng hiện tại, hay dữ liệu miền thời gian, vào một mảng {{jsxref("Float32Array")}} được truyền vào.
- {{domxref("AnalyserNode.getByteTimeDomainData()")}}
  - : Sao chép dạng sóng hiện tại, hay dữ liệu miền thời gian, vào một mảng {{jsxref("Uint8Array")}} (mảng byte không dấu) được truyền vào.

## Ví dụ

> [!NOTE]
> Xem hướng dẫn [Trực quan hóa với Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Visualizations_with_Web_Audio_API) để biết thêm thông tin về cách tạo các hình ảnh trực quan cho âm thanh.

### Dùng cơ bản

Ví dụ sau minh họa cách dùng cơ bản của {{domxref("AudioContext")}} để tạo một `AnalyserNode`, sau đó dùng {{domxref("window.requestAnimationFrame()","requestAnimationFrame")}} và {{htmlelement("canvas")}} để liên tục thu thập dữ liệu miền thời gian và vẽ đầu ra kiểu "dao động ký" của đầu vào âm thanh hiện tại.
Để xem các ví dụ và thông tin áp dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết đoạn mã liên quan).

```js
const audioCtx = new AudioContext();

// …

const analyser = audioCtx.createAnalyser();
analyser.fftSize = 2048;

const bufferLength = analyser.frequencyBinCount;
const dataArray = new Uint8Array(bufferLength);
analyser.getByteTimeDomainData(dataArray);

// Kết nối nguồn cần được phân tích
source.connect(analyser);

// Lấy canvas đã được định nghĩa với ID "oscilloscope"
const canvas = document.getElementById("oscilloscope");
const canvasCtx = canvas.getContext("2d");

// vẽ một dao động ký của nguồn âm thanh hiện tại

function draw() {
  requestAnimationFrame(draw);

  analyser.getByteTimeDomainData(dataArray);

  canvasCtx.fillStyle = "rgb(200 200 200)";
  canvasCtx.fillRect(0, 0, canvas.width, canvas.height);

  canvasCtx.lineWidth = 2;
  canvasCtx.strokeStyle = "rgb(0 0 0)";

  canvasCtx.beginPath();

  const sliceWidth = (canvas.width * 1.0) / bufferLength;
  let x = 0;

  for (let i = 0; i < bufferLength; i++) {
    const v = dataArray[i] / 128.0;
    const y = (v * canvas.height) / 2;

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
