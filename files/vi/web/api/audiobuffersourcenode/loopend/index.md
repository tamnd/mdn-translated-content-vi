---
title: "AudioBufferSourceNode: thuộc tính loopEnd"
short-title: loopEnd
slug: Web/API/AudioBufferSourceNode/loopEnd
page-type: web-api-instance-property
browser-compat: api.AudioBufferSourceNode.loopEnd
---

{{ APIRef("Web Audio API") }}

Thuộc tính `loopEnd` của giao diện {{ domxref("AudioBufferSourceNode") }} là một số dấu phẩy động chỉ định, theo giây, tại độ lệch nào trong quá trình phát {{domxref("AudioBuffer")}} thì việc phát nên lặp trở lại thời điểm được chỉ ra bởi thuộc tính {{domxref("AudioBufferSourceNode.loopStart", "loopStart")}}. Thuộc tính này chỉ được dùng nếu thuộc tính {{domxref("AudioBufferSourceNode.loop", "loop")}} là `true`.

## Giá trị

Một số dấu phẩy động cho biết độ lệch, tính bằng giây, trong bộ đệm âm thanh mà tại đó mỗi vòng lặp sẽ quay lại điểm bắt đầu của vòng lặp (tức là thời gian phát hiện tại được đặt lại thành {{domxref("AudioBufferSourceNode.loopStart")}}). Thuộc tính này chỉ được dùng nếu thuộc tính {{domxref("AudioBufferSourceNode.loop", "loop")}} là `true`.

Giá trị mặc định là 0.

## Ví dụ

### Thiết lập `loopEnd`

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

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
