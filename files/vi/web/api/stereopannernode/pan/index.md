---
title: "StereoPannerNode: thuộc tính pan"
short-title: pan
slug: Web/API/StereoPannerNode/pan
page-type: web-api-instance-property
browser-compat: api.StereoPannerNode.pan
---

{{APIRef("Web Audio API")}}

Thuộc tính `pan` của giao diện {{ domxref("StereoPannerNode") }} là một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho lượng panning cần áp dụng. Giá trị có thể dao động giữa `-1` (pan trái hoàn toàn) và `1` (pan phải hoàn toàn).

## Giá trị

Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) chứa panning cần áp dụng.

> [!NOTE]
> Mặc dù `AudioParam` được trả về là chỉ đọc, giá trị nó đại diện thì không.

## Ví dụ

Xem [`BaseAudioContext.createStereoPanner()`](/en-US/docs/Web/API/BaseAudioContext/createStereoPanner#examples) để biết code ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
