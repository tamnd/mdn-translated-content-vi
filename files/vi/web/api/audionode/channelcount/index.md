---
title: "AudioNode: thuộc tính channelCount"
short-title: channelCount
slug: Web/API/AudioNode/channelCount
page-type: web-api-instance-property
browser-compat: api.AudioNode.channelCount
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`channelCount`** của giao diện {{ domxref("AudioNode") }} biểu diễn một số nguyên dùng để xác định có bao nhiêu kênh được dùng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối tới bất kỳ đầu vào nào của nút.

Cách dùng và định nghĩa chính xác của `channelCount` phụ thuộc vào giá trị của {{domxref("AudioNode.channelCountMode")}}:

- Giá trị này bị bỏ qua nếu `channelCountMode` là `max`.
- Nó được dùng làm giá trị tối đa nếu `channelCountMode` là `clamped-max`.
- Nó được dùng làm giá trị chính xác nếu `channelCountMode` là `explicit`.

## Giá trị

Một số nguyên.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode);
gainNode.connect(audioCtx.destination);

oscillator.channelCount;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
