---
title: "BaseAudioContext: phương thức createConvolver()"
short-title: createConvolver()
slug: Web/API/BaseAudioContext/createConvolver
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createConvolver
---

{{ APIRef("Web Audio API") }}

Phương thức `createConvolver()` của giao diện {{ domxref("BaseAudioContext") }}
tạo một {{ domxref("ConvolverNode") }}, thường được dùng để áp dụng hiệu ứng hồi âm cho âm thanh của bạn. Xem [định nghĩa Convolution trong đặc tả](https://webaudio.github.io/web-audio-api/#background-3) để biết thêm thông tin.

> [!NOTE]
> Hàm dựng {{domxref("ConvolverNode.ConvolverNode", "ConvolverNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("ConvolverNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createConvolver()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("ConvolverNode")}}.

## Ví dụ

### Tạo một convolver node

Ví dụ sau cho thấy cách dùng một AudioContext để tạo một convolver node.
Bạn tạo một {{domxref("AudioBuffer")}} chứa một mẫu âm thanh sẽ được dùng làm môi trường để định hình phép tích chập (gọi là _impulse response_) rồi áp dụng nó cho convolver. Ví dụ bên dưới dùng một mẫu ngắn tiếng đám đông trong phòng hòa nhạc, nên hiệu ứng hồi âm được áp dụng sẽ rất sâu và vang.

Để xem ví dụ/thông tin ứng dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi (xem [app.js](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js) để biết đoạn mã được trích bên dưới).

```js
const audioCtx = new AudioContext();
// …

const convolver = audioCtx.createConvolver();
// …

// Lấy track âm thanh qua fetch() cho convolver node
try {
  const response = await fetch(
    "https://mdn.github.io/voice-change-o-matic/audio/concert-crowd.ogg",
  );
  const arrayBuffer = await response.arrayBuffer();
  const decodedAudio = await audioCtx.decodeAudioData(arrayBuffer);
  convolver.buffer = decodedAudio;
} catch (error) {
  console.error(
    `Unable to fetch the audio file: ${name} Error: ${err.message}`,
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
