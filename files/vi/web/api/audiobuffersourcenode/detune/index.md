---
title: "AudioBufferSourceNode: thuộc tính detune"
short-title: detune
slug: Web/API/AudioBufferSourceNode/detune
page-type: web-api-instance-property
browser-compat: api.AudioBufferSourceNode.detune
---

{{APIRef("Web Audio API")}}

Thuộc tính **`detune`** của giao diện {{domxref("AudioBufferSourceNode")}} là một {{domxref("AudioParam")}} [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) biểu diễn độ lệch tần của dao động tính theo [cent](https://en.wikipedia.org/wiki/Cent_%28music%29).

Ví dụ, các giá trị +100 và -100 sẽ tăng hoặc giảm độ lệch tần của nguồn đi một nửa cung, trong khi +1200 và -1200 sẽ tăng hoặc giảm đi một quãng tám.

## Giá trị

Một {{domxref("AudioParam")}} [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) mà giá trị của nó cho biết độ lệch tần của dao động tính theo [cent](https://en.wikipedia.org/wiki/Cent_%28music%29).

> [!NOTE]
> Mặc dù `AudioParam` được trả về là chỉ đọc, giá trị mà nó biểu diễn thì không phải.

## Ví dụ

```js
const audioCtx = new AudioContext();

const channelCount = 2;
const frameCount = audioCtx.sampleRate * 2.0; // 2 seconds

const myArrayBuffer = audioCtx.createBuffer(
  channelCount,
  frameCount,
  audioCtx.sampleRate,
);

for (let channel = 0; channel < channelCount; channel++) {
  const nowBuffering = myArrayBuffer.getChannelData(channel);
  for (let i = 0; i < frameCount; i++) {
    nowBuffering[i] = Math.random() * 2 - 1;
  }
}

const source = audioCtx.createBufferSource();
source.buffer = myArrayBuffer;
source.connect(audioCtx.destination);
source.detune.value = 100; // value in cents
source.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
