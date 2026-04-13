---
title: "PannerNode: distanceModel property"
short-title: distanceModel
slug: Web/API/PannerNode/distanceModel
page-type: web-api-instance-property
browser-compat: api.PannerNode.distanceModel
---

{{ APIRef("Web Audio API") }}

Thuộc tính `distanceModel` của giao diện {{ domxref("PannerNode") }} là một giá trị liệt kê xác định thuật toán nào được dùng để giảm âm lượng của nguồn âm thanh khi nó di chuyển xa người nghe.

Các giá trị có thể là:

- `linear`: Mô hình khoảng cách tuyến tính tính toán hệ số khuếch đại do khoảng cách theo công thức:
  `1 - rolloffFactor * (distance - refDistance) / (maxDistance - refDistance)`
- `inverse`: Mô hình khoảng cách nghịch đảo tính toán hệ số khuếch đại do khoảng cách theo công thức:
  `refDistance / (refDistance + rolloffFactor * (Math.max(distance, refDistance) - refDistance))`
- `exponential`: Mô hình khoảng cách hàm mũ tính toán hệ số khuếch đại do khoảng cách theo công thức:
  `pow((Math.max(distance, refDistance) / refDistance, -rolloffFactor)`.

`inverse` là giá trị mặc định của `distanceModel`.

## Giá trị

Một giá trị liệt kê, xem [`DistanceModelType`](https://webaudio.github.io/web-audio-api/#idl-def-DistanceModelType).

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
