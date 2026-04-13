---
title: "PannerNode: panningModel property"
short-title: panningModel
slug: Web/API/PannerNode/panningModel
page-type: web-api-instance-property
browser-compat: api.PannerNode.panningModel
---

{{ APIRef("Web Audio API") }}

Thuộc tính `panningModel` của giao diện {{ domxref("PannerNode") }} là một giá trị liệt kê xác định thuật toán không gian hóa nào được dùng để định vị âm thanh trong không gian 3D.

Các giá trị có thể là:

- `equalpower`: Biểu diễn thuật toán panning công suất bằng nhau, thường được xem là đơn giản và hiệu quả. `equalpower` là giá trị mặc định.
- `HRTF`: Tạo đầu ra stereo chất lượng cao hơn `equalpower` - nó sử dụng phép tích chập với các phản hồi xung đo được từ con người.

## Giá trị

Một giá trị liệt kê, xem [`PanningModelType`](https://webaudio.github.io/web-audio-api/#idl-def-PanningModelType).

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
