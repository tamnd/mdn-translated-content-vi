---
title: "AudioBufferSourceNode: thuộc tính loop"
short-title: loop
slug: Web/API/AudioBufferSourceNode/loop
page-type: web-api-instance-property
browser-compat: api.AudioBufferSourceNode.loop
---

{{ APIRef("Web Audio API") }}

Thuộc tính `loop` của giao diện {{ domxref("AudioBufferSourceNode") }} là một giá trị Boolean cho biết tài nguyên âm thanh có phải được phát lại khi tới cuối {{domxref("AudioBuffer")}} hay không.

Giá trị mặc định của thuộc tính `loop` là `false`.

## Giá trị

Một giá trị Boolean có giá trị `true` nếu chế độ lặp được bật; nếu không thì giá trị là `false`.

Khi chế độ lặp được bật, âm thanh bắt đầu phát tại thời điểm được chỉ định là điểm bắt đầu khi {{domxref("AudioBufferSourceNode.start", "start()")}} được gọi. Khi tới thời điểm được chỉ định bởi thuộc tính {{domxref("AudioBufferSourceNode.loopEnd", "loopEnd")}}, việc phát sẽ tiếp tục tại thời điểm được chỉ định bởi {{domxref("AudioBufferSourceNode.loopStart", "loopStart")}}

## Ví dụ

### Thiết lập `loop`

Trong ví dụ này, khi người dùng nhấn "Play", chúng ta tải một bản âm thanh, giải mã nó và đưa nó vào một {{domxref("AudioBufferSourceNode")}}.

Ví dụ sau đó đặt thuộc tính `loop` thành `true`, để bản âm thanh lặp lại, rồi phát bản âm thanh.

Người dùng có thể đặt các thuộc tính `loopStart` và `loopEnd` bằng [điều khiển phạm vi](/en-US/docs/Web/HTML/Reference/Elements/input/range).

> [!NOTE]
> Bạn có thể [chạy ví dụ đầy đủ trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer-source-node/loop/) (hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/audio-buffer-source-node/loop).)

```js
let audioCtx;
let buffer;
let source;

const play = document.getElementById("play");
const stop = document.getElementById("stop");

const loopstartControl = document.getElementById("loopstart-control");
const loopstartValue = document.getElementById("loopstart-value");

const loopendControl = document.getElementById("loopend-control");
const loopendValue = document.getElementById("loopend-value");

async function loadAudio() {
  try {
    // Load an audio file
    const response = await fetch("rnb-lofi-melody-loop.wav");
    // Decode it
    buffer = await audioCtx.decodeAudioData(await response.arrayBuffer());
    const max = Math.floor(buffer.duration);
    loopstartControl.setAttribute("max", max);
    loopendControl.setAttribute("max", max);
  } catch (err) {
    console.error(`Unable to fetch the audio file. Error: ${err.message}`);
  }
}

play.addEventListener("click", async () => {
  if (!audioCtx) {
    audioCtx = new AudioContext();
    await loadAudio();
  }
  source = audioCtx.createBufferSource();
  source.buffer = buffer;
  source.connect(audioCtx.destination);
  source.loop = true;
  source.loopStart = loopstartControl.value;
  source.loopEnd = loopendControl.value;
  source.start();
  play.disabled = true;
  stop.disabled = false;
  loopstartControl.disabled = false;
  loopendControl.disabled = false;
});

stop.addEventListener("click", () => {
  source.stop();
  play.disabled = false;
  stop.disabled = true;
  loopstartControl.disabled = true;
  loopendControl.disabled = true;
});

loopstartControl.addEventListener("input", () => {
  source.loopStart = loopstartControl.value;
  loopstartValue.textContent = loopstartControl.value;
});

loopendControl.addEventListener("input", () => {
  source.loopEnd = loopendControl.value;
  loopendValue.textContent = loopendControl.value;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioBufferSourceNode")}}
