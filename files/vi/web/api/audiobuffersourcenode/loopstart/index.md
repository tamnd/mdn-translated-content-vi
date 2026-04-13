---
title: "AudioBufferSourceNode: thuộc tính loopStart"
short-title: loopStart
slug: Web/API/AudioBufferSourceNode/loopStart
page-type: web-api-instance-property
browser-compat: api.AudioBufferSourceNode.loopStart
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`loopStart`** của giao diện {{domxref("AudioBufferSourceNode")}} là một giá trị dấu phẩy động cho biết, tính bằng giây, tại vị trí nào trong {{domxref("AudioBuffer")}} việc phát lại phải khởi động lại.

Giá trị mặc định của thuộc tính `loopStart` là `0`.

## Giá trị

Một số dấu phẩy động cho biết độ lệch, tính bằng giây, trong bộ đệm âm thanh mà tại đó mỗi vòng lặp nên bắt đầu trong khi phát. Giá trị này chỉ được dùng khi tham số {{domxref("AudioBufferSourceNode.loop", "loop")}} là `true`.

## Ví dụ

### Thiết lập `loopStart`

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
