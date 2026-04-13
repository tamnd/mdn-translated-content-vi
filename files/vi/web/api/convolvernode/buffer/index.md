---
title: "ConvolverNode: thuộc tính buffer"
short-title: buffer
slug: Web/API/ConvolverNode/buffer
page-type: web-api-instance-property
browser-compat: api.ConvolverNode.buffer
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`buffer`** của giao diện {{ domxref("ConvolverNode") }} biểu diễn một {{domxref("AudioBuffer")}} đơn âm, stereo hoặc 4 kênh chứa đáp ứng xung (có thể là đa kênh) mà `ConvolverNode` dùng để tạo hiệu ứng reverb.

Thông thường đây là một bản ghi đơn giản của âm thanh gần với một xung nhất có thể trong không gian mà bạn muốn mô phỏng. Ví dụ, nếu bạn muốn mô phỏng tiếng vang trong phòng tắm của mình, bạn có thể đặt một micro gần cửa để ghi lại tiếng nổ bóng bay hoặc xung tổng hợp phát ra từ bồn rửa. Bản ghi âm đó sau đó có thể được dùng làm bộ đệm.

Bộ đệm âm thanh này phải có cùng tốc độ lấy mẫu với `AudioContext`, nếu không một ngoại lệ sẽ được ném ra. Tại thời điểm thuộc tính này được đặt, bộ đệm và trạng thái của thuộc tính sẽ được dùng để cấu hình `ConvolverNode` với đáp ứng xung này cùng chế độ chuẩn hóa đã cho. Giá trị ban đầu của thuộc tính này là `null`.

## Giá trị

Một {{domxref("AudioBuffer")}}.

## Ví dụ

### Gán một bộ đệm âm thanh

Ví dụ sau tạo một nút convolver và gán cho nó một {{domxref("AudioBuffer")}}.

Để xem ví dụ ứng dụng đầy đủ hơn, hãy tham khảo bản demo [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi (xem [app.js](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js) để biết đoạn mã được trích bên dưới).

```js
const audioCtx = new AudioContext();
// …

const convolver = audioCtx.createConvolver();
// …

// Grab audio track via fetch() for convolver node
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

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
