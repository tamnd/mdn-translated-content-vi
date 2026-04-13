---
title: AudioBuffer
slug: Web/API/AudioBuffer
page-type: web-api-interface
browser-compat: api.AudioBuffer
---

{{APIRef("Web Audio API")}}

Giao diện **`AudioBuffer`** biểu diễn một tài nguyên âm thanh ngắn nằm trong bộ nhớ, được tạo từ tệp âm thanh bằng phương thức {{ domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()") }}, hoặc từ dữ liệu thô bằng {{ domxref("BaseAudioContext/createBuffer", "AudioContext.createBuffer()") }}. Sau khi được đặt vào `AudioBuffer`, âm thanh có thể được phát bằng cách truyền nó vào một {{ domxref("AudioBufferSourceNode") }}.

Các đối tượng kiểu này được thiết kế để chứa các đoạn âm thanh nhỏ, thường ngắn hơn 45 giây. Với các âm thanh dài hơn, những đối tượng triển khai {{domxref("MediaElementAudioSourceNode")}} sẽ phù hợp hơn. Bộ đệm chứa dạng sóng tín hiệu âm thanh được mã hóa dưới dạng một chuỗi biên độ theo định dạng sau: PCM tuyến tính IEEE754 32-bit không xen kẽ, với khoảng danh nghĩa từ `-1` đến `+1`; tức là một bộ đệm số thực dấu chấm động 32-bit, trong đó mỗi mẫu nằm giữa -1.0 và 1.0. Nếu `AudioBuffer` có nhiều kênh, chúng sẽ được lưu trong các bộ đệm riêng biệt.

## Bộ khởi tạo

- {{domxref("AudioBuffer.AudioBuffer", "AudioBuffer()")}}
  - : Tạo và trả về một thể hiện đối tượng `AudioBuffer` mới.

## Thuộc tính thể hiện

- {{domxref("AudioBuffer.sampleRate")}} {{ReadOnlyInline}}
  - : Trả về một số thực biểu diễn tần số lấy mẫu, tính theo số mẫu trên giây, của dữ liệu PCM được lưu trong bộ đệm.
- {{domxref("AudioBuffer.length")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên biểu diễn độ dài, tính theo khung mẫu, của dữ liệu PCM được lưu trong bộ đệm.
- {{domxref("AudioBuffer.duration")}} {{ReadOnlyInline}}
  - : Trả về một số thực kép biểu diễn thời lượng, tính bằng giây, của dữ liệu PCM được lưu trong bộ đệm.
- {{domxref("AudioBuffer.numberOfChannels")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên biểu diễn số lượng kênh âm thanh rời rạc được mô tả bởi dữ liệu PCM được lưu trong bộ đệm.

## Phương thức thể hiện

- {{domxref("AudioBuffer.getChannelData()")}}
  - : Trả về một {{jsxref("Float32Array")}} chứa dữ liệu PCM liên kết với kênh được xác định bởi tham số `channel` (với `0` là kênh đầu tiên).
- {{domxref("AudioBuffer.copyFromChannel()")}}
  - : Sao chép các mẫu từ kênh được chỉ định của `AudioBuffer` vào mảng `destination`.
- {{domxref("AudioBuffer.copyToChannel()")}}
  - : Sao chép các mẫu vào kênh được chỉ định của `AudioBuffer` từ mảng `source`.

## Ví dụ

Ví dụ đơn giản sau cho thấy cách tạo một `AudioBuffer` và điền vào đó nhiễu trắng ngẫu nhiên. Bạn có thể xem mã nguồn đầy đủ trong kho [webaudio-examples](https://github.com/mdn/webaudio-examples) của chúng tôi; cũng có một [phiên bản chạy trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer/).

```js
const audioCtx = new AudioContext();

// Tạo một bộ đệm stereo rỗng dài ba giây theo tần số lấy mẫu của AudioContext
const myArrayBuffer = audioCtx.createBuffer(
  2,
  audioCtx.sampleRate * 3,
  audioCtx.sampleRate,
);

// Điền nhiễu trắng vào bộ đệm;
// chỉ là các giá trị ngẫu nhiên giữa -1.0 và 1.0
for (let channel = 0; channel < myArrayBuffer.numberOfChannels; channel++) {
  // Đây là mảng thực sự chứa dữ liệu
  const nowBuffering = myArrayBuffer.getChannelData(channel);
  for (let i = 0; i < myArrayBuffer.length; i++) {
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
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
