---
title: "AudioNode: thuộc tính numberOfInputs"
short-title: numberOfInputs
slug: Web/API/AudioNode/numberOfInputs
page-type: web-api-instance-property
browser-compat: api.AudioNode.numberOfInputs
---

{{APIRef("Web Audio API")}}

Thuộc tính `numberOfInputs` của giao diện {{domxref("AudioNode")}} trả về số lượng đầu vào cấp tín hiệu cho nút. Các nút nguồn được định nghĩa là những nút có thuộc tính `numberOfInputs` bằng 0.

## Giá trị

Một số nguyên ≥ 0.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode).connect(audioCtx.destination);

console.log(oscillator.numberOfInputs); // 0
console.log(gainNode.numberOfInputs); // 1
console.log(audioCtx.destination.numberOfInputs); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
