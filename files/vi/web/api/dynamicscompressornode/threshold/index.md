---
title: "DynamicsCompressorNode: thuộc tính threshold"
short-title: threshold
slug: Web/API/DynamicsCompressorNode/threshold
page-type: web-api-instance-property
browser-compat: api.DynamicsCompressorNode.threshold
---

{{ APIRef("Web Audio API") }}

Thuộc tính `threshold` của giao diện {{ domxref("DynamicsCompressorNode") }} là một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho giá trị decibel mà trên đó quá trình nén sẽ bắt đầu có hiệu lực.

Giá trị mặc định của thuộc tính `threshold` là `-24` và có thể được đặt trong khoảng từ `-100` đến `0`.

![Thuộc tính threshold không có hiệu lực với các tín hiệu thấp hơn giá trị của nó, nhưng gây ra giảm âm lượng với các tín hiệu mạnh hơn giá trị của nó.](webaudiothreshold.png)

## Giá trị

Một {{domxref("AudioParam")}}.

> [!NOTE]
> Mặc dù {{domxref("AudioParam")}} được trả về là chỉ đọc, nhưng giá trị mà nó đại diện thì không phải.

## Ví dụ

```js
const audioCtx = new AudioContext();
const compressor = audioCtx.createDynamicsCompressor();
compressor.threshold.value = -50;
```

Xem [`BaseAudioContext.createDynamicsCompressor()`](/en-US/docs/Web/API/BaseAudioContext/createDynamicsCompressor#examples) để biết ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
