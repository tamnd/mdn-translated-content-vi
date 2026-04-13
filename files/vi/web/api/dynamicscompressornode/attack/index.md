---
title: "DynamicsCompressorNode: thuộc tính attack"
short-title: attack
slug: Web/API/DynamicsCompressorNode/attack
page-type: web-api-instance-property
browser-compat: api.DynamicsCompressorNode.attack
---

{{ APIRef("Web Audio API") }}

Thuộc tính `attack` của giao diện {{ domxref("DynamicsCompressorNode") }} là một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho lượng thời gian, tính bằng giây, cần thiết để giảm gain xuống 10 dB. Nó xác định tốc độ tín hiệu được điều chỉnh khi âm lượng tăng lên.

Giá trị mặc định của thuộc tính `attack` là `0.003` và có thể được đặt trong khoảng từ `0` đến `1`.

## Giá trị

Một {{domxref("AudioParam")}}.

> [!NOTE]
> Mặc dù {{domxref("AudioParam")}} được trả về là chỉ đọc, nhưng giá trị mà nó đại diện thì không phải.

## Ví dụ

```js
const audioCtx = new AudioContext();
const compressor = audioCtx.createDynamicsCompressor();
compressor.attack.value = 0;
```

Xem [`BaseAudioContext.createDynamicsCompressor()`](/en-US/docs/Web/API/BaseAudioContext/createDynamicsCompressor#examples) để biết ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
