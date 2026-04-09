---
title: "AudioBufferSourceNode: thuộc tính buffer"
short-title: buffer
slug: Web/API/AudioBufferSourceNode/buffer
page-type: web-api-instance-property
browser-compat: api.AudioBufferSourceNode.buffer
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`buffer`** của giao diện {{domxref("AudioBufferSourceNode")}} cung cấp khả năng phát lại âm thanh bằng cách sử dụng một {{domxref("AudioBuffer")}} làm nguồn dữ liệu âm thanh.

Nếu thuộc tính `buffer` được đặt thành giá trị `null`, nút sẽ tạo ra một kênh duy nhất chứa sự im lặng (tức là mọi mẫu đều bằng 0).

## Giá trị

Một {{domxref("AudioBuffer")}} chứa dữ liệu biểu diễn âm thanh mà nút sẽ phát.

## Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `buffer` đã được đặt thành một giá trị khác `null`, rồi lại tiếp tục được đặt thành một giá trị khác `null` lần nữa.

## Ví dụ

> [!NOTE]
> Để xem một ví dụ hoạt động hoàn chỉnh, hãy xem [mã này chạy trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/audio-buffer/index.html).

```js
const myArrayBuffer = audioCtx.createBuffer(2, frameCount, audioCtx.sampleRate);

button.onclick = () => {
  // Fill the buffer with white noise;
  // just random values between -1.0 and 1.0
  for (let channel = 0; channel < channels; channel++) {
    // This gives us the actual ArrayBuffer that contains the data
    const nowBuffering = myArrayBuffer.getChannelData(channel);
    for (let i = 0; i < frameCount; i++) {
      // Math.random() is in [0; 1.0]
      // audio needs to be in [-1.0; 1.0]
      nowBuffering[i] = Math.random() * 2 - 1;
    }
  }

  // Get an AudioBufferSourceNode.
  // This is the AudioNode to use when we want to play an AudioBuffer
  const source = audioCtx.createBufferSource();
  // set the buffer in the AudioBufferSourceNode
  source.buffer = myArrayBuffer;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
