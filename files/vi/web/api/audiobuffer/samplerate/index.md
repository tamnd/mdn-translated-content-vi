---
title: "AudioBuffer: thuộc tính sampleRate"
short-title: sampleRate
slug: Web/API/AudioBuffer/sampleRate
page-type: web-api-instance-property
browser-compat: api.AudioBuffer.sampleRate
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`sampleRate`** của giao diện {{domxref("AudioBuffer")}} trả về một số thực biểu diễn tần số lấy mẫu, tính theo số mẫu trên giây, của dữ liệu PCM được lưu trong bộ đệm.

## Giá trị

Một giá trị dấu chấm động cho biết tần số lấy mẫu hiện tại của dữ liệu trong bộ đệm, tính theo số mẫu trên giây.

## Ví dụ

```js
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

  console.log(myArrayBuffer.sampleRate);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
