---
title: "AudioListener: thuộc tính upY"
short-title: upY
slug: Web/API/AudioListener/upY
page-type: web-api-instance-property
browser-compat: api.AudioListener.upY
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc `upY` của giao diện {{ domxref("AudioListener") }} là một {{domxref("AudioParam")}} biểu diễn giá trị y của vector hướng xác định hướng lên trên mà listener đang hướng tới.

> [!NOTE]
> Tham số này là _a-rate_ khi được dùng với một {{domxref("PannerNode")}} có {{domxref("PannerNode.panningModel", "PannerNode")}} được đặt thành `equalpower`, hoặc là _k-rate_ trong các trường hợp khác.

## Giá trị

Một {{domxref("AudioParam")}}. Giá trị mặc định của nó là 1 và có thể nằm trong khoảng từ âm vô cực đến dương vô cực.

## Ví dụ

Xem [`BaseAudioContext.createPanner()`](/en-US/docs/Web/API/BaseAudioContext/createPanner#examples) để có mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
