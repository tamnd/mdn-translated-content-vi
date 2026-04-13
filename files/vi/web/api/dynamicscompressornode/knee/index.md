---
title: "DynamicsCompressorNode: thuộc tính knee"
short-title: knee
slug: Web/API/DynamicsCompressorNode/knee
page-type: web-api-instance-property
browser-compat: api.DynamicsCompressorNode.knee
---

{{ APIRef("Web Audio API") }}

Thuộc tính `knee` của giao diện {{ domxref("DynamicsCompressorNode") }} là một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) chứa giá trị decibel đại diện cho phạm vi trên ngưỡng mà đường cong chuyển tiếp mượt mà sang phần nén.

Giá trị mặc định của thuộc tính `knee` là `30` và có thể được đặt trong khoảng từ `0` đến `40`.

![Mô tả hiệu ứng của knee, hiển thị hai đường cong: một cho hard knee và một cho soft knee.](webaudioknee.png)

## Giá trị

Một {{domxref("AudioParam")}}.

> [!NOTE]
> Mặc dù {{domxref("AudioParam")}} được trả về là chỉ đọc, nhưng giá trị mà nó đại diện thì không phải.

## Ví dụ

```js
const audioCtx = new AudioContext();
const compressor = audioCtx.createDynamicsCompressor();
compressor.knee.value = 40;
```

Xem [`BaseAudioContext.createDynamicsCompressor()`](/en-US/docs/Web/API/BaseAudioContext/createDynamicsCompressor#examples) để biết ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
