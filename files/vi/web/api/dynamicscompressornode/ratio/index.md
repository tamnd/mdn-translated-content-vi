---
title: "DynamicsCompressorNode: thuộc tính ratio"
short-title: ratio
slug: Web/API/DynamicsCompressorNode/ratio
page-type: web-api-instance-property
browser-compat: api.DynamicsCompressorNode.ratio
---

{{ APIRef("Web Audio API") }}

Thuộc tính `ratio` của giao diện {{ domxref("DynamicsCompressorNode") }} là một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho lượng thay đổi, tính bằng dB, cần thiết ở đầu vào để tạo ra thay đổi 1 dB ở đầu ra.

Giá trị mặc định của thuộc tính `ratio` là `12` và có thể được đặt trong khoảng từ `1` đến `20`.

![Mô tả hiệu ứng của các tỉ lệ ratio khác nhau lên tín hiệu đầu ra](webaudioratio.png)

## Giá trị

Một {{domxref("AudioParam")}}.

> [!NOTE]
> Mặc dù {{domxref("AudioParam")}} được trả về là chỉ đọc, nhưng giá trị mà nó đại diện thì không phải.

## Ví dụ

```js
const audioCtx = new AudioContext();
const compressor = audioCtx.createDynamicsCompressor();
compressor.ratio.value = 12;
```

Xem [`BaseAudioContext.createDynamicsCompressor()`](/en-US/docs/Web/API/BaseAudioContext/createDynamicsCompressor#examples) để biết ví dụ đầy đủ hơn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
