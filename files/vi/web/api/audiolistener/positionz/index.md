---
title: "AudioListener: thuộc tính positionZ"
short-title: positionZ
slug: Web/API/AudioListener/positionZ
page-type: web-api-instance-property
browser-compat: api.AudioListener.positionZ
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc `positionZ` của giao diện {{ domxref("AudioListener") }} là một {{domxref("AudioParam")}} biểu diễn vị trí z của listener trong không gian Descartes 3D.

> [!NOTE]
> Tham số này là [_a-rate_](/en-US/docs/Web/API/AudioParam#a-rate) khi được dùng với một {{domxref("PannerNode")}} có {{domxref("PannerNode.panningModel", "PannerNode")}} được đặt thành `equalpower`, hoặc là [_k-rate_](/en-US/docs/Web/API/AudioParam#k-rate) trong các trường hợp khác.

## Giá trị

Một {{domxref("AudioParam")}}. Giá trị mặc định của nó là 0 và có thể nằm trong khoảng từ âm vô cực đến dương vô cực.

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
