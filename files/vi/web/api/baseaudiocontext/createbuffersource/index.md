---
title: "BaseAudioContext: phương thức createBufferSource()"
short-title: createBufferSource()
slug: Web/API/BaseAudioContext/createBufferSource
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createBufferSource
---

{{ APIRef("Web Audio API") }}

Phương thức `createBufferSource()` của giao diện {{ domxref("BaseAudioContext") }}
được dùng để tạo một {{ domxref("AudioBufferSourceNode") }} mới, có thể được
dùng để phát dữ liệu âm thanh chứa trong một đối tượng {{ domxref("AudioBuffer") }}.
Các {{domxref("AudioBuffer")}} được tạo bằng {{domxref("BaseAudioContext.createBuffer")}} hoặc được trả về bởi {{domxref("BaseAudioContext.decodeAudioData")}} khi phương thức này giải mã thành công một track âm thanh.

> [!NOTE]
> Hàm dựng {{domxref("AudioBufferSourceNode.AudioBufferSourceNode", "AudioBufferSourceNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("AudioBufferSourceNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createBufferSource()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("AudioBufferSourceNode")}}.

## Ví dụ

Trong ví dụ này, chúng ta tạo một bộ đệm dài hai giây, lấp đầy nó bằng nhiễu trắng, rồi phát nó qua một {{ domxref("AudioBufferSourceNode") }}. Các chú thích sẽ giải thích rõ điều gì đang diễn ra.

> [!NOTE]
> Bạn cũng có thể [chạy mã trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer/),
> hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/audio-buffer/index.html).

```js
const audioCtx = new AudioContext();
const button = document.querySelector("button");
const pre = document.querySelector("pre");
const myScript = document.querySelector("script");

pre.textContent = myScript.textContent;

// Stereo
const channels = 2;
// Tạo một bộ đệm stereo trống dài hai giây ở
// tốc độ lấy mẫu của AudioContext
const frameCount = audioCtx.sampleRate * 2.0;

const myArrayBuffer = audioCtx.createBuffer(
  channels,
  frameCount,
  audioCtx.sampleRate,
);

button.onclick = () => {
  // Lấp đầy bộ đệm bằng nhiễu trắng;
  // chỉ là các giá trị ngẫu nhiên giữa -1.0 và 1.0
  for (let channel = 0; channel < channels; channel++) {
    // Đây là ArrayBuffer thực sự chứa dữ liệu
    const nowBuffering = myArrayBuffer.getChannelData(channel);
    for (let i = 0; i < frameCount; i++) {
      // Math.random() nằm trong [0; 1.0]
      // âm thanh cần nằm trong [-1.0; 1.0]
      nowBuffering[i] = Math.random() * 2 - 1;
    }
  }

  // Lấy một AudioBufferSourceNode.
  // Đây là AudioNode được dùng khi muốn phát một AudioBuffer
  const source = audioCtx.createBufferSource();
  // đặt bộ đệm vào AudioBufferSourceNode
  source.buffer = myArrayBuffer;
  // kết nối AudioBufferSourceNode với
  // đích để chúng ta có thể nghe thấy âm thanh
  source.connect(audioCtx.destination);
  // bắt đầu phát nguồn
  source.start();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
