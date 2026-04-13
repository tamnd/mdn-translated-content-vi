---
title: "GainNode: gain property"
short-title: gain
slug: Web/API/GainNode/gain
page-type: web-api-instance-property
browser-compat: api.GainNode.gain
---

{{ APIRef("Web Audio API") }}

Thuộc tính `gain` của giao diện {{ domxref("GainNode") }} là {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho lượng gain cần áp dụng.

## Giá trị

Một {{domxref("AudioParam")}}.

> [!NOTE]
> Mặc dù `AudioParam` được trả về là chỉ đọc, giá trị nó đại diện thì không phải vậy.

## Ví dụ

Xem [`BaseAudioContext.createGain()`](/en-US/docs/Web/API/BaseAudioContext/createGain#examples) để biết code ví dụ về cách sử dụng `AudioContext` để tạo `GainNode`, sau đó được sử dụng để tắt và bật âm thanh bằng cách thay đổi giá trị thuộc tính gain.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
