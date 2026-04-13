---
title: OscillatorNode
slug: Web/API/OscillatorNode
page-type: web-api-interface
browser-compat: api.OscillatorNode
---

{{APIRef("Web Audio API")}}

Giao diện **`OscillatorNode`** đại diện cho một dạng sóng tuần hoàn, chẳng hạn như sóng sine. Đây là một mô-đun xử lý âm thanh {{domxref("AudioScheduledSourceNode")}} tạo ra tần số của sóng nhất định, thực chất là một âm thanh liên tục.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ đếm kênh</th>
      <td><code>max</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td><code>2</code> (không dùng trong chế độ đếm mặc định)</td>
    </tr>
    <tr>
      <th scope="row">Giải thích kênh</th>
      <td><code>speakers</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("OscillatorNode.OscillatorNode", "OscillatorNode()")}}
  - : Tạo một đối tượng `OscillatorNode` mới, tùy chọn cung cấp một đối tượng chỉ định giá trị mặc định cho các [thuộc tính](#thuộc_tính_phiên_bản) của nút. Thay thế, bạn có thể dùng phương thức factory {{domxref("BaseAudioContext.createOscillator()")}}; xem [Tạo AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ đối tượng cha, {{domxref("AudioScheduledSourceNode")}}._

- {{domxref("OscillatorNode.frequency")}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho tần số dao động tính bằng hertz (mặc dù `AudioParam` trả về là chỉ đọc, giá trị mà nó đại diện thì không). Giá trị mặc định là 440 Hz (nốt La trung bình).
- {{domxref("OscillatorNode.detune")}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho độ chỉnh âm của dao động tính bằng cents (mặc dù `AudioParam` trả về là chỉ đọc, giá trị mà nó đại diện thì không). Giá trị mặc định là 0.
- {{domxref("OscillatorNode.type")}}
  - : Một chuỗi chỉ định hình dạng dạng sóng để phát; đây có thể là một trong số các giá trị tiêu chuẩn, hoặc `custom` để dùng {{domxref("PeriodicWave")}} mô tả dạng sóng tùy chỉnh. Các dạng sóng khác nhau sẽ tạo ra âm thanh khác nhau. Các giá trị tiêu chuẩn là `"sine"`, `"square"`, `"sawtooth"`, `"triangle"` và `"custom"`. Mặc định là `"sine"`.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ đối tượng cha, {{domxref("AudioScheduledSourceNode")}}._

- {{domxref("OscillatorNode.setPeriodicWave()")}}
  - : Đặt {{domxref("PeriodicWave")}} mô tả dạng sóng tuần hoàn để dùng thay vì một trong các dạng sóng tiêu chuẩn; gọi hàm này sẽ đặt `type` thành `custom`.
- {{domxref("AudioScheduledSourceNode.start()")}}
  - : Chỉ định thời điểm chính xác để bắt đầu phát âm thanh.
- {{domxref("AudioScheduledSourceNode.stop()")}}
  - : Chỉ định thời điểm để dừng phát âm thanh.

## Sự kiện

_Cũng kế thừa các sự kiện từ đối tượng cha, {{domxref("AudioScheduledSourceNode")}}._

## Ví dụ

### Sử dụng OscillatorNode

Ví dụ dưới đây cho thấy cách sử dụng cơ bản của {{domxref("AudioContext")}} để tạo oscillator node và bắt đầu phát âm thanh trên nó. Để xem ví dụ được áp dụng, hãy xem [Violent Theremin demo](https://mdn.github.io/webaudio-examples/violent-theremin/) ([xem app.js](https://github.com/mdn/webaudio-examples/blob/main/violent-theremin/scripts/app.js) để biết mã liên quan).

```js
// create web audio api context
const audioCtx = new AudioContext();

// create Oscillator node
const oscillator = audioCtx.createOscillator();

oscillator.type = "square";
oscillator.frequency.setValueAtTime(440, audioCtx.currentTime); // value in hertz
oscillator.connect(audioCtx.destination);
oscillator.start();
```

### Các loại oscillator node khác nhau

Bốn loại oscillator [types](/en-US/docs/Web/API/OscillatorNode/type) tích hợp là `sine`, `square`, `triangle` và `sawtooth`. Chúng là hình dạng của dạng sóng được tạo ra bởi oscillator. Thực tế thú vị: Đây là các giá trị mặc định cho hầu hết các synth vì chúng là các dạng sóng dễ tạo ra về mặt điện tử. Ví dụ này trực quan hóa các dạng sóng cho các loại khác nhau ở các tần số khác nhau.

```html
<div class="controls">
  <label for="type-select">
    Oscillator type
    <select id="type-select">
      <option>sine</option>
      <option>square</option>
      <option>triangle</option>
      <option>sawtooth</option>
    </select>
  </label>

  <label for="freq-range">
    Frequency
    <input
      type="range"
      min="100"
      max="800"
      step="10"
      value="250"
      id="freq-range" />
  </label>
  <button data-playing="init" id="play-button">Play</button>
</div>

<canvas id="wave-graph"></canvas>
```

```css hidden
.controls {
  display: flex;
  gap: 1rem;
  margin: 1rem 0;
  align-items: center;
}

#wave-graph {
  width: 500px;
  height: 300px;
  border: 4px solid var(--pink);
}
```

Mã gồm hai phần: trong phần đầu tiên, chúng ta thiết lập phần âm thanh.

```js
const typeSelect = document.getElementById("type-select");
const frequencyControl = document.getElementById("freq-range");
const playButton = document.getElementById("play-button");

const audioCtx = new AudioContext();
const osc = new OscillatorNode(audioCtx, {
  type: typeSelect.value,
  frequency: frequencyControl.valueAsNumber,
});
// Rather than creating a new oscillator for every start and stop
// which you would do in an audio application, we are just going
// to mute/un-mute for demo purposes - this means we need a gain node
const gain = new GainNode(audioCtx);
const analyser = new AnalyserNode(audioCtx, {
  fftSize: 1024,
  smoothingTimeConstant: 0.8,
});
osc.connect(gain).connect(analyser).connect(audioCtx.destination);

typeSelect.addEventListener("change", () => {
  osc.type = typeSelect.value;
});

frequencyControl.addEventListener("input", () => {
  osc.frequency.value = frequencyControl.valueAsNumber;
});

playButton.addEventListener("click", () => {
  if (audioCtx.state === "suspended") {
    audioCtx.resume();
  }

  if (playButton.dataset.playing === "init") {
    osc.start(audioCtx.currentTime);
    playButton.dataset.playing = "true";
    playButton.innerText = "Pause";
  } else if (playButton.dataset.playing === "false") {
    gain.gain.linearRampToValueAtTime(1, audioCtx.currentTime + 0.2);
    playButton.dataset.playing = "true";
    playButton.innerText = "Pause";
  } else if (playButton.dataset.playing === "true") {
    gain.gain.linearRampToValueAtTime(0.0001, audioCtx.currentTime + 0.2);
    playButton.dataset.playing = "false";
    playButton.innerText = "Play";
  }
});
```

Phần thứ hai, chúng ta vẽ dạng sóng trên canvas bằng cách dùng {{domxref("AnalyserNode")}} đã tạo ở trên.

```js
const dpr = window.devicePixelRatio;
const w = 500 * dpr;
const h = 300 * dpr;
const canvasEl = document.getElementById("wave-graph");
canvasEl.width = w;
canvasEl.height = h;
const canvasCtx = canvasEl.getContext("2d");

const bufferLength = analyser.frequencyBinCount;
const dataArray = new Uint8Array(bufferLength);
analyser.getByteTimeDomainData(dataArray);

// draw an oscilloscope of the current oscillator
function draw() {
  analyser.getByteTimeDomainData(dataArray);

  canvasCtx.fillStyle = "white";
  canvasCtx.fillRect(0, 0, w, h);

  canvasCtx.lineWidth = 4.0;
  canvasCtx.strokeStyle = "black";
  canvasCtx.beginPath();

  const sliceWidth = (w * 1.0) / bufferLength;
  let x = 0;

  for (let i = 0; i < bufferLength; i++) {
    const v = dataArray[i] / 128.0;
    const y = (v * h) / 2;
    if (i === 0) {
      canvasCtx.moveTo(x, y);
    } else {
      canvasCtx.lineTo(x, y);
    }
    x += sliceWidth;
  }

  canvasCtx.lineTo(w, h / 2);
  canvasCtx.stroke();

  requestAnimationFrame(draw);
}

draw();
```

> [!WARNING]
> Ví dụ này tạo ra tiếng ồn!

{{EmbedLiveSample("Different oscillator node types", "", 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
