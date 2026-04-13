---
title: "BaseAudioContext: phương thức createBuffer()"
short-title: createBuffer()
slug: Web/API/BaseAudioContext/createBuffer
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createBuffer
---

{{ APIRef("Web Audio API") }}

Phương thức `createBuffer()` của giao diện {{ domxref("BaseAudioContext") }}
được dùng để tạo một đối tượng {{ domxref("AudioBuffer") }} mới, rỗng, sau đó có thể nạp dữ liệu vào và phát qua một {{ domxref("AudioBufferSourceNode")}}.

Để biết thêm chi tiết về bộ đệm âm thanh, hãy xem trang tham chiếu {{ domxref("AudioBuffer") }}.

> [!NOTE]
> Trước đây, `createBuffer()` có thể nhận dữ liệu nén và trả lại các mẫu đã giải mã, nhưng khả năng này đã bị loại khỏi đặc tả vì toàn bộ quá trình giải mã được thực hiện trên luồng chính, khiến `createBuffer()` chặn việc thực thi mã khác. Phương thức bất đồng bộ `decodeAudioData()` làm điều tương tự: nhận âm thanh nén, chẳng hạn như tệp MP3, rồi trực tiếp trả về một {{ domxref("AudioBuffer") }} mà bạn có thể phát qua {{ domxref("AudioBufferSourceNode") }}. Với các trường hợp sử dụng đơn giản như phát MP3, bạn nên dùng `decodeAudioData()`.

Để có giải thích chuyên sâu về cách bộ đệm âm thanh hoạt động, bao gồm ý nghĩa của các tham số, hãy đọc [Audio buffers: frames, samples and channels](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_buffers_frames_samples_and_channels) trong hướng dẫn Basic concepts của chúng tôi.

## Cú pháp

```js-nolint
createBuffer(numOfChannels, length, sampleRate)
```

### Tham số

- `numOfChannels`
  - : Một số nguyên biểu diễn số kênh mà bộ đệm này nên có. Giá trị mặc định là 1, và mọi user agent phải hỗ trợ ít nhất 32 kênh.
- `length`
  - : Một số nguyên biểu diễn kích thước của bộ đệm theo sample-frame (trong đó mỗi sample-frame bằng kích thước của một mẫu theo byte nhân với `numOfChannels`). Để xác định `length` cho một số giây âm thanh cụ thể, hãy dùng `numSeconds * sampleRate`.
- `sampleRate`
  - : Tốc độ lấy mẫu của dữ liệu âm thanh tuyến tính theo sample-frame mỗi giây. Mọi trình duyệt phải hỗ trợ ít nhất dải tốc độ lấy mẫu từ 8.000 Hz đến 96.000 Hz.

### Giá trị trả về

Một {{domxref("AudioBuffer")}} được cấu hình dựa trên các tùy chọn đã chỉ định.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu một hoặc nhiều tùy chọn có giá trị âm hoặc không hợp lệ theo cách khác (chẳng hạn `numberOfChannels` cao hơn mức được hỗ trợ, hoặc `sampleRate` nằm ngoài phạm vi danh nghĩa).
- {{jsxref("RangeError")}}
  - : Được ném ra nếu không đủ bộ nhớ để cấp phát bộ đệm.

## Ví dụ

Trước tiên là một vài ví dụ đơn giản để giúp giải thích cách các tham số được sử dụng:

```js
const audioCtx = new AudioContext();
const buffer = audioCtx.createBuffer(2, 22050, 44100);
```

Nếu bạn dùng lệnh gọi này, bạn sẽ có một bộ đệm stereo (hai kênh), khi phát trên AudioContext chạy ở 44100Hz (rất phổ biến, hầu hết card âm thanh thông thường đều chạy ở tốc độ này), sẽ kéo dài 0,5 giây: 22050 frame / 44100Hz = 0,5 giây.

```js
const audioCtx = new AudioContext();
const buffer = audioCtx.createBuffer(1, 22050, 22050);
```

Nếu bạn dùng lệnh gọi này, bạn sẽ có một bộ đệm mono (một kênh), khi phát trên `AudioContext` chạy ở 44100Hz sẽ tự động được _lấy mẫu lại_ thành 44100Hz (và do đó tạo ra 44100 frame), kéo dài 1,0 giây: 44100 frame / 44100Hz = 1 giây.

> [!NOTE]
> Việc lấy mẫu lại âm thanh rất giống thay đổi kích thước ảnh: giả sử bạn có một ảnh 16 x 16 nhưng muốn nó lấp đầy vùng 32 x 32; bạn sẽ đổi kích thước (lấy mẫu lại) nó. Kết quả có chất lượng thấp hơn (có thể mờ hoặc gắt, tùy thuật toán đổi kích thước), nhưng vẫn hoạt động và ảnh sau khi đổi kích thước chiếm ít dung lượng hơn. Âm thanh được lấy mẫu lại cũng tương tự như vậy: bạn tiết kiệm không gian, nhưng trên thực tế sẽ không thể tái tạo đúng nội dung tần số cao (âm treble).

Bây giờ hãy xem ví dụ `createBuffer()` phức tạp hơn, trong đó chúng ta tạo một bộ đệm dài ba giây, lấp đầy nó bằng nhiễu trắng, rồi phát nó qua một {{domxref("AudioBufferSourceNode")}}. Phần chú thích sẽ giải thích rõ những gì đang diễn ra.
Bạn cũng có thể [chạy mã trực tiếp](https://mdn.github.io/webaudio-examples/audio-buffer/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/audio-buffer/index.html).

```js
const audioCtx = new AudioContext();

// Tạo một bộ đệm stereo trống dài ba giây ở tốc độ lấy mẫu của AudioContext
const myArrayBuffer = audioCtx.createBuffer(
  2,
  audioCtx.sampleRate * 3,
  audioCtx.sampleRate,
);

// Lấp đầy bộ đệm bằng nhiễu trắng;
// chỉ là các giá trị ngẫu nhiên giữa -1.0 và 1.0
for (let channel = 0; channel < myArrayBuffer.numberOfChannels; channel++) {
  // Đây là ArrayBuffer thực sự chứa dữ liệu
  const nowBuffering = myArrayBuffer.getChannelData(channel);
  for (let i = 0; i < myArrayBuffer.length; i++) {
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
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
