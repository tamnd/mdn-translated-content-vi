---
title: "AudioNode: thuộc tính numberOfOutputs"
short-title: numberOfOutputs
slug: Web/API/AudioNode/numberOfOutputs
page-type: web-api-instance-property
browser-compat: api.AudioNode.numberOfOutputs
---

{{APIRef("Web Audio API")}}

Thuộc tính `numberOfOutputs` của giao diện {{ domxref("AudioNode") }} trả về số lượng đầu ra phát ra từ nút. Các nút đích, như {{domxref("AudioDestinationNode") }}, có giá trị 0 cho thuộc tính này.

## Giá trị

Một số nguyên ≥ 0.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode).connect(audioCtx.destination);

console.log(oscillator.numberOfOutputs); // 1
console.log(gainNode.numberOfOutputs); // 1
console.log(audioCtx.destination.numberOfOutputs); // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
