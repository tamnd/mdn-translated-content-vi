---
title: "AudioListener: thuộc tính forwardY"
short-title: forwardY
slug: Web/API/AudioListener/forwardY
page-type: web-api-instance-property
browser-compat: api.AudioListener.forwardY
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc `forwardY` của giao diện {{ domxref("AudioListener") }} là một {{domxref("AudioParam")}} biểu diễn giá trị y của vector hướng xác định hướng tiến về phía trước mà listener đang hướng tới.

> [!NOTE]
> Tham số này là _a-rate_ khi được dùng với một {{domxref("PannerNode")}} có {{domxref("PannerNode.panningModel", "panningModel")}} được đặt thành `equalpower`, hoặc là _k-rate_ trong các trường hợp khác.

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
