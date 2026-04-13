---
title: "DynamicsCompressorNode: thuộc tính reduction"
short-title: reduction
slug: Web/API/DynamicsCompressorNode/reduction
page-type: web-api-instance-property
browser-compat: api.DynamicsCompressorNode.reduction
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc **`reduction`** của giao diện {{ domxref("DynamicsCompressorNode") }} là một float đại diện cho lượng giảm gain hiện đang được bộ nén áp dụng lên tín hiệu.

Được thiết kế cho mục đích đo lường, nó trả về giá trị tính bằng dB, hoặc `0` (không giảm gain) nếu không có tín hiệu nào được đưa vào `DynamicsCompressorNode`. Phạm vi của giá trị này là từ `-20` đến `0` (tính bằng dB).

## Giá trị

Một float.

## Ví dụ

```js
const audioCtx = new AudioContext();
const compressor = audioCtx.createDynamicsCompressor();
const myReduction = compressor.reduction;
```

Xem [`BaseAudioContext.createDynamicsCompressor()`](/en-US/docs/Web/API/BaseAudioContext/createDynamicsCompressor#examples) để biết ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
