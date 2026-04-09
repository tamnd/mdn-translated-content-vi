---
title: "BaseAudioContext: thuộc tính destination"
short-title: destination
slug: Web/API/BaseAudioContext/destination
page-type: web-api-instance-property
browser-compat: api.BaseAudioContext.destination
---

{{ APIRef("Web Audio API") }}

Thuộc tính `destination` của {{ domxref("BaseAudioContext") }}
trả về một {{ domxref("AudioDestinationNode") }} biểu diễn đích cuối cùng
của mọi âm thanh trong ngữ cảnh. Nó thường đại diện cho một thiết bị kết xuất âm thanh thực tế như loa của thiết bị.

## Giá trị

Một {{ domxref("AudioDestinationNode") }}.

## Ví dụ

> [!NOTE]
> Để xem ví dụ/thông tin ứng dụng đầy đủ hơn, hãy xem bản demo [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [app.js dòng 108-193](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết phần mã liên quan).

```js
const audioCtx = new AudioContext();
// Các trình duyệt webkit/blink cũ yêu cầu tiền tố

const oscillatorNode = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillatorNode.connect(gainNode);
gainNode.connect(audioCtx.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
