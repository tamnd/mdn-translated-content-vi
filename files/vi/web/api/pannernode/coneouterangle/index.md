---
title: "PannerNode: coneOuterAngle property"
short-title: coneOuterAngle
slug: Web/API/PannerNode/coneOuterAngle
page-type: web-api-instance-property
browser-compat: api.PannerNode.coneOuterAngle
---

{{ APIRef("Web Audio API") }}

Thuộc tính `coneOuterAngle` của giao diện {{ domxref("PannerNode") }} là một giá trị double mô tả góc, tính bằng độ, của hình nón bên ngoài mà ở đó âm lượng sẽ giảm đi một lượng không đổi, được xác định bởi thuộc tính {{domxref("PannerNode.coneOuterGain","coneOuterGain")}}.

Giá trị mặc định của thuộc tính `coneOuterAngle` là `0`.

## Giá trị

Một giá trị double.

## Ví dụ

Xem [`PannerNode.orientationX`](/en-US/docs/Web/API/PannerNode/orientationX#example) để có mã ví dụ minh họa hiệu ứng lên âm lượng khi thay đổi các tham số hướng của {{domxref("PannerNode")}} kết hợp với {{domxref("PannerNode.coneInnerAngle", "coneInnerAngle")}} và `coneOuterAngle`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
