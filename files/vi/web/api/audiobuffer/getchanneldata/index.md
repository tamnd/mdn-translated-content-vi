---
title: "AudioBuffer: phương thức getChannelData()"
short-title: getChannelData()
slug: Web/API/AudioBuffer/getChannelData
page-type: web-api-instance-method
browser-compat: api.AudioBuffer.getChannelData
---

{{ APIRef("Web Audio API") }}

Phương thức **`getChannelData()`** của giao diện {{ domxref("AudioBuffer") }} trả về một {{jsxref("Float32Array")}} chứa dữ liệu PCM liên kết với kênh được xác định bởi tham số `channel` (trong đó 0 biểu thị kênh đầu tiên).

## Cú pháp

```js-nolint
getChannelData(channel)
```

### Tham số

- `channel`
  - : Thuộc tính kênh là một chỉ mục biểu diễn kênh cụ thể cần lấy dữ liệu. Giá trị chỉ mục 0 biểu diễn kênh đầu tiên. Nếu giá trị chỉ mục `channel` lớn hơn hoặc bằng {{domxref("AudioBuffer.numberOfChannels")}}, một ngoại lệ `INDEX_SIZE_ERR` sẽ được ném ra.

### Giá trị trả về

Một {{jsxref("Float32Array")}}.

## Ví dụ

Trong ví dụ sau, chúng ta tạo một bộ đệm dài hai giây, điền vào đó nhiễu trắng, rồi phát nó thông qua một {{ domxref("AudioBufferSourceNode") }}. Các chú thích giải thích rõ điều gì đang diễn ra. Bạn cũng có thể [chạy mã trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples).

```js
const audioCtx = new AudioContext();
const button = document.querySelector("button");
const pre = document.querySelector("pre");
const myScript = document.querySelector("script");

pre.textContent = myScript.textContent;

// Stereo
const channels = 2;
// Tạo một bộ đệm stereo rỗng dài hai giây theo
// tần số lấy mẫu của AudioContext
const frameCount = audioCtx.sampleRate * 2.0;

const myArrayBuffer = audioCtx.createBuffer(2, frameCount, audioCtx.sampleRate);

button.onclick = () => {
  // Điền nhiễu trắng vào bộ đệm;
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
  // Đây là AudioNode dùng khi chúng ta muốn phát một AudioBuffer
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

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
