---
title: "AudioBufferSourceNode: thuộc tính playbackRate"
short-title: playbackRate
slug: Web/API/AudioBufferSourceNode/playbackRate
page-type: web-api-instance-property
browser-compat: api.AudioBufferSourceNode.playbackRate
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`playbackRate`** của giao diện {{ domxref("AudioBufferSourceNode") }} là một {{domxref("AudioParam")}} [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) xác định tốc độ mà tài nguyên âm thanh sẽ được phát.

Giá trị 1.0 cho biết âm thanh sẽ được phát với cùng tốc độ như tốc độ lấy mẫu của nó, các giá trị nhỏ hơn 1.0 khiến âm thanh phát chậm hơn, trong khi các giá trị lớn hơn 1.0 khiến âm thanh phát nhanh hơn bình thường. Giá trị mặc định là `1.0`. Khi được đặt thành một giá trị khác, `AudioBufferSourceNode` sẽ lấy mẫu lại âm thanh trước khi gửi nó tới đầu ra.

## Giá trị

Một {{domxref("AudioParam")}} mà {{domxref("AudioParam.value", "value")}} của nó là một giá trị dấu phẩy động cho biết tốc độ phát âm thanh dưới dạng tỷ lệ thập phân so với tốc độ lấy mẫu gốc.

Hãy xét một bộ đệm âm thanh chứa âm thanh được lấy mẫu ở 44,1 kHz (44.100 mẫu mỗi giây). Dưới đây là tác động của một vài giá trị `playbackRate`:

- `playbackRate` bằng 1.0 phát âm thanh ở tốc độ đầy đủ, hay 44.100 Hz.
- `playbackRate` bằng 0.5 phát âm thanh ở nửa tốc độ, hay 22.050 Hz.
- `playbackRate` bằng 2.0 nhân đôi tốc độ phát âm thanh lên 88.200 Hz.

## Ví dụ

### Thiết lập `playbackRate`

Trong ví dụ này, khi người dùng nhấn "Play", chúng ta tải một bản âm thanh, giải mã nó và đưa nó vào một {{domxref("AudioBufferSourceNode")}}.

Ví dụ sau đó đặt thuộc tính `loop` thành `true`, để bản âm thanh lặp lại, rồi phát bản âm thanh.

Người dùng có thể đặt thuộc tính `playbackRate` bằng [điều khiển phạm vi](/en-US/docs/Web/HTML/Reference/Elements/input/range).

> [!NOTE]
> Bạn có thể [chạy ví dụ đầy đủ trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer-source-node/playbackrate/) (hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/audio-buffer-source-node/playbackrate).)

```js
let audioCtx;
let buffer;
let source;

const play = document.getElementById("play");
const stop = document.getElementById("stop");

const playbackControl = document.getElementById("playback-rate-control");
const playbackValue = document.getElementById("playback-rate-value");

async function loadAudio() {
  try {
    // Load an audio file
    const response = await fetch("rnb-lofi-melody-loop.wav");
    // Decode it
    buffer = await audioCtx.decodeAudioData(await response.arrayBuffer());
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
  source.playbackRate.value = playbackControl.value;
  source.start();
  play.disabled = true;
  stop.disabled = false;
  playbackControl.disabled = false;
});

stop.addEventListener("click", () => {
  source.stop();
  play.disabled = false;
  stop.disabled = true;
  playbackControl.disabled = true;
});

playbackControl.oninput = () => {
  source.playbackRate.value = playbackControl.value;
  playbackValue.textContent = playbackControl.value;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
